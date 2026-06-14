#!/usr/bin/env python3
"""Auto-update versions and SHA256 hashes for Homebrew formulas and casks.

Supported update strategies (per formula):
  - github-release : query GitHub releases API (auto-detected from URL)
  - github-tag     : query GitHub tags API (for raw.githubusercontent.com URLs)
  - json-api       : fetch a JSON endpoint and extract the version field
  - sha-only       : keep version as-is, re-download and refresh SHA256
"""

import hashlib
import json
import os
import re
import sys
import urllib.error
import urllib.request
from pathlib import Path
from typing import Optional

REPO_ROOT = Path(__file__).parent.parent
GH_TOKEN = os.environ.get("GITHUB_TOKEN", "")

# Matches GitHub releases download URLs (may contain #{version} placeholders)
GH_RELEASES_URL_RE = re.compile(
    r'https://github\.com/([^/]+)/([^/]+)/releases/download/([^/"\']+)/([^"\']+)'
)

# Per-file custom update strategies for formulas that don't use GitHub releases.
# Keys are bare filenames (no directory), values are strategy dicts.
CUSTOM_CHECKERS = {
    # Cypress publishes current version in a JSON endpoint
    "cypress-desktop.rb": {
        "type": "json-api",
        "version_url": "https://download.cypress.io/desktop.json",
        "version_key": "version",
    },
    # notify-send is distributed via raw GitHub URL pointing at a tag
    "notify-send.rb": {
        "type": "github-tag",
        "repo": "fgrehm/vagrant-notify",
    },
    # Atlassian Companion: version scraped from release notes, SHA from the fixed "latest" URL
    "atlassian-companion.rb": {
        "type": "html-version",
        "page_url": "https://confluence.atlassian.com/doc/atlassian-companion-app-release-notes-958455712.html",
        "pattern": r"Atlassian Companion (\d+\.\d+\.\d+)",
        # URL in the formula is literal (no #{version}) so sha-only download applies
    },
    # KDE Connect: build number scraped from the CDN directory listing
    "kde-connect.rb": {
        "type": "html-version",
        "page_url": "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-arm64/",
        "pattern": r"kdeconnect-kde-master-(\d+)-macos-clang-arm64\.dmg",
    },
}


# ---------------------------------------------------------------------------
# HTTP helpers
# ---------------------------------------------------------------------------

def _fetch(url: str, timeout: int = 30) -> bytes:
    headers = {"User-Agent": "homebrew-custom-brews-updater"}
    if GH_TOKEN and "api.github.com" in url:
        headers["Authorization"] = f"Bearer {GH_TOKEN}"
        headers["Accept"] = "application/vnd.github+json"
        headers["X-GitHub-Api-Version"] = "2022-11-28"
    req = urllib.request.Request(url, headers=headers)
    with urllib.request.urlopen(req, timeout=timeout) as resp:
        return resp.read()


def github_api(path: str) -> dict:
    return json.loads(_fetch(f"https://api.github.com{path}"))


def sha256_of_url(url: str) -> Optional[str]:
    print(f"    downloading {url}")
    try:
        data = _fetch(url, timeout=120)
        return hashlib.sha256(data).hexdigest()
    except Exception as e:
        print(f"    download failed: {e}")
        return None


# ---------------------------------------------------------------------------
# Version source helpers
# ---------------------------------------------------------------------------

def latest_release_tag(owner: str, repo: str) -> Optional[str]:
    try:
        data = github_api(f"/repos/{owner}/{repo}/releases/latest")
        return data.get("tag_name")
    except urllib.error.HTTPError as e:
        print(f"    GitHub API error for {owner}/{repo}: HTTP {e.code}")
        return None
    except Exception as e:
        print(f"    error fetching release for {owner}/{repo}: {e}")
        return None


def latest_github_tag(owner: str, repo: str) -> Optional[str]:
    """Return the most recent tag (not necessarily a release)."""
    try:
        tags = github_api(f"/repos/{owner}/{repo}/tags")
        if tags:
            return tags[0]["name"]
        print(f"    no tags found for {owner}/{repo}")
        return None
    except Exception as e:
        print(f"    error fetching tags for {owner}/{repo}: {e}")
        return None


def version_from_json_api(version_url: str, version_key: str) -> Optional[str]:
    try:
        data = json.loads(_fetch(version_url))
        version = data.get(version_key)
        if not version:
            print(f"    key '{version_key}' not found in JSON response")
        return version
    except Exception as e:
        print(f"    error fetching {version_url}: {e}")
        return None


# ---------------------------------------------------------------------------
# Formula/cask parsing helpers
# ---------------------------------------------------------------------------

def find_url_sha_pairs(content: str, github_only: bool = True) -> list:
    """Return list of (url_template, sha256_hex) pairs.

    Handles both Formula style (url then sha256) and Cask style (sha256 then url).
    For multiple architectures, each url is matched to its nearest sha256 by line proximity.

    When github_only=True only URLs matching GH_RELEASES_URL_RE are included.
    When github_only=False any non-git URL is included.
    """
    lines = content.splitlines()
    urls_with_pos = []
    shas_with_pos = []

    for i, line in enumerate(lines):
        stripped = line.strip()
        url_m = re.match(r'url\s+["\'](.+?)["\']', stripped)
        if url_m:
            url = url_m.group(1)
            if github_only:
                if GH_RELEASES_URL_RE.search(url):
                    urls_with_pos.append((i, url))
            else:
                if not url.endswith(".git"):
                    urls_with_pos.append((i, url))
        sha_m = re.match(r'sha256\s+["\']([a-f0-9]{64})["\']', stripped)
        if sha_m:
            shas_with_pos.append((i, sha_m.group(1)))

    if not urls_with_pos or len(urls_with_pos) != len(shas_with_pos):
        return []

    if len(urls_with_pos) == 1:
        return [(urls_with_pos[0][1], shas_with_pos[0][1])]

    # Multiple architectures: match each url to its nearest sha256 by line distance
    pairs = []
    remaining = list(shas_with_pos)
    for url_pos, url in urls_with_pos:
        nearest = min(remaining, key=lambda s: abs(s[0] - url_pos))
        pairs.append((url, nearest[1]))
        remaining.remove(nearest)
    return pairs


def current_version(content: str) -> Optional[str]:
    m = re.search(r'version\s+["\']([^"\']+)["\']', content)
    return m.group(1) if m else None


def normalize_version(tag: str, current_ver: str) -> str:
    """Derive the formula's version string from a release/tag name."""
    tag_has_v = tag.startswith("v")
    cur_has_v = current_ver.startswith("v")
    if tag_has_v and not cur_has_v:
        return tag[1:]
    if not tag_has_v and cur_has_v:
        return "v" + tag
    return tag


def resolve_url(template: str, version: str) -> str:
    return template.replace("#{version}", version)


def apply_update(rb_file: Path, content: str, old_version: str, new_version: str,
                 sha_map: dict) -> bool:
    """Write updated content to rb_file. sha_map is {old_sha: new_sha}."""
    new_content = content
    if old_version != new_version:
        new_content = re.sub(
            r'(version\s+["\'])' + re.escape(old_version) + r'(["\'])',
            lambda m: m.group(1) + new_version + m.group(2),
            new_content,
        )
    for old_sha, new_sha in sha_map.items():
        new_content = new_content.replace(old_sha, new_sha)

    if new_content == content:
        print(f"  {rb_file.name}: no textual changes after update")
        return False
    rb_file.write_text(new_content)
    print(f"    updated {rb_file.name}")
    return True


# ---------------------------------------------------------------------------
# Per-strategy processors
# ---------------------------------------------------------------------------

def process_github_release(rb_file: Path) -> bool:
    """Handle formulas with github.com/*/releases/download/* URLs."""
    content = rb_file.read_text()

    pairs = find_url_sha_pairs(content, github_only=True)
    if not pairs:
        return False

    ver = current_version(content)
    if not ver:
        return False

    repos = set()
    for url_tmpl, _ in pairs:
        m = GH_RELEASES_URL_RE.search(url_tmpl)
        if m:
            repos.add((m.group(1), m.group(2)))
    if len(repos) != 1:
        print(f"  {rb_file.name}: multiple repos detected, skipping")
        return False

    owner, repo = next(iter(repos))
    print(f"  {rb_file.name}: checking {owner}/{repo} (current {ver})")

    tag = latest_release_tag(owner, repo)
    if not tag:
        return False

    new_ver = normalize_version(tag, ver)
    if new_ver == ver:
        print(f"    already up-to-date ({ver})")
        return False

    print(f"    update: {ver} → {new_ver}")
    sha_map = {}
    for url_tmpl, old_sha in pairs:
        new_url = resolve_url(url_tmpl, new_ver)
        new_sha = sha256_of_url(new_url)
        if new_sha is None:
            print(f"  {rb_file.name}: failed to fetch asset, aborting update")
            return False
        sha_map[old_sha] = new_sha

    return apply_update(rb_file, content, ver, new_ver, sha_map)


def process_github_tag(rb_file: Path, checker: dict) -> bool:
    """Handle formulas that use raw GitHub URLs versioned by tag."""
    content = rb_file.read_text()
    ver = current_version(content)
    if not ver:
        return False

    owner, repo = checker["repo"].split("/")
    print(f"  {rb_file.name}: checking tags for {owner}/{repo} (current {ver})")

    tag = latest_github_tag(owner, repo)
    if not tag:
        return False

    new_ver = normalize_version(tag, ver)
    if new_ver == ver:
        print(f"    already up-to-date ({ver})")
        return False

    print(f"    update: {ver} → {new_ver}")
    pairs = find_url_sha_pairs(content, github_only=False)
    if not pairs:
        print(f"  {rb_file.name}: no url/sha pairs found")
        return False

    sha_map = {}
    for url_tmpl, old_sha in pairs:
        new_url = resolve_url(url_tmpl, new_ver)
        new_sha = sha256_of_url(new_url)
        if new_sha is None:
            print(f"  {rb_file.name}: failed to fetch asset, aborting update")
            return False
        sha_map[old_sha] = new_sha

    return apply_update(rb_file, content, ver, new_ver, sha_map)


def process_json_api(rb_file: Path, checker: dict) -> bool:
    """Handle formulas whose version is published in a JSON endpoint."""
    content = rb_file.read_text()
    ver = current_version(content)
    if not ver:
        return False

    print(f"  {rb_file.name}: fetching version from {checker['version_url']}")
    new_ver = version_from_json_api(checker["version_url"], checker["version_key"])
    if not new_ver:
        return False

    if new_ver == ver:
        print(f"    already up-to-date ({ver})")
        return False

    print(f"    update: {ver} → {new_ver}")
    pairs = find_url_sha_pairs(content, github_only=False)
    if not pairs:
        print(f"  {rb_file.name}: no url/sha pairs found")
        return False

    sha_map = {}
    for url_tmpl, old_sha in pairs:
        new_url = resolve_url(url_tmpl, new_ver)
        new_sha = sha256_of_url(new_url)
        if new_sha is None:
            print(f"  {rb_file.name}: failed to fetch asset, aborting update")
            return False
        sha_map[old_sha] = new_sha

    return apply_update(rb_file, content, ver, new_ver, sha_map)


def version_from_html(page_url: str, pattern: str) -> Optional[str]:
    """Scrape a webpage and return the first match of pattern's capture group."""
    try:
        html = _fetch(page_url).decode("utf-8", errors="replace")
        # Strip scripts/styles to avoid false matches in JS bundles
        html = re.sub(r"<(script|style)[^>]*>.*?</(script|style)>", "", html, flags=re.DOTALL)
        m = re.search(pattern, html)
        if m:
            return m.group(1)
        print(f"    pattern not found on {page_url}")
        return None
    except Exception as e:
        print(f"    error scraping {page_url}: {e}")
        return None


def process_html_version(rb_file: Path, checker: dict) -> bool:
    """Scrape version from a webpage; SHA is re-fetched from the literal URL in the formula."""
    content = rb_file.read_text()
    ver = current_version(content)
    if not ver:
        return False

    print(f"  {rb_file.name}: scraping version from {checker['page_url']}")
    new_ver = version_from_html(checker["page_url"], checker["pattern"])
    if not new_ver:
        return False

    version_changed = new_ver != ver
    if version_changed:
        print(f"    version: {ver} → {new_ver}")
    else:
        print(f"    version unchanged ({ver})")

    # Always re-download the URL to refresh SHA (URL is literal, no #{version})
    pairs = find_url_sha_pairs(content, github_only=False)
    if not pairs:
        print(f"  {rb_file.name}: no url/sha pairs found")
        return False

    sha_map = {}
    for url_tmpl, old_sha in pairs:
        # Resolve #{version} with the new version (for versioned URLs like kde-connect)
        # or the current version (for literal URLs like atlassian-companion)
        resolved = resolve_url(url_tmpl, new_ver)
        new_sha = sha256_of_url(resolved)
        if new_sha is None:
            print(f"  {rb_file.name}: download failed, aborting")
            return False
        if new_sha != old_sha:
            sha_map[old_sha] = new_sha

    if not version_changed and not sha_map:
        print(f"    already up-to-date")
        return False

    return apply_update(rb_file, content, ver, new_ver, sha_map)


def process_sha_only(rb_file: Path) -> bool:
    """Re-download the URL (version unchanged) and refresh SHA256 if it changed."""
    content = rb_file.read_text()
    ver = current_version(content)
    if not ver:
        return False

    pairs = find_url_sha_pairs(content, github_only=False)
    if not pairs:
        return False

    print(f"  {rb_file.name}: refreshing SHA256 (version stays '{ver}')")
    sha_map = {}
    for url_tmpl, old_sha in pairs:
        resolved = resolve_url(url_tmpl, ver)
        new_sha = sha256_of_url(resolved)
        if new_sha is None:
            print(f"  {rb_file.name}: download failed, skipping")
            return False
        if new_sha != old_sha:
            sha_map[old_sha] = new_sha

    if not sha_map:
        print(f"    SHA unchanged, already up-to-date")
        return False

    return apply_update(rb_file, content, ver, ver, sha_map)


def process_custom(rb_file: Path, checker: dict) -> bool:
    t = checker["type"]
    if t == "json-api":
        return process_json_api(rb_file, checker)
    if t == "github-tag":
        return process_github_tag(rb_file, checker)
    if t == "html-version":
        return process_html_version(rb_file, checker)
    if t == "sha-only":
        return process_sha_only(rb_file)
    print(f"  {rb_file.name}: unknown checker type '{t}'")
    return False


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
    rb_files = sorted(
        list((REPO_ROOT / "Formula").glob("*.rb"))
        + list((REPO_ROOT / "Casks").glob("*.rb"))
    )

    updated = []
    for rb_file in rb_files:
        try:
            if rb_file.name in CUSTOM_CHECKERS:
                changed = process_custom(rb_file, CUSTOM_CHECKERS[rb_file.name])
            else:
                changed = process_github_release(rb_file)
            if changed:
                updated.append(rb_file.name)
        except Exception as e:
            print(f"  {rb_file.name}: unexpected error: {e}")

    if updated:
        print(f"\nUpdated {len(updated)} file(s): {', '.join(updated)}")
    else:
        print("\nNo updates found.")


if __name__ == "__main__":
    main()

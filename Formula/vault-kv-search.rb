class VaultKvSearch < Formula
  desc "vault-kv-search command line utiliy"
  homepage "https://github.com/xbglowx/vault-kv-search/releases"
  version "0.4.7"
  url "https://github.com/xbglowx/vault-kv-search/releases/download/v#{version}/vault-kv-search-darwin-amd64"
  sha256 "1136fba6903d4dc82a3701ac41ec2ad3d010532dab0ed7095baa11677bf16e8f"

  def install
    bin.mkpath
    prefix.install "vault-kv-search"
    mv "#{prefix}/vault-kv-search", "#{bin}/vault-kv-search"
  end

  test do
    system "script", "-q", "/dev/null", bin/"vault-kv-search"
  end
end

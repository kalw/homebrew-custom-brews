class VaultKvSearch < Formula
  desc "vault-kv-search command line utiliy"
  homepage "https://github.com/xbglowx/vault-kv-search/releases"
  version "0.7.1"
  url "https://github.com/xbglowx/vault-kv-search/releases/download/v#{version}/vault-kv-search-darwin-amd64"
  sha256 "64f410116acbd77e14461755d2c7384bded47b119a94b6f30d9f811a8680cf61"

  def install
    bin.mkpath
    prefix.install "vault-kv-search"
    mv "#{prefix}/vault-kv-search", "#{bin}/vault-kv-search"
  end

  test do
    system "script", "-q", "/dev/null", bin/"vault-kv-search"
  end
end

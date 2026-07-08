class VaultKvSearch < Formula
  desc "vault-kv-search command line utiliy"
  homepage "https://github.com/xbglowx/vault-kv-search/releases"
  version "0.4.6"
  url "https://github.com/xbglowx/vault-kv-search/releases/download/v#{version}/vault-kv-search-darwin-amd64"
  sha256 "f5dfb1e9fd06e18e5b38e4f39ad0f1ec36eea49a378e6d6f4724062470b4b55e"

  def install
    bin.mkpath
    prefix.install "vault-kv-search"
    mv "#{prefix}/vault-kv-search", "#{bin}/vault-kv-search"
  end

  test do
    system "script", "-q", "/dev/null", bin/"vault-kv-search"
  end
end

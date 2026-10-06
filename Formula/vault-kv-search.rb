class VaultKvSearch < Formula
  desc "vault-kv-search command line utiliy"
  homepage "https://github.com/xbglowx/vault-kv-search/releases"
  version "0.4.8"
  url "https://github.com/xbglowx/vault-kv-search/releases/download/v#{version}/vault-kv-search-darwin-amd64"
  sha256 "6c0b3df1bfb330f629c7afacb2107a2b2ea5d447ea2fec20a4f04e83895b1973"

  def install
    bin.mkpath
    prefix.install "vault-kv-search"
    mv "#{prefix}/vault-kv-search", "#{bin}/vault-kv-search"
  end

  test do
    system "script", "-q", "/dev/null", bin/"vault-kv-search"
  end
end

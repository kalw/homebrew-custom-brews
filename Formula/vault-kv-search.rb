class VaultKvSearch < Formula
  desc "vault-kv-search command line utiliy"
  homepage "https://github.com/xbglowx/vault-kv-search/releases"
  version "0.4.4"
  url "https://github.com/xbglowx/vault-kv-search/releases/download/v#{version}/vault-kv-search-darwin-amd64"
  sha256 "0ba5e81e1a4dd8fd41d7f9370307c7e143099d516c9ebd5feedf26ac4f0ea323"

  def install
    bin.mkpath
    prefix.install "vault-kv-search"
    mv "#{prefix}/vault-kv-search", "#{bin}/vault-kv-search"
  end

  test do
    system "script", "-q", "/dev/null", bin/"vault-kv-search"
  end
end

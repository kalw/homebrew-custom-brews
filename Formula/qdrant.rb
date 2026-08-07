class Qdrant < Formula
  desc "qdrant server"
  @@os="XXX"
  @@arch="XXX"
  version "1.19.0"
  on_macos do
    @@os="osx"
    if Hardware::CPU.arm?
      @@arch="arm64"
      url "https://github.com/qdrant/qdrant/releases/download/v#{version}/qdrant-aarch64-apple-darwin.tar.gz"
      sha256 "4e279a80cc1ebe73e859318ff86375af54c123887dd7ae46605c0eb6cb7c44e8"
    end

    if Hardware::CPU.intel?
      @@arch="x86_64"
      url "https://github.com/qdrant/qdrant/releases/download/v#{version}/qdrant-x86_64-apple-darwin.tar.gz"
      sha256 "e7afefcc125856157b33c6184c00ddee3f1d5b112474649070592d9fdd9a3f54"
    end
  end
  
  homepage "https://github.com/qdrant/qdrant"
  
  

  def install
    bin.mkpath
    prefix.install "qdrant"
    mv "#{prefix}/qdrant", "#{bin}/qdrant"
  end

  test do
    system "script", "-q", "/dev/null", bin/"qdrant"
  end
end

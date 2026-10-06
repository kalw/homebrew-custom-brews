class Qdrant < Formula
  desc "qdrant server"
  @@os="XXX"
  @@arch="XXX"
  version "1.19.2"
  on_macos do
    @@os="osx"
    if Hardware::CPU.arm?
      @@arch="arm64"
      url "https://github.com/qdrant/qdrant/releases/download/v#{version}/qdrant-aarch64-apple-darwin.tar.gz"
      sha256 "d24dfd25f4584684b337dd30ee016472cd25f53fc2501f1cd058ab3d7ee0b019"
    end

    if Hardware::CPU.intel?
      @@arch="x86_64"
      url "https://github.com/qdrant/qdrant/releases/download/v#{version}/qdrant-x86_64-apple-darwin.tar.gz"
      sha256 "e095b682ad7460baff43827eaa13647b5ec97c48edcb676646ae2f4108395044"
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

class Qdrant < Formula
  desc "qdrant server"
  @@os="XXX"
  @@arch="XXX"
  version "1.15.5"
  on_macos do
    @@os="osx"
    if Hardware::CPU.arm?
      @@arch="arm64"
      url "https://github.com/qdrant/qdrant/releases/download/v#{version}/qdrant-aarch64-apple-darwin.tar.gz"
      sha256 "e712f362e1e9aff18bb062f15c05fa384282ededc7d49f1935792cdc64e25222"
    end

    if Hardware::CPU.intel?
      @@arch="x86_64"
      url "https://github.com/qdrant/qdrant/releases/download/v#{version}/qdrant-amd64-apple-darwin.tar.gz"
      sha256 "b25f5512f2b696bae84752ff50752a77eec2ce6955e00847816e05c6344d6af9"
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

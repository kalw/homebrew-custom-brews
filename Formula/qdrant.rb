class Qdrant < Formula
  desc "qdrant server"
  @@os="XXX"
  @@arch="XXX"
  version "1.20.1"
  on_macos do
    @@os="osx"
    if Hardware::CPU.arm?
      @@arch="arm64"
      url "https://github.com/qdrant/qdrant/releases/download/v#{version}/qdrant-aarch64-apple-darwin.tar.gz"
      sha256 "5deb80dfa44afea90fa27bb3fcd269e60b1e88347e769f2547a0269aadb37003"
    end

    if Hardware::CPU.intel?
      @@arch="x86_64"
      url "https://github.com/qdrant/qdrant/releases/download/v#{version}/qdrant-x86_64-apple-darwin.tar.gz"
      sha256 "5f3ae5d62d476788f0c529b6f9276d5517e9c70b4707ef6374c1cceea4369597"
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

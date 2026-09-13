class Qdrant < Formula
  desc "qdrant server"
  @@os="XXX"
  @@arch="XXX"
  version "1.19.1"
  on_macos do
    @@os="osx"
    if Hardware::CPU.arm?
      @@arch="arm64"
      url "https://github.com/qdrant/qdrant/releases/download/v#{version}/qdrant-aarch64-apple-darwin.tar.gz"
      sha256 "e060209dfefc9d977ddcec48521349f505f8fd1ce21f2a3db444140870522fe4"
    end

    if Hardware::CPU.intel?
      @@arch="x86_64"
      url "https://github.com/qdrant/qdrant/releases/download/v#{version}/qdrant-x86_64-apple-darwin.tar.gz"
      sha256 "ba7cbada9a90aefdbd7f92de4e093cd25328206bd65e9e96657bd6133d272637"
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

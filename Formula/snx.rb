class Snx < Formula
  desc "Checkpoint SSL Network Extender command line client"
  homepage "https://checkpoint.com/"
  version "master"
  url "https://remote.fr.publicisgroupe.net/CSHELL/snx_install_osx.sh"
  sha256 "539574a0594590f280a6858e436072b8701188445973270c974d76c92e319369"

  bottle :unneeded
  
  
  def install
    prefix.install "snx_install_osx.sh"
    system "touch", "#{prefix}/extract.sh"
    ("#{prefix}/extract.sh").write <<~'EOS'
    tail -n +64 _PREFIX_/snx_install_osx.sh | bunzip2 -c - > _PREFIX_/brew.installer.s
    EOS
    inreplace "#{prefix}/extract.sh", "_PREFIX_", "#{prefix}"
    system "bash", "-x", "extract.sh"
    inreplace "#{prefix}/brew.installer.sh", /INSTALL_DIR=.*/, "INSTALL_DIR=#{prefix}"
    inreplace "#{prefix}/brew.installer.sh", "/etc/snx", "#{prefix}/etc/snx"
    inreplace "#{prefix}/brew.installer.sh", /TMP_DIR=.*/, "TMP_DIR=#{v}"
    system "bash", "-x", "#{prefix}/brew.installer.sh"
    bin.mkpath
    mv "#{opt_prefix}/snx", "#{bin}/snx"
  end

  test do
    system "script", "-q", "/dev/null", "/usr/local/bin/snx"
  end
end

class NotifySend < Formula
  desc "applescript notify-send ruby wrapper script"
  homepage "https://github.com/fgrehm/vagrant-notify/"
  version "v0.6.1"
  url "https://raw.githubusercontent.com/fgrehm/vagrant-notify/#{version}/examples/osx/applescript/notify-send.rb"
  sha256 "75f7013a538aa70493e9aa105a846a596f9425df0d2305bde65be6a98dfcb267"

  def install
    bin.mkpath
    prefix.install "notify-send.rb"
    mv "#{prefix}/notify-send.rb", "#{bin}/notify-send"
  end

  test do
    system "script", "-q", "/dev/null", bin/"notify-send"
  end
end

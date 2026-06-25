cask 'kde-connect' do
  version '6325'

  on_arm do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-arm64/kdeconnect-kde-master-#{version}-macos-clang-arm64.dmg"
    sha256 '7f908b07fa4ff005d276b2fdae7f24b7c3b7a1d26daa6f1b5e1a55b9d6ae29e1'
  end

  on_intel do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/kdeconnect-kde-master-#{version}-macos-clang-x86_64.dmg"
    sha256 'ae85dd5c14f703c85f3fb06b8510570d9df22c0bfa05d1bf893caab5e3040479'
  end

  name 'KDE Connect'
  homepage 'https://kdeconnect.kde.org/'

  app 'kdeconnect-indicator.app'
end

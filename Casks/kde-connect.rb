cask 'kde-connect' do
  version '6461'

  on_arm do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-arm64/kdeconnect-kde-master-#{version}-macos-clang-arm64.dmg"
    sha256 '9282cd9317298b1a7794f5f56181ed1fd11f7792663f9a4ef82d94f5299f63e2'
  end

  on_intel do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/kdeconnect-kde-master-#{version}-macos-clang-x86_64.dmg"
    sha256 'f34ae6cf5b6a0a44dafddbc4f2990be3b09cece9e41a08622b118a6db2337afa'
  end

  name 'KDE Connect'
  homepage 'https://kdeconnect.kde.org/'

  app 'kdeconnect-indicator.app'
end

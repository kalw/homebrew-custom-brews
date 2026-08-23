cask 'kde-connect' do
  version '6524'

  on_arm do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-arm64/kdeconnect-kde-master-#{version}-macos-clang-arm64.dmg"
    sha256 'cfe2c832fd88f8903894c868d26f2239d37a31a08c29a115d2cddc48ac5fb0d4'
  end

  on_intel do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/kdeconnect-kde-master-#{version}-macos-clang-x86_64.dmg"
    sha256 '26e86cc17b449ce80b3f6bee9017df9363972bfc311fa9b1dbc914ecab8a133a'
  end

  name 'KDE Connect'
  homepage 'https://kdeconnect.kde.org/'

  app 'kdeconnect-indicator.app'
end

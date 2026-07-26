cask 'kde-connect' do
  version '6400'

  on_arm do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-arm64/kdeconnect-kde-master-#{version}-macos-clang-arm64.dmg"
    sha256 'b32ce9f4e444ca22319c746523cea9c52c0706de2d7fc0d19746bd8e3f2d8ecd'
  end

  on_intel do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/kdeconnect-kde-master-#{version}-macos-clang-x86_64.dmg"
    sha256 '7d71e98b8fbd738aabd627f403f88eba600d0c4e0ed2a06c4ff0130635ddef85'
  end

  name 'KDE Connect'
  homepage 'https://kdeconnect.kde.org/'

  app 'kdeconnect-indicator.app'
end

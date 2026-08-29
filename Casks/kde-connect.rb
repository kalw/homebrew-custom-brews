cask 'kde-connect' do
  version '6542'

  on_arm do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-arm64/kdeconnect-kde-master-#{version}-macos-clang-arm64.dmg"
    sha256 '4e944929d97172c88ad841201991e8dfb229b14ee5a42642723e1a2d00c23e35'
  end

  on_intel do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/kdeconnect-kde-master-#{version}-macos-clang-x86_64.dmg"
    sha256 '7655dd67585ec346bf86426ecd8c428367313d1d4c92f59d396f9bf30b8ab7c3'
  end

  name 'KDE Connect'
  homepage 'https://kdeconnect.kde.org/'

  app 'kdeconnect-indicator.app'
end

cask 'kde-connect' do
  version '6561'

  on_arm do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-arm64/kdeconnect-kde-master-#{version}-macos-clang-arm64.dmg"
    sha256 '127631bd054a8cab61166b8b2ade16928797dc7a9eb9d971e5784cdbe80d1e23'
  end

  on_intel do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/kdeconnect-kde-master-#{version}-macos-clang-x86_64.dmg"
    sha256 '19f5ca14816c4101ac48e9a8fb7506d25e87e8ef1d8c3d8107d54260ef9fdf63'
  end

  name 'KDE Connect'
  homepage 'https://kdeconnect.kde.org/'

  app 'kdeconnect-indicator.app'
end

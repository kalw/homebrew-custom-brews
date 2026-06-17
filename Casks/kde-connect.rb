cask 'kde-connect' do
  version '6297'

  on_arm do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-arm64/kdeconnect-kde-master-#{version}-macos-clang-arm64.dmg"
    sha256 '53a5b080ca774d3554e5cc7fb0e99ab7360f51091efdb40f3b6d3df496fcc4d1'
  end

  on_intel do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/kdeconnect-kde-master-#{version}-macos-clang-x86_64.dmg"
    sha256 'f76a22b0f5f8bd700dc7b7cc86755b64ac4a973b5703c087323ba5721ad99c67'
  end

  name 'KDE Connect'
  homepage 'https://kdeconnect.kde.org/'

  app 'kdeconnect-indicator.app'
end

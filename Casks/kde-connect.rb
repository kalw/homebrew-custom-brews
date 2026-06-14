cask 'kde-connect' do
  version '6265'

  on_arm do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-arm64/kdeconnect-kde-master-#{version}-macos-clang-arm64.dmg"
    sha256 '92f9dba399c8edabda74e0ec987b12f851bbca2cde3647d876255d6fb7d15b4d'
  end

  on_intel do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/kdeconnect-kde-master-#{version}-macos-clang-x86_64.dmg"
    sha256 '66b08ab269cda6928d9fb7305d3b61dd669bceeffffa22656ad1f438f40ede58'
  end

  name 'KDE Connect'
  homepage 'https://kdeconnect.kde.org/'

  app 'kdeconnect-indicator.app'
end

cask 'kde-connect' do
  version '6388'

  on_arm do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-arm64/kdeconnect-kde-master-#{version}-macos-clang-arm64.dmg"
    sha256 'ff29a926373ec7afa1f067bdfafd99317de24f5e5ee74a815c7549e380a99768'
  end

  on_intel do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/kdeconnect-kde-master-#{version}-macos-clang-x86_64.dmg"
    sha256 '8faaec7d3720aac184a98b2260aec3ed1412d3daed5b269a41cfa83e2aa2c0ab'
  end

  name 'KDE Connect'
  homepage 'https://kdeconnect.kde.org/'

  app 'kdeconnect-indicator.app'
end

cask 'kde-connect' do
  version '6569'

  on_arm do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-arm64/kdeconnect-kde-master-#{version}-macos-clang-arm64.dmg"
    sha256 'cbe7ebb7ef175082385106e58d6f8f49ba52555ba7208bad298f5827e2df3f5f'
  end

  on_intel do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/kdeconnect-kde-master-#{version}-macos-clang-x86_64.dmg"
    sha256 '85eca2141ee3b17ffa5f62f60e03e6dca150490d9f4e45c7c44d3af240d69176'
  end

  name 'KDE Connect'
  homepage 'https://kdeconnect.kde.org/'

  app 'kdeconnect-indicator.app'
end

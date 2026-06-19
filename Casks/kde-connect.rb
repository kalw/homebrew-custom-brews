cask 'kde-connect' do
  version '6314'

  on_arm do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-arm64/kdeconnect-kde-master-#{version}-macos-clang-arm64.dmg"
    sha256 'afe80edd2b23ef0e77baa9fb448a88a9e8d62c80cf65a43e27edbc9dcf37dd43'
  end

  on_intel do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/kdeconnect-kde-master-#{version}-macos-clang-x86_64.dmg"
    sha256 '6bb1a1c38b0f0945d596866ea5a56a2967ce93becb7a417a782acae65a98a087'
  end

  name 'KDE Connect'
  homepage 'https://kdeconnect.kde.org/'

  app 'kdeconnect-indicator.app'
end

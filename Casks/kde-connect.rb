cask 'kde-connect' do
  version '6444'

  on_arm do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-arm64/kdeconnect-kde-master-#{version}-macos-clang-arm64.dmg"
    sha256 '8d6badb35bb4c56a2f00f5bedc1768cdf0a6c693e5ee7d67ef48306abfe86d4f'
  end

  on_intel do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/kdeconnect-kde-master-#{version}-macos-clang-x86_64.dmg"
    sha256 '25afcc44a84c2f1b82442be0b3a279a847e61876638172743d3e5fb7c2e8ee76'
  end

  name 'KDE Connect'
  homepage 'https://kdeconnect.kde.org/'

  app 'kdeconnect-indicator.app'
end

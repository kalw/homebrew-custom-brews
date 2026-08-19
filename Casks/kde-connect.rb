cask 'kde-connect' do
  version '6495'

  on_arm do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-arm64/kdeconnect-kde-master-#{version}-macos-clang-arm64.dmg"
    sha256 '37a701bf8b51e7470756e1c75d89232489d5c234fe4a4976688c32a2068eadf9'
  end

  on_intel do
    url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/kdeconnect-kde-master-#{version}-macos-clang-x86_64.dmg"
    sha256 '964d8799f6d3ed13bcd7f40c3a73322156ac307b967afe5876fe90d0fcf56378'
  end

  name 'KDE Connect'
  homepage 'https://kdeconnect.kde.org/'

  app 'kdeconnect-indicator.app'
end

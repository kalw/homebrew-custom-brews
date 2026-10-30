cask 'atlassian-companion' do
    version '3.3.0'
    sha256 'ba130a0dc8d88eee0086eff0cf95ded23fe1c24eedd410aca4accda20d68c033'

    # URL always points to "latest" on the nucleus server; version is tracked separately
    url "https://update-nucleus.atlassian.com/Atlassian-Companion/291cb34fe2296e5fb82b83a04704c9b4/latest/darwin/x64/Atlassian%20Companion.dmg"
    name 'Atlassian Companion'
    homepage 'https://confluence.atlassian.com/doc/atlassian-companion-app-release-notes-958455712.html'
  
    app 'Atlassian Companion.app'
  end

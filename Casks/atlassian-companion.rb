cask 'atlassian-companion' do
    version '3.2.0'
    sha256 'd84d334feaa6c113921a5cc4c741ab989bbc87f93895119e1decc095d6c9115f'

    # URL always points to "latest" on the nucleus server; version is tracked separately
    url "https://update-nucleus.atlassian.com/Atlassian-Companion/291cb34fe2296e5fb82b83a04704c9b4/latest/darwin/x64/Atlassian%20Companion.dmg"
    name 'Atlassian Companion'
    homepage 'https://confluence.atlassian.com/doc/atlassian-companion-app-release-notes-958455712.html'
  
    app 'Atlassian Companion.app'
  end

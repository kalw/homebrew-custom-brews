cask 'atlassian-companion' do
    version '3.4.0'
    sha256 '98b40e65fa3fde134688494c5b1b46f289d3e118a0ba4925d29e7c49617fc54e'

    # URL always points to "latest" on the nucleus server; version is tracked separately
    url "https://update-nucleus.atlassian.com/Atlassian-Companion/291cb34fe2296e5fb82b83a04704c9b4/latest/darwin/x64/Atlassian%20Companion.dmg"
    name 'Atlassian Companion'
    homepage 'https://confluence.atlassian.com/doc/atlassian-companion-app-release-notes-958455712.html'
  
    app 'Atlassian Companion.app'
  end

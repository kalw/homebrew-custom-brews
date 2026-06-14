cask 'qtscrcpy' do
    version 'v3.3.3'
    sha256 '2ed9e53285ba5504c55891e4cf0a6d74d6d2240cecfd04b2e53d09088277e252'
    
    # asset name includes Qt version (e.g. Qt5.15.2) which may change; verify on update
    url "https://github.com/barry-ran/QtScrcpy/releases/download/#{version}/QtScrcpy-mac-x64-Qt5.15.2-#{version}.dmg"
    name 'qtscrcpy'
    homepage 'https://github.com/barry-ran/QtScrcpy/'
  
    app 'QtScrcpy.app'
  end

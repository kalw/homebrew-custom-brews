cask 'qtscrcpy' do
    version 'v4.1.1'
    sha256 '3b872d35e26a6131f7db56bcf93ebfb47cc44c0da72c2665ef5887f3baa21aee'
    
    # asset name includes Qt version (e.g. Qt5.15.2) which may change; verify on update
    url "https://github.com/barry-ran/QtScrcpy/releases/download/#{version}/QtScrcpy-mac-x64-Qt5.15.2-#{version}.dmg"
    name 'qtscrcpy'
    homepage 'https://github.com/barry-ran/QtScrcpy/'
  
    app 'QtScrcpy.app'
  end

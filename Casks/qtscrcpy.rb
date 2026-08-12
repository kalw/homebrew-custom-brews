cask 'qtscrcpy' do
    version 'v4.1.0'
    sha256 'd3a186c70f01750227095b11fcb528104912631e67e1d130d990d3a8e1008c0d'
    
    # asset name includes Qt version (e.g. Qt5.15.2) which may change; verify on update
    url "https://github.com/barry-ran/QtScrcpy/releases/download/#{version}/QtScrcpy-mac-x64-Qt5.15.2-#{version}.dmg"
    name 'qtscrcpy'
    homepage 'https://github.com/barry-ran/QtScrcpy/'
  
    app 'QtScrcpy.app'
  end

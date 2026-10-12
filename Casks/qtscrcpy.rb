cask 'qtscrcpy' do
    version 'v4.2.1'
    sha256 'e95f23e11bcf225b28c85493936f2c6fb45c961f11f81d130ecec124e22f55fd'
    
    # asset name includes Qt version (e.g. Qt5.15.2) which may change; verify on update
    url "https://github.com/barry-ran/QtScrcpy/releases/download/#{version}/QtScrcpy-mac-x64-Qt5.15.2-#{version}.dmg"
    name 'qtscrcpy'
    homepage 'https://github.com/barry-ran/QtScrcpy/'
  
    app 'QtScrcpy.app'
  end

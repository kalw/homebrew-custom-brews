cask 'qtscrcpy' do
    version 'v4.2.0'
    sha256 '1df68bbe9b413bcdbfd5351360a0720e761e898131362edc3d3f6a99252e97b1'
    
    # asset name includes Qt version (e.g. Qt5.15.2) which may change; verify on update
    url "https://github.com/barry-ran/QtScrcpy/releases/download/#{version}/QtScrcpy-mac-x64-Qt5.15.2-#{version}.dmg"
    name 'qtscrcpy'
    homepage 'https://github.com/barry-ran/QtScrcpy/'
  
    app 'QtScrcpy.app'
  end

cask 'hyperion' do
    version '2.2.1'
    sha256 'b7eb3228757c525cf4a290ab275561ac44fb0617bb6e079c8d877890c5ccfe17'
    
    url "https://github.com/hyperion-project/hyperion.ng/releases/download/#{version}/Hyperion-#{version}-macOS-x86_64.dmg"
    name 'Hyperion Desktop app'
    homepage 'https://github.com/hyperion-project/hyperion.ng'
  
    app 'Hyperion.app'
  end

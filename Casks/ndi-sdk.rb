cask 'ndi-sdk' do
    version '4.5.1'
    sha256 '052bab2526667411e706207c3ce3e0d702c60fb00c2ba1822a64ef4eed96816a'
    
    url "https://ndi.palakis.fr/runtime/ndi-runtime-#{version}-macOS.pkg"
    name 'NDI-SDK'
    homepage 'https://ndi.palakis.fr/runtime/'
  
    pkg "ndi-runtime-#{version}-macOS.pkg", allow_untrusted: true
    
  end

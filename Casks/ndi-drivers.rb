cask 'ndi-drivers' do
    version '4.5.1'
    sha256 '052bab2526667411e706207c3ce3e0d702c60fb00c2ba1822a64ef4eed96816a'
    
    url "https://ndi.palakis.fr/tools/ndi-hx-driver-#{version}-macOS.pkg"
    name 'NDI-Tools'
    homepage 'https://ndi.palakis.fr/tools/'
  
    pkg "ndi-hx-driver-#{version}-macOS.pkg", allow_untrusted: true
    
  end

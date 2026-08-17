cask 'cypress-desktop' do

    version "15.20.1"
    url "https://cdn.cypress.io/desktop/#{version}/darwin-x64/cypress.zip"
    sha256 'c9d21dee019e414be565638e142a207c4e3bab368c4e0233549fb324d1ec5ed9'
    name 'Cypress desktop'
    homepage "https://www.cypress.io/"

    app "Cypress.app"

  end

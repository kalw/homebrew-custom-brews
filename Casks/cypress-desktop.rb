cask 'cypress-desktop' do

    version "16.0.0"
    url "https://cdn.cypress.io/desktop/#{version}/darwin-x64/cypress.zip"
    sha256 '9a6a77df40fb4747af132c389352d2b01f76cd276e7ac8283f8878e33b8229b5'
    name 'Cypress desktop'
    homepage "https://www.cypress.io/"

    app "Cypress.app"

  end

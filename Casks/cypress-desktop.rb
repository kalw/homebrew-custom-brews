cask 'cypress-desktop' do

    version "16.2.1"
    url "https://cdn.cypress.io/desktop/#{version}/darwin-x64/cypress.zip"
    sha256 '3a4cb4186f9406b0a6c6304271ade6fe6b2ad928115b1bb6aecc8e454f230855'
    name 'Cypress desktop'
    homepage "https://www.cypress.io/"

    app "Cypress.app"

  end

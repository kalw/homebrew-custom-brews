cask 'cypress-desktop' do

    version "15.17.0"
    url "https://cdn.cypress.io/desktop/#{version}/darwin-x64/cypress.zip"
    sha256 'e31a5ab8044908870fc5915377fff63001fbc0095e1ca55866df55c187865916'
    name 'Cypress desktop'
    homepage "https://www.cypress.io/"

    app "Cypress.app"

  end

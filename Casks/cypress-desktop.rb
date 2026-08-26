cask 'cypress-desktop' do

    version "15.21.1"
    url "https://cdn.cypress.io/desktop/#{version}/darwin-x64/cypress.zip"
    sha256 'f3f95f1437b332add9edd4914aaf656f66087eba3caa984b4b6c94f5eb31d3e1'
    name 'Cypress desktop'
    homepage "https://www.cypress.io/"

    app "Cypress.app"

  end

cask 'cypress-desktop' do

    version "15.18.1"
    url "https://cdn.cypress.io/desktop/#{version}/darwin-x64/cypress.zip"
    sha256 '332e363ad1b52831ebcedb5fd456d76b3d77300ada4d8f26630ed4fe40d8e131'
    name 'Cypress desktop'
    homepage "https://www.cypress.io/"

    app "Cypress.app"

  end

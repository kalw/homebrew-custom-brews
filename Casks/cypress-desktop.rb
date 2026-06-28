cask 'cypress-desktop' do

    version "15.18.0"
    url "https://cdn.cypress.io/desktop/#{version}/darwin-x64/cypress.zip"
    sha256 'cd0805a368428bb17c6114acfa330cd6729ef09d3c889426da3f955acfe9a9b5'
    name 'Cypress desktop'
    homepage "https://www.cypress.io/"

    app "Cypress.app"

  end

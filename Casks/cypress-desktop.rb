cask 'cypress-desktop' do

    version "16.2.0"
    url "https://cdn.cypress.io/desktop/#{version}/darwin-x64/cypress.zip"
    sha256 '68344416fe2a2a0d66941b210cba57ed713639c20a44778600604c33072cc1f7'
    name 'Cypress desktop'
    homepage "https://www.cypress.io/"

    app "Cypress.app"

  end

cask 'cypress-desktop' do

    version "16.3.0"
    url "https://cdn.cypress.io/desktop/#{version}/darwin-x64/cypress.zip"
    sha256 '0576d9fcad376bd88d901b9c3550091f7356d17f36d7b77ecc1ee7b9b4f8577a'
    name 'Cypress desktop'
    homepage "https://www.cypress.io/"

    app "Cypress.app"

  end

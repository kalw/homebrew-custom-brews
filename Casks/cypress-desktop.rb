cask 'cypress-desktop' do

    version "15.19.0"
    url "https://cdn.cypress.io/desktop/#{version}/darwin-x64/cypress.zip"
    sha256 '12f5449a1bdce005b52dc55344fed17f55d52c19a57c84bfff0ce5c82f501036'
    name 'Cypress desktop'
    homepage "https://www.cypress.io/"

    app "Cypress.app"

  end

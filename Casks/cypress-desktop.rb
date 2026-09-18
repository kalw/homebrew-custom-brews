cask 'cypress-desktop' do

    version "16.1.0"
    url "https://cdn.cypress.io/desktop/#{version}/darwin-x64/cypress.zip"
    sha256 '912dd5cf5fafab6d2099db1119790b9705110279648f2a3fb32305df1f48d8e5'
    name 'Cypress desktop'
    homepage "https://www.cypress.io/"

    app "Cypress.app"

  end

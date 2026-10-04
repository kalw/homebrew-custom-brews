cask 'cypress-desktop' do

    version "16.1.1"
    url "https://cdn.cypress.io/desktop/#{version}/darwin-x64/cypress.zip"
    sha256 'ddf047c516846e624558cd8d778dcfc3968abc86b3184948fe74b074344c1da3'
    name 'Cypress desktop'
    homepage "https://www.cypress.io/"

    app "Cypress.app"

  end

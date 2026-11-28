cask 'cypress-desktop' do

    version "16.4.0"
    url "https://cdn.cypress.io/desktop/#{version}/darwin-x64/cypress.zip"
    sha256 '7e85a56455164f32f8152c434a435277466e2b56414b31f621b4559db7ed99be'
    name 'Cypress desktop'
    homepage "https://www.cypress.io/"

    app "Cypress.app"

  end

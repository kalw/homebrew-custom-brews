cask 'cypress-desktop' do

    version "15.20.0"
    url "https://cdn.cypress.io/desktop/#{version}/darwin-x64/cypress.zip"
    sha256 '9b057450cfda7258067a53b7f44a357b93143aa6b7febef6b21155db77fad742'
    name 'Cypress desktop'
    homepage "https://www.cypress.io/"

    app "Cypress.app"

  end

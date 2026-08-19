cask 'cypress-desktop' do

    version "15.21.0"
    url "https://cdn.cypress.io/desktop/#{version}/darwin-x64/cypress.zip"
    sha256 'dd9da18db87514752503b8fb76c1a3ede28474bee666d952d31a28f66f047d49'
    name 'Cypress desktop'
    homepage "https://www.cypress.io/"

    app "Cypress.app"

  end

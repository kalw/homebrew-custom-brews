cask "station" do
  version "v3.3.0"
  sha256 "3e3b4373414b97cdd1c8420028d6a5903a8ecab2a019a20cfb5fe986f4b21487"

  # github.com/getstation/desktop-app-releases/ was verified as official when first introduced to the cask
  url "https://github.com/getstation/desktop-app/releases/download/#{version}/Station.zip"
  appcast "https://github.com/getstation/desktop-app/releases.atom"
  name "Station"
  desc "Browser that organizes all your web applications"
  homepage "https://getstation.com/"

  auto_updates true

  app "Station.app", target: "Station.app"

  uninstall quit: [
    "org.efounders.BrowserX",
    "org.efounders.BrowserX.helper",
  ]

  zap trash: [
    "~/Library/Application Support/Station/",
    "~/Library/Caches/org.efounders.BrowserX",
    "~/Library/Caches/org.efounders.BrowserX.ShipIt",
    "~/Library/Logs/Station",
    "~/Library/Preferences/org.efounders.BrowserX.helper.plist",
    "~/Library/Preferences/org.efounders.BrowserX.plist",
    "~/Library/Saved Application State/org.efounders.BrowserX.savedState",
  ]
end

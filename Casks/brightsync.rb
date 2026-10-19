cask "brightsync" do
  version "1.0"
  sha256 "c18951ca05f432d85b0669376b23045858624e7f26198203d2676e339eea878e"

  url "https://github.com/m-torun/brightsync/releases/download/v#{version}/BrightSync-#{version}.zip"
  name "BrightSync"
  desc "Mirrors one display's brightness and color preset onto other monitors"
  homepage "https://github.com/m-torun/brightsync"

  livecheck do
    url :url
    strategy :github_latest
  end

  # DDC here goes through IOAVService, which is Apple Silicon only.
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "BrightSync.app"

  uninstall quit: "app.brightsync.BrightSync"

  zap trash: [
    "~/Library/Logs/BrightSync.log",
    "~/Library/Preferences/app.brightsync.BrightSync.plist",
  ]

  caveats <<~CAVEAT
    BrightSync carries an ad-hoc signature rather than an Apple Developer ID,
    so macOS blocks its first launch. To allow it once:

      open /Applications/BrightSync.app

    then go to System Settings -> Privacy & Security and click "Open Anyway".
    Afterwards it launches normally, including at login.
  CAVEAT
end

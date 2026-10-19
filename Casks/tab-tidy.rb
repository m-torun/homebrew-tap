cask "tab-tidy" do
  version "1.0"
  sha256 "eca35db5b205e66b2d8e2829d910553dfa835ae74636a2d3e346c7e25de10c8e"

  url "https://github.com/m-torun/tab-tidy/releases/download/v#{version}/TabTidy-#{version}.zip"
  name "Tab Tidy"
  desc "Asks Claude which Chrome tabs to close, then closes the ones you approve"
  homepage "https://github.com/m-torun/tab-tidy"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The release is built for Apple Silicon.
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Tab Tidy.app"

  uninstall quit: "io.github.m-torun.TabTidy"

  zap trash: [
    "~/Library/Application Support/Tab Tidy",
    "~/Library/Preferences/io.github.m-torun.TabTidy.plist",
  ]

  caveats <<~CAVEAT
    Tab Tidy plans with Claude Code, so `claude` has to be installed and
    signed in:

      brew install --cask claude-code

    Tab Tidy carries an ad-hoc signature rather than an Apple Developer ID, so
    macOS blocks its first launch. To allow it once:

      open "/Applications/Tab Tidy.app"

    then go to System Settings -> Privacy & Security and click "Open Anyway".

    macOS will also ask whether Tab Tidy may control Google Chrome. That
    request returns after an upgrade, because each release is a new binary as
    far as macOS is concerned.
  CAVEAT
end

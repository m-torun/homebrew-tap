# m-torun/tap

Homebrew tap for my macOS apps and tools.

## Apps

```sh
brew tap m-torun/tap

brew install --cask brightsync
brew install --cask tab-tidy
```

Homebrew 7 no longer adds a third-party tap implicitly, so the `brew tap` line
is needed once; after that, installing anything from here is a single command.

| | |
|---|---|
| [brightsync](https://github.com/m-torun/brightsync) | Mirrors one display's brightness, and optionally its color preset, onto your other monitors over DDC/CI. Apple Silicon, macOS 13+. |
| [tab-tidy](https://github.com/m-torun/tab-tidy) | Asks Claude which Chrome tabs to close, shows you the plan, and closes the ones you approve. Needs Claude Code. Apple Silicon, macOS 13+. |

## Updating and removing

```sh
brew upgrade --cask brightsync
brew uninstall --cask brightsync          # removes the app
brew uninstall --zap --cask brightsync    # also removes its settings and data
```

## First launch

These apps are signed ad-hoc, not with a paid Apple Developer ID, so macOS
blocks the first launch with "the developer cannot be verified". Open the app
once, then allow it under **System Settings → Privacy & Security → Open
Anyway**. Each cask repeats this in its own caveats, and it is a one-time step
per version.

Properly signing and notarizing the apps would remove that step; it needs a
paid Apple Developer account, which these do not have.

Every cask here points at a release artifact built from the public source in
the matching repository, pinned by SHA256.

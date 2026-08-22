cask "configr" do
  # Placeholders. scripts/render-packaging.mjs rewrites both from the artifact
  # the release workflow just published, and refuses to emit a file where either
  # survived. They are deliberately absurd rather than a plausible stale
  # version, because a cask still carrying the previous release's numbers looks
  # perfectly installable and then fails on a checksum mismatch that reads to
  # the user like a corrupted download.
  #
  # Do not spell either placeholder out in a comment here: the renderer does a
  # whole-file replace, so prose that quotes one gets rewritten into nonsense,
  # and its presence check would be satisfied by the prose instead of by the
  # stanza it is meant to be guarding.
  version "0.2.2"
  sha256 "0d746f6b6c1db98d3adfb3b4c1f12b39c077f34909c5801a20767df23edd326c"

  url "https://github.com/danieldeusing/configr-releases/releases/download/v#{version}/Configr_#{version}_universal.dmg"
  name "Configr"
  desc "Capability browser for AI coding agents"
  homepage "https://github.com/danieldeusing/configr-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Configr ships a Tauri updater that replaces the bundle in place, so the
  # installed version drifts ahead of the cask by design. Without auto_updates,
  # `brew upgrade` would fight the in-app updater over /Applications/Configr.app.
  #
  # depends_on is bare, with no version floor, which is what `brew style`
  # autocorrects to. tauri.conf.json sets no bundle.macOS.minimumSystemVersion,
  # so the binary inherits Tauri's 10.13 default — a number nobody here has
  # tested against. Homebrew supports only the newest three macOS releases
  # anyway, so the real floor is enforced upstream; naming one would be invention.
  auto_updates true
  depends_on :macos

  app "Configr.app"

  # Everything the app writes outside its own bundle, keyed by the bundle
  # identifier in src-tauri/tauri.conf.json.
  zap trash: [
    "~/Library/Application Support/de.danieldeusing.configr",
    "~/Library/Caches/de.danieldeusing.configr",
    "~/Library/HTTPStorages/de.danieldeusing.configr",
    "~/Library/Preferences/de.danieldeusing.configr.plist",
    "~/Library/Saved Application State/de.danieldeusing.configr.savedState",
    "~/Library/WebKit/de.danieldeusing.configr",
  ]
end

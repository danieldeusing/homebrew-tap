# danieldeusing/homebrew-tap

Homebrew tap for [Configr](https://github.com/danieldeusing/configr-releases), a
desktop app that shows you everything your AI coding agents are configured to do.

```sh
brew install --cask danieldeusing/tap/configr
```

## Status

No Configr release has been published yet, so `Casks/configr.rb` does not exist
and the command above will report that the cask is unavailable. The cask appears
with the first `v*` tag and the command starts working then.

It is deliberately absent rather than committed with stand-in values: a cask that
exists is a cask Homebrew will try to install, and one pointing at a release that
was never published fails on a checksum mismatch that reads like a corrupted
download. "No such cask" is the more honest error.

## How this repo is maintained

`Casks/configr.rb` is written by Configr's release workflow once a release is
published, with `version` and `sha256` taken from the `.dmg` that was just
uploaded to
[danieldeusing/configr-releases](https://github.com/danieldeusing/configr-releases).

Do not edit the cask by hand. The next release overwrites it.

## Note on signing

Configr is not code-signed or notarized, so macOS may need an explicit approval
before it will launch the app the first time. The Configr install guide carries
the current steps.

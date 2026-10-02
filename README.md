# danieldeusing/homebrew-tap

Homebrew tap for [Configr](https://github.com/danieldeusing/configr-releases), a
desktop app that shows you everything your AI coding agents are configured to do.

```sh
brew install --cask danieldeusing/tap/configr
```

## How this repo is maintained

`Casks/configr.rb` is written by Configr's release workflow once a release is
published, with `version` and `sha256` taken from the `.dmg` that was just
uploaded to
[danieldeusing/configr-releases](https://github.com/danieldeusing/configr-releases).

Do not edit the cask by hand. The next release overwrites it.

## Signing

Configr's macOS build is signed with a Developer ID certificate and notarized by
Apple, so it opens without a Gatekeeper prompt.

## License

The cask is published under the [MIT License](LICENSE). Configr itself is not open
source; see [configr-releases](https://github.com/danieldeusing/configr-releases).

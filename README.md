# Homebrew Tap for dclaude

This is a Homebrew tap for installing `dclaude` and its various versions.

## Installation

### Add the tap

First, add this tap to your Homebrew installation:

```bash
brew tap jedi4ever/tap
```

### Install the latest version

```bash
brew install jedi4ever/tap/dclaude
```

Or after tapping, simply:

```bash
brew install dclaude
```

## Installing Specific Versions

To install a specific version of dclaude, use the versioned formula:

```bash
brew install jedi4ever/tap/dclaude@1.4.4
```

## Usage

After installation, you can use dclaude from anywhere:

```bash
dclaude --help
```

## Upgrading

To upgrade to the latest version:

```bash
brew upgrade dclaude
```

## Uninstalling

To uninstall dclaude:

```bash
brew uninstall dclaude
```

To uninstall a specific version:

```bash
brew uninstall dclaude@1.4.4
```

## Available Versions

- `dclaude` - Latest stable version (currently 1.4.4)
- `dclaude@1.4.4` - Version 1.4.4

## Troubleshooting

If you encounter any issues:

1. Update Homebrew: `brew update`
2. Check formula info: `brew info dclaude`
3. Reinstall: `brew reinstall dclaude`

## Contributing

To add a new version:

1. Update `Formula/dclaude.rb` for the latest version
2. Create versioned formulas like `Formula/dclaude@x.y.z.rb` for pinned versions
3. Update SHA256 checksums for all architectures

## More Information

For more about dclaude, visit: https://github.com/jedi4ever/dclaude

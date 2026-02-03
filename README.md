# Homebrew Tap for addt

This is a Homebrew tap for installing `addt` and its various versions.

## Installation

### Add the tap

First, add this tap to your Homebrew installation:

```bash
brew tap jedi4ever/tap
```

### Install the latest version

```bash
brew install jedi4ever/tap/addt
```

Or after tapping, simply:

```bash
brew install addt
```

## Installing Specific Versions

To install a specific version of addt, use the versioned formula:

```bash
brew install jedi4ever/tap/addt@0.0.1
```

## Usage

After installation, you can use addt from anywhere:

```bash
addt --help
addt --addt-version
```

## Upgrading

To upgrade to the latest version:

```bash
brew upgrade addt
```

## Uninstalling

To uninstall dclaude:

```bash
brew uninstall addt
```

To uninstall a specific version:

```bash
brew uninstall addt@0.0.1
```

## Available Versions

- `addt` - Latest stable version (currently 0.0.2)
- `addt@0.0.1` - Version 0.0.1

## Troubleshooting

If you encounter any issues:

1. Update Homebrew: `brew update`
2. Check formula info: `brew info addt`
3. Reinstall: `brew reinstall addt`

## Contributing

To add a new version:

1. Update `Formula/addt.rb` for the latest version
2. Create versioned formulas like `Formula/addt@x.y.z.rb` for pinned versions
3. Update SHA256 checksums for all architectures

## More Information

For more about addt, visit: https://github.com/jedi4ever/addt

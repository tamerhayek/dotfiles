# Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Check if Homebrew is installed

```bash
brew update
brew upgrade
```

## Install dependencies

```bash
xargs brew install <~/dotfiles/macos/dependencies/brew.txt
```

Cleanup

```bash
brew autoremove && brew cleanup
```
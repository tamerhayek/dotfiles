# macOS

## Post-install

### Install Apps

#### Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Check if Homebrew is installed

```bash
brew update
brew upgrade
```

#### Install dependencies

```bash
xargs brew install <~/dotfiles/macos/dependencies/brew.txt
```

Cleanup

```bash
brew autoremove && brew cleanup
```

#### Install mas-cli

Skip if already installed using `brew.txt` deps

```bash
brew install mas
```

Install apps

```bash
xargs mas install <~/dotfiles/macos/dependencies/mas.txt
```

#### ONLY FOR XCODE

```bash
sudo xcodebuild -license accept
```

### Create directories

Make `bin` directory for user executables

```bash
mkdir -p ~/bin
```

### Link dotfiles

#### Fastfetch

if files exist, remove them

```bash
rm ~/.config/fastfetch/config.jsonc
```

then create symlinks

```bash
mkdir -p ~/.config/fastfetch
ln -s ~/dotfiles/global/.config/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
```

#### Powerlevel10k

if files exist, remove them

```bash
rm ~/.p10k.zsh
```

then create symlinks

```bash
ln -s ~/dotfiles/global/.p10k.zsh ~/.p10k.zsh
```

#### nvmrc

if files exist, remove them

```bash
rm ~/.nvmrc
```

then create symlinks

```bash
ln -s ~/dotfiles/global/.nvmrc ~/.nvmrc
```

#### Codium

if files exist, remove them

```bash
rm ~/Library/Application\ Support/VSCodium/User/settings.json
```

then create symlinks

```bash
ln -s ~/dotfiles/global/codium/settings.json ~/Library/Application\ Support/VSCodium/User/settings.json
```

#### Gitconfig

if files exist, remove them

```bash
rm ~/.gitconfig
```

then create symlinks

```bash
ln -s ~/dotfiles/macos/data/.gitconfig ~/.gitconfig
```

#### zshrc

if files exist, remove them

```bash
rm ~/.zshrc
```

then create symlinks

```bash
ln -s ~/dotfiles/macos/data/.zshrc ~/.zshrc
```

### Setup apps

#### Node

```bash
cat ~/.nvmrc | xargs fnm install
```

```bash
cat ~/dotfiles/global/dependencies/npm.txt | xargs npm install -g
corepack enable
```

#### VSCodium extensions

```bash
cat ~/dotfiles/global/codium/extensions.txt | xargs -n 1 codium --install-extension
```

#### GH CLI

Login

```bash
gh auth login
```

Set Editor

```bash
gh config set editor codium
```

Extensions

```bash
gh extension install meiji163/gh-notify
```

Add aliases

```bash
gh alias delete --all

gh alias set notifications 'notify -sn 10'
gh alias set issues 'search issues --assignee=@me --state=open'
gh alias set prs 'search prs --assignee=@me --state=open'
```

### Source

```bash
source ~/.zshrc
```
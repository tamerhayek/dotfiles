echo "Updating..."
~/.dotfiles/scripts/update.ps1

echo "Setting dotfiles..."
~/.dotfiles/scripts/dotfiles.ps1

echo "Configuring tools..."

echo "Installing vscode-vscodium extensions..."
cat ~/.dotfiles/deps/vscodium.txt | ForEach-Object { codium --install-extension $_ }

echo "Installing Node..."
fnm install $(cat ~/.nvmrc)
fnm use $(cat ~/.nvmrc)

echo "installing NPM packages..."
cat ~/.dotfiles/deps/npm.txt | ForEach-Object { npm install -g $_ }

echo "Installing wsl..."
~/.dotfiles/scripts/wsl.ps1
echo "Updating..."
~/.dotfiles/scripts/update.ps1

echo "Setting dotfiles..."
~/.dotfiles/scripts/dotfiles.ps1

echo "Configuring tools..."

echo "Installing vscode-vscodium extensions..."
cat ~/.dotfiles/deps/vscodium.txt | ForEach-Object { codium --install-extension $_ }
echo "Installing and upgrading apps..."

winget source update

winget import $env:USERPROFILE\.dotfiles\deps\winget.json --accept-source-agreements --accept-package-agreements

winget upgrade --all

echo "Setting dotfiles..."

~/.dotfiles/scripts/dotfiles.ps1

echo "Configuring tools..."

echo "Installing vscode-vscodium extensions..."
cat ~/.dotfiles/deps/vscodium.txt | ForEach-Object { codium --install-extension $_ }
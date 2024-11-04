#!/bin/zsh

# Sync dotfiles
echo "Syncing dotfiles..."

echo "Linking ~/.dotfiles/data/.config/alacritty/* to ~/.config/alacritty..."
mkdir -p ~/.config/alacritty/themes
ln -s ~/.dotfiles/data/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -s ~/.dotfiles/data/.config/alacritty/themes/dracula.toml ~/.config/alacritty/themes/dracula.toml
echo "Done!"

echo "Linking ~/.dotfiles/data/.config/fastfetch/* to ~/.config/fastfetch..."
mkdir -p ~/.config/fastfetch
ln -s ~/.dotfiles/data/.config/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
echo "Done!"

echo "Linking ~/.dotfiles/data/.gitconfig to ~/.gitconfig..."
ln -s ~/.dotfiles/data/.gitconfig ~/.gitconfig
echo "Done!"

echo "Linking ~/.dotfiles/data/.zshrc to ~/.zshrc..."
ln -s ~/.dotfiles/data/.zshrc ~/.zshrc
echo "Done!"

echo "Linking ~/.dotfiles/data/.p10k.zsh to ~/.p10k.zsh..."
ln -s ~/.dotfiles/data/.p10k.zsh ~/.p10k.zsh
echo "Done!"

echo "Linking ~/.dotfiles/data/.nvmrc to ~/.nvmrc..."
ln -s ~/.dotfiles/data/.nvmrc ~/.nvmrc
echo "Done!"

echo "Linking ~/.dotfiles/codium/settings.json to ~/Library/Application\ Support/VSCodium/User/settings.json..."
ln -s ~/.dotfiles/data/codium/settings.json ~/Library/Application\ Support/VSCodium/User/settings.json
echo "Done!"

source ~/.zshrc
#!/bin/zsh

# Sync dotfiles
echo "Syncing dotfiles..."

echo "Linking ~/.dotfiles/data/.config/* to ~/.config..."
ln -s ~/.dotfiles/data/.config/alacritty ~/.config/alacritty
ln -s ~/.dotfiles/data/.config/fastfetch ~/.config/fastfetch
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

source ~/.zshrc
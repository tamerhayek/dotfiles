echo "Syncing Dotfiles..."

# Sync dotfiles
echo "Copying ~/.dotfiles/data/.config/* to ~/.config..."
cp -r ~/.dotfiles/data/.config/* ~/.config/
echo "Done!"

echo "Copying ~/.dotfiles/data/.gitconfig to ~/.gitconfig..."
cp ~/.dotfiles/data/.gitconfig ~/.gitconfig
echo "Done!"

echo "Copying ~/.dotfiles/data/.zshrc to ~/.zshrc..."
cp ~/.dotfiles/data/.zshrc ~/.zshrc
echo "Done!"

echo "Copying ~/.dotfiles/data/.p10k.zsh to ~/.p10k.zsh..."
cp ~/.dotfiles/data/.p10k.zsh ~/.p10k.zsh
echo "Done!"

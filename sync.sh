echo "Syncing Dotfiles..."

# Sync dotfiles
echo "Copying ~/.dotfiles/.config/* to ~/.config..."
cp -r ~/.dotfiles/.config/* ~/.config/
echo "Done!"

echo "Copying ~/.dotfiles/.gitconfig to ~/.gitconfig..."
cp ~/.dotfiles/.gitconfig ~/.gitconfig
echo "Done!"

echo "Copying ~/.dotfiles/.zshrc to ~/.zshrc..."
cp ~/.dotfiles/.zshrc ~/.zshrc
echo "Done!"

echo "Copying ~/.dotfiles/.p10k.zsh to ~/.p10k.zsh..."
cp ~/.dotfiles/.p10k.zsh ~/.p10k.zsh
echo "Done!"

BACKUP_TIME=$(date "+%Y_%m_%d_%H%M%S")
echo "Backing up ~/.dotfiles to ~/.dotfiles/backups/data-$BACKUP_TIME..."
mkdir -p ~/.dotfiles/backups/data-$BACKUP_TIME
mkdir -p ~/.dotfiles/backups/data-$BACKUP_TIME/.config
cp -r ~/.config/alacritty ~/.dotfiles/backups/data-$BACKUP_TIME/.config/alacritty/
cp -r ~/.config/fastfetch ~/.dotfiles/backups/data-$BACKUP_TIME/.config/fastfetch/
cp -r ~/.gitconfig ~/.dotfiles/backups/data-$BACKUP_TIME
cp -r ~/.zshrc ~/.dotfiles/backups/data-$BACKUP_TIME
cp -r ~/.p10k.zsh ~/.dotfiles/backups/data-$BACKUP_TIME
cp -r ~/.nvmrc ~/.dotfiles/backups/data-$BACKUP_TIME
echo "Done!"

echo ""

# Sync dotfiles
echo "Syncing dotfiles..."

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

echo "Copying ~/.dotfiles/data/.nvmrc to ~/.nvmrc..."
cp ~/.dotfiles/data/.nvmrc ~/.nvmrc
echo "Done!"

if [ -z "$1" ];
  then
    exec /bin/zsh
fi
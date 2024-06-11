echo "Machine Setup"

echo ""

echo "Backing up dotfiles to ~/.dotfiles/backups/data-<time>..."
BACKUP_TIME=$(date "+%Y_%m_%d_%H%M%S")
echo "Backing up ~/.dotfiles to ~/.dotfiles/backups/data-$BACKUP_TIME..."
mkdir -p ~/.dotfiles/backups/data-$BACKUP_TIME
mkdir -p ~/.dotfiles/backups/data-$BACKUP_TIME/.config
cp -r ~/.config/alacritty ~/.dotfiles/backups/data-$BACKUP_TIME/.config/alacritty
cp -r ~/.gitconfig ~/.dotfiles/backups/data-$BACKUP_TIME
cp -r ~/.zshrc ~/.dotfiles/backups/data-$BACKUP_TIME
cp -r ~/.p10k.zsh ~/.dotfiles/backups/data-$BACKUP_TIME
cp -r ~/.nvmrc ~/.dotfiles/backups/data-$BACKUP_TIME
echo "Done!"

echo ""

# Sync dotfiles
echo "Syncing Dotfiles..."

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

echo ""

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	# Linux
	echo "Syncing Linux..."

	echo ""
elif [[ "$OSTYPE" == "darwin"* ]]; then
	# Mac OSX
	echo "Syncing MacOS..."

	echo ""

	which -s brew
	if [[ $? != 0 ]]; then
		# Install Homebrew
		echo "Installing Homebrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	else
		echo "Homebrew is installed!"
		brew update
	fi

	echo ""

	# Install brew packages
	echo "Installing brew packages..."
	xargs brew install <~/.dotfiles/brew.txt

	brew autoremove
	brew cleanup

	echo ""

	# Install Node
	echo "Install Node from NVM"
	export NVM_DIR=~/.nvm
	source ~/.nvm/nvm.sh
	nvm install

	echo ""

	# Install global npm packages
	echo "Installing global npm packages..."
	cat ~/.dotfiles/npm.txt | xargs npm install -g
fi

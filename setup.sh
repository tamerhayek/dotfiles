echo "Syncing Dotfiles..."

echo ""

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

echo "Copying ~/.dotfiles/data/.nvmrc to ~/.nvmrc..."
cp ~/.dotfiles/data/.nvmrc ~/.nvmrc
echo "Done!"

echo ""

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	# Linux
	echo "Syncing Linux..."
elif [[ "$OSTYPE" == "darwin"* ]]; then
	# Mac OSX
	echo "Syncing MacOS..."

	which -s brew
	if [[ $? != 0 ]]; then
		# Install Homebrew
		echo "Installing Homebrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	else
		echo "Homebrew is installed!"
		brew update
	fi

	echo "Installing brew packages..."
	xargs brew install <~/.dotfiles/brew.txt

	brew autoremove
	brew cleanup

	# Install Node
	echo "Install Node from NVM"
	export NVM_DIR=~/.nvm
	source ~/.nvm/nvm.sh
	nvm install

	# Install global npm packages
	echo "Installing global npm packages..."
	cat ~/.dotfiles/npm.txt | xargs npm install -g
fi

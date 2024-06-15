echo "Machine Setup"

echo ""

~/.dotfiles/scripts/dotfiles.sh

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

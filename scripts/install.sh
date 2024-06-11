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
	xargs brew install < ~/.dotfiles/brew.txt

	brew autoremove
	brew cleanup
fi
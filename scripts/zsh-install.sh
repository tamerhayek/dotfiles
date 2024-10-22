if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	# Linux
	echo "Installing zsh..."

	echo ""

	if [ "$(which dnf)" != "" ]; then
		sudo dnf install zsh
		chsh -s $(which zsh)
	fi
fi
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	# Linux
	echo "Installing zsh..."

	echo ""

	PS3="Select the distro: "
	select opt in Fedora; do
		case $opt in
			Fedora)
				echo ""

				sudo dnf install zsh
				chsh -s $(which zsh)

				break
				;;
			*)
				echo "Invalid option $REPLY"
				;;
		esac
	done
fi
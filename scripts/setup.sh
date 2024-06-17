echo "Machine Setup"

echo ""

echo "Installing OS deps..."

echo ""

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	# Linux
	echo "Syncing Linux..."

	PS3="Select the distro: "
	select opt in Fedora Quit; do
		case $opt in
			Fedora)
				echo "Syncing $opt..."
				break
				;;
			Quit)
				break
				;;
			*)
				echo "Invalid option $REPLY"
				;;
		esac
	done
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
fi

echo ""

~/.dotfiles/scripts/dotfiles.sh

echo ""

# OS agnostic commands

echo "Configuring tools..."

echo ""

# Install Node
echo "Install Node from NVM..."
export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh
nvm install

echo ""

# Install global npm packages
echo "Installing global npm packages..."
cat ~/.dotfiles/npm.txt | xargs npm install -g

echo ""

# gh config

echo "Configuring gh..."

gh config set editor code

# gh aliases

gh alias delete --all

gh alias set n 'notify -s'
gh alias set i 'search issues --assignee=@me --state=open'
gh alias set p 'search prs --assignee=@me --state=open'

# Install gh extensions

gh extension install dlvhdr/gh-dash
gh extension install meiji163/gh-notify
gh extension install vilmibm/gh-screensaver

echo ""
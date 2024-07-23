#!/bin/zsh

fastfetch

echo ""

echo "--------------------------"

echo ""

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	# Linux
	PS3="Select the distro: "
	select opt in Fedora Quit; do
		case $opt in
			Fedora)
				sudo dnf update
				sudo flatpak update
				break
				;;
			*)
				echo "Invalid option $REPLY"
				;;
		esac
	done
elif [[ "$OSTYPE" == "darwin"* ]]; then
	# Mac OSX
	brew update
fi

echo ""

echo "--------------------------"

echo ""

# Colors for terminal echo
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "${RED}Github Notifications${NC}"

echo ""

gh notify -sn 10

echo ""

echo "--------------------------"

echo ""

echo "${RED}Github Issues${NC}"

echo ""

gh search issues --assignee=@me --state=open

echo ""

echo "--------------------------"

echo ""

echo "${RED}Github PRs${NC}"

echo ""

gh search prs --assignee=@me --state=open

echo ""
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf update
sudo dnf upgrade --refresh

xargs sudo dnf install -y < ~/dotfiles/linux/fedora/dependencies/dnf.txt
xargs sudo dnf install -y < ~/dotfiles/linux/fedora/dependencies/rpm.txt
xargs flatpak install -y < ~/dotfiles/linux/fedora/dependencies/flatpak.txt

rm -f -- ~/.gitconfig
ln -s ~/dotfiles/linux/fedora/data/.gitconfig ~/.gitconfig

rm -f -- ~/.var/app/com.vscodium.codium/config/VSCodium/User/settings.json
ln -s ~/dotfiles/global/codium/settings.json ~/.var/app/com.vscodium.codium/config/VSCodium/User/settings.json
rm -f -- ~/.var/app/com.vscodium.codium/config/VSCodium/User/keybindings.json
ln -s ~/dotfiles/linux/fedora/data/codium/keybindings.json ~/.var/app/com.vscodium.codium/config/VSCodium/User/keybindings.json

xargs -n 1 flatpak run com.vscodium.codium --install-extension < ~/dotfiles/global/codium/extensions.txt

rm -f -- ~/.zshrc
ln -s ~/dotfiles/linux/fedora/data/.zshrc ~/.zshrc

rm -f -- ~/.p10k.zsh
ln -s ~/dotfiles/global/.p10k.zsh ~/.p10k.zsh

curl -fsSL https://fnm.vercel.app/install | zsh -s -- --skip-shell
source ~/.zshrc
rm -f -- ~/.nvmrc
ln -s ~/dotfiles/global/.nvmrc ~/.nvmrc
fnm install

xargs npm install -g < ~/dotfiles/global/dependencies/npm.txt
corepack enable pnpm

rm -f -- ~/.config/fastfetch/config.jsonc
mkdir -p ~/.config/fastfetch
ln -s ~/dotfiles/global/.config/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc

source ~/.zshrc
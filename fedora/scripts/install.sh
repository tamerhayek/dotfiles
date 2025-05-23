cd

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf-3 config-manager --add-repo https://download.docker.com/fedora/docker-ce.repo

sudo dnf update
sudo dnf upgrade --refresh

xargs sudo dnf install -y < ~/dotfiles/fedora/dependencies/dnf.txt
xargs sudo dnf install -y < ~/dotfiles/fedora/dependencies/rpm.txt
xargs flatpak install -y < ~/dotfiles/fedora/dependencies/flatpak.txt

rm -f -- ~/.gitconfig
ln -s ~/dotfiles/fedora/data/.gitconfig ~/.gitconfig

rm -f -- ~/.var/app/com.vscodium.codium/config/VSCodium/User/settings.json
ln -s ~/dotfiles/global/codium/settings.json ~/.var/app/com.vscodium.codium/config/VSCodium/User/settings.json
rm -f -- ~/.var/app/com.vscodium.codium/config/VSCodium/User/keybindings.json
ln -s ~/dotfiles/fedora/data/codium/keybindings.json ~/.var/app/com.vscodium.codium/config/VSCodium/User/keybindings.json

xargs -n 1 flatpak run com.vscodium.codium --install-extension < ~/dotfiles/global/codium/extensions.txt

rm -f -- ~/.zshrc
ln -s ~/dotfiles/fedora/data/.zshrc ~/.zshrc

rm -f -- ~/.p10k.zsh
ln -s ~/dotfiles/global/.p10k.zsh ~/.p10k.zsh

if ! command -v fnm &> /dev/null; then
    curl -fsSL https://fnm.vercel.app/install | zsh -s -- --skip-shell
    source ~/.zshrc
fi

rm -f -- ~/.nvmrc
ln -s ~/dotfiles/global/.nvmrc ~/.nvmrc
fnm install

xargs npm install -g < ~/dotfiles/global/dependencies/npm.txt
corepack enable pnpm

source ~/.zshrc
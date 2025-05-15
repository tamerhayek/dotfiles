# Fedora

## Enable rpmfusion repos

```bash
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

```bash
sudo dnf upgrade --refresh
```

then reboot.

## OS Apps

### DNF

```bash
xargs sudo dnf install -y < ~/dotfiles/linux/fedora/dependencies/dnf.txt
```

Install rpm packages from urls

```bash
xargs sudo dnf install -y < ~/dotfiles/linux/fedora/dependencies/rpm.txt
```

#### NVIDIA Drivers

Install nvidia drivers.

```bash
sudo dnf install gcc kernel-headers kernel-devel akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-libs.i686
```

Wait for the installation to finish. You can check using `modinfo -F version nvidia` command.
It should return you driver version. If it shows ERROR: Module nvidia not found - modules are still building, keep waiting.

### Flatpak

```bash
xargs flatpak install -y < ~/dotfiles/linux/fedora/dependencies/flatpak.txt
```

### Docker

```bash
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

Install lazydocker

```bash
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | zsh
```

## Config

### GRUB

```bash
sudo dnf install grub-customizer
```

then change grub config:

1. `GRUB_ENABLE_BLSCFG=false`
2. `GRUB_DEFAULT="saved"`
3. `GRUB_SAVEDEFAULT=true`
4. `GRUB_TIMEOUT="-1"`

```bash
sudo nano /etc/default/grub
```

then reload grub config

```bash
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

and open grub-customizer.

TIP: Don't move UEFI Firmware settings inside a submenu. It will break!

TIP 2: After customizing GRUB, it will boot directly into fedora. So run this command to fix this behaviour.

```bash
sudo grub2-editenv - unset menu_auto_hide
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

#### Install Dedsec Theme

[Github](https://github.com/VandalByte/dedsec-grub2-theme/tree/main)

```bash
git clone --depth 1 https://github.com/VandalByte/dedsec-grub2-theme.git && cd dedsec-grub2-theme
sudo python3 dedsec-theme.py --install
```

Choose Compact Theme (A).

### SSH

Create config file `~/ssh/config`

```
# Github

Host github.com
	Hostname github.com
	AddKeysToAgent yes
	IdentityFile ~/.ssh/github
	User git

# Servers

Host server
	HostName 1.1.1.1
	IdentityFile ~/.ssh/server
	User user

```

Create ssh keys

```bash
ssh-keygen -t ed25519 -C "label"
```

Re-clone this repo using ssh via github.

### Git

```bash
rm -f -- ~/.gitconfig
ln -s ~/dotfiles/linux/fedora/data/.gitconfig ~/.gitconfig
```

### VSCodium

```bash
rm -f -- ~/.var/app/com.vscodium.codium/config/VSCodium/User/settings.json
ln -s ~/dotfiles/global/codium/settings.json ~/.var/app/com.vscodium.codium/config/VSCodium/User/settings.json
```

Configure keybindings

```bash
rm -f -- ~/.var/app/com.vscodium.codium/config/VSCodium/User/keybindings.json
ln -s ~/dotfiles/linux/fedora/data/codium/keybindings.json ~/.var/app/com.vscodium.codium/config/VSCodium/User/keybindings.json
```

Install extensions

```bash
xargs -n 1 flatpak run com.vscodium.codium --install-extension < ~/dotfiles/global/codium/extensions.txt
```

### ZSH

Download it

```bash
sudo dnf install -y zsh
```

Make it default

```bash
chsh -s $(which zsh)
```

Install `oh-my-zsh`

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Download Powerlevel10k

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Then change in `.zshrc`

```
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Download fonts and install them manually.

```bash
cd ~/Downloads
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
```

Link the `.zshrc` file

```bash
rm -f -- ~/.zshrc
ln -s ~/dotfiles/linux/fedora/data/.zshrc ~/.zshrc
```

Link the `.p10k.zsh` file

```bash
rm -f -- ~/.p10k.zsh
ln -s ~/dotfiles/global/.p10k.zsh ~/.p10k.zsh
```

### Node

Install `fnm`

```bash
curl -fsSL https://fnm.vercel.app/install | zsh
source ~/.zshrc
```

Setup node

```bash
rm -f -- ~/.nvmrc
ln -s ~/dotfiles/global/.nvmrc ~/.nvmrc
fnm install
```

Install npm deps

```bash
xargs npm install -g < ~/dotfiles/global/dependencies/npm.txt
corepack enable pnpm
```

### Fastfetch

```bash
rm -f -- ~/.config/fastfetch/config.jsonc
mkdir -p ~/.config/fastfetch
ln -s ~/dotfiles/global/.config/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
```

### Extension Manager

Download extensions:

- Blur my Shell
- Clipboard History
- Dash to Dock
- Auto Move Windows
- Caffeine
- Vitals
- Media Controls
- User Themes
- Extension List

Enable System Extensions:

- AppIndicator and KStatusNotifierItemSupport

### Tweaks

- Keyboard
	- Additional Layout Options
		- Ctrl position -> Swap Left Alt with Left Ctrl
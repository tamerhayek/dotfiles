# Archlinux

## Installation

### (Optional) Connect to the wireless network

```bash
iwctl
```

```bash
device list
```

```bash
station <device-name> get-networks
```

```bash
station <device-name> connect <network-name>
```

And then exit.

### Mirrorlist setup

```bash
reflector --sort rate --latest 20 --protocol https --save /etc/pacman.d/mirrorlist
```

### Archinstall

```bash
archinstall
```

-   Locales -> Keyboard
-   Disk configuration -> Partitioning -> Use a best effort partitioning scheme -> Select disk -> btrfs -> Yes submodules -> Use compression
-   Bootloader -> Grub
-   Hostname -> archlinux-<device>
-   Root password
-   User -> <username> -> Sudo user
-   Profile -> Type -> Desktop -> Gnome
-   Audio -> Pipewire
-   Network -> Use NetworkManager
-   Additional packages -> git flatpak firefox
-   Optional repositories -> multilib
-   Timezone -> Europe/Rome (use /rome to find the timezone)

-> install -> yes

-> no chroot -> reboot

## Post-install

### Mirrorlist update

```bash
sudo pacman -S reflector
sudo reflector --sort rate --latest 20 --protocol https --save /etc/pacman.d/mirrorlist
```

### Apps

#### Pacman

```bash
sudo pacman -S - < ~/dotfiles/linux/archlinux/dependencies/pacman.txt
```

##### ONLY FOR NVIDIA

```bash
sudo pacman -S nvidia nvidia-utils nvidia-settings lib32-nvidia-utils
```

#### Yay

```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

```bash
yay - < ~/dotfiles/linux/archlinux/dependencies/yay.txt
```

#### Flatpak

```bash
xargs flatpak install -y < ~/dotfiles/linux/archlinux/dependencies/flatpak.txt
```

### Update grub config

```bash
sudo nano /etc/default/grub
```

Uncomment `GRUB_DISABLE_OS_PROBER=false`.

```bash
sudo update-grub
```

#### Only for NVIDIA

3. (only nvidia) Append to `GRUB_CMDLINE_LINUX_DEFAULT` `splash nvidia-drm.fbdev=1`

Update MKINITCPIO

```bash
sudo nano /etc/mkinitcpio.conf
```

1. Find `MODULES=(...)` and add `nvidia nvidia_modeset nvidia_uvm nvidia_drm`
2. Find `HOOKS=(...)` and remove `kms` from it

Then run

```bash
sudo mkinitcpio -P
```

Add pacman hook

```bash
cd ~
wget https://raw.githubusercontent.com/korvahannu/arch-nvidia-drivers-installation-guide/main/nvidia.hook
sudo mkdir -p /etc/pacman.d/hooks && sudo mv nvidia.hook /etc/pacman.d/hooks/
```

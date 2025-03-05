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

- Locales -> Keyboard
- Disk configuration -> Partitioning -> Use a best effort partitioning scheme -> Select disk -> btrfs -> Yes submodules -> Use compression
- Bootloader -> Grub
- Hostname -> archlinux-<device>
- Root password
- User -> <username> -> Sudo user
- Profile -> Type -> Desktop -> Gnome
- Audio -> Pipewire
- Network -> Use NetworkManager
- Additional packages -> git flatpak
- Optional repositories -> multilib
- Timezone -> Europe/Rome (use /rome to find the timezone)

-> install -> yes

-> no chroot -> reboot

## Post-install

### CachyOS repositories

```bash
wget https://mirror.cachyos.org/cachyos-repo.tar.xz
tar xf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh
```

When it asks for upgrade, answer no.

### Yay

```bash
sudo pacman -S yay
```

### Pacman (CachyOS)

```bash
yay pacman
```

-> select the cachyos pacman (2)

### Chaotic AUR

```bash
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
```

Insall gedit via pacman

```bash
sudo pacman -S gedit
```

```bash
sudo gedit /etc/pacman.conf
```

Find cachyos include mirrorlist lines, move them to the end after removing the last comment block, and add the Chaotic AUR lines.

```bash
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
```

```bash
sudo pacman -Sy
```

### CachyOS Kernel

```bash
sudo pacman -S cachyos-kernel-manager gnome-terminal
```

Open the app and select the cachyos-v3/linux-cachyos kernel (stable) -> execute

```bash
sudo pacman -S linux-cachyos-headers cachyos-settings
```

#### ONLY FOR NVIDIA - CachyOS nvidia-open
```bash
sudo pacman -S linux-cachyos-nvidia-open nvidia-utils nvidia-settings lib32-nvidia-utils
```

### OS Deps

```bash
sudo pacman -S usbutils less dkms bc
```

### Mirrorlist update

```bash
sudo pacman -S reflector
sudo reflector --sort rate --latest 20 --protocol https --save /etc/pacman.d/mirrorlist
```

### Update-grub

```bash
yay update-grub
```

-> select the chaotic aur (2)

```bash
sudo update-grub
```

### Other apps

```bash
sudo pacman -S - < ~/dotfiles/linux/archlinux/dependencies/pacman.txt
```

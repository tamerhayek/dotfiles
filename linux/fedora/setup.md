# Fedora

## OS Deps

### Enable rpmfusion repos

```bash
sudo dnf install \   https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \   https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

### Update deps

```bash
sudo dnf upgrade --refresh
```

then reboot.

### ONLY FOR NVIDIA

Install nvidia drivers.

```bash
sudo dnf install gcc kernel-headers kernel-devel akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-libs.i686
```

Wait for the installation to finish. You can check using `modinfo -F version nvidia` command.
It should return you driver version. If it shows ERROR: Module nvidia not found - modules are still building, keep waiting.

## Grub config

```bash
sudo nano /etc/default/grub
```

1. `GRUB_TIMEOUT=5`
2. `GRUB_TIMEOUT_STYLE=menu`
3. `GRUB_DISABLE_OS_PROBER=false`.

Reload config using

```bash
sudo grub2-editenv - unset menu_auto_hide
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

## Install packages

DNF

```bash
xargs sudo dnf install -y < ~/dotfiles/linux/fedora/dependencies/dnf.txt
```

Flatpak

```bash
xargs flatpak install -y < ~/dotfiles/linux/archlinux/dependencies/flatpak.txt
```

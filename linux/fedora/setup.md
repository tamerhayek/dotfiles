# Fedora

## Enable rpmfusion repos

```bash
sudo dnf install \   https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \   https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
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

#### NVIDIA Drivers

Install nvidia drivers.

```bash
sudo dnf install gcc kernel-headers kernel-devel akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-libs.i686
```

Wait for the installation to finish. You can check using `modinfo -F version nvidia` command.
It should return you driver version. If it shows ERROR: Module nvidia not found - modules are still building, keep waiting.

### Flatpak

```bash
xargs flatpak install -y < ~/dotfiles/linux/archlinux/dependencies/flatpak.txt
```


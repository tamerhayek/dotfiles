# Packages

## Enable rpmfusion repos

```bash
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

```bash
sudo dnf upgrade --refresh
```

then reboot.

## DNF

```bash
xargs sudo dnf install -y < ~/dotfiles/fedora/dependencies/dnf.txt
```

Install rpm packages from urls

```bash
xargs sudo dnf install -y < ~/dotfiles/fedora/dependencies/rpm.txt
```

## Flatpak

```bash
xargs flatpak install -y < ~/dotfiles/fedora/dependencies/flatpak.txt
```


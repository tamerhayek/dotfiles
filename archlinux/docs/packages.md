# Apps

## Pacman

```bash
sudo pacman -S - < ~/dotfiles/linux/archlinux/dependencies/pacman.txt
```

## Yay

```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

```bash
yay - < ~/dotfiles/archlinux/dependencies/yay.txt
```

## Flatpak

```bash
xargs flatpak install -y < ~/dotfiles/archlinux/dependencies/flatpak.txt
```

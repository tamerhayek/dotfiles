# Apps

## Pacman

```bash
sudo pacman -Sy --needed - < ~/dotfiles/archlinux/dependencies/pacman.txt
```

Cleanup pacman and yay:

```bash
sudo pacman -Rcs $(pacman -Qtdq) && yay -Sc
```

## Yay

```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

```bash
yay -S - < ~/dotfiles/archlinux/dependencies/yay.txt
```

## Flatpak

```bash
xargs flatpak install -y < ~/dotfiles/archlinux/dependencies/flatpak.txt
```

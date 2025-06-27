# VSCodium

```bash
rm -f -- ~/.config/VSCodium/User/settings.json
ln -s ~/dotfiles/global/codium/settings.json ~/.config/VSCodium/User/settings.json
```

Configure keybindings

```bash
rm -f -- ~/.config/VSCodium/User/keybindings.json
ln -s ~/dotfiles/archlinux/data/codium/keybindings.json ~/.config/VSCodium/User/keybindings.json
```

Install extensions

```bash
xargs -n 1 codium --install-extension < ~/dotfiles/global/codium/extensions.txt
```


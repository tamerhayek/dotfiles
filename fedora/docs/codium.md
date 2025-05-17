# VSCodium

```bash
rm -f -- ~/.var/app/com.vscodium.codium/config/VSCodium/User/settings.json
ln -s ~/dotfiles/global/codium/settings.json ~/.var/app/com.vscodium.codium/config/VSCodium/User/settings.json
```

Configure keybindings

```bash
rm -f -- ~/.var/app/com.vscodium.codium/config/VSCodium/User/keybindings.json
ln -s ~/dotfiles/fedora/data/codium/keybindings.json ~/.var/app/com.vscodium.codium/config/VSCodium/User/keybindings.json
```

Install extensions

```bash
xargs -n 1 flatpak run com.vscodium.codium --install-extension < ~/dotfiles/global/codium/extensions.txt
```

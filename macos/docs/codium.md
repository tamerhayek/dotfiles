# Codium

if files exist, remove them

```bash
rm ~/Library/Application\ Support/VSCodium/User/settings.json
```

then create symlinks

```bash
ln -s ~/dotfiles/global/codium/settings.json ~/Library/Application\ Support/VSCodium/User/settings.json
```

## VSCodium extensions

```bash
cat ~/dotfiles/global/codium/extensions.txt | xargs -n 1 codium --install-extension
```

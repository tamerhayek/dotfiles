# Node

## nvmrc

if files exist, remove them

```bash
rm ~/.nvmrc
```

then create symlinks

```bash
ln -s ~/dotfiles/global/.nvmrc ~/.nvmrc
```

## FNM

```bash
cat ~/.nvmrc | xargs fnm install
```

## NPM

```bash
cat ~/dotfiles/global/dependencies/npm.txt | xargs npm install -g
corepack enable
```


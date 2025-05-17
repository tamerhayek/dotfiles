# Node

Install `fnm`

```bash
curl -fsSL https://fnm.vercel.app/install | zsh
source ~/.zshrc
```

Setup node

```bash
rm -f -- ~/.nvmrc
ln -s ~/dotfiles/global/.nvmrc ~/.nvmrc
fnm install
```

Install npm deps

```bash
xargs npm install -g < ~/dotfiles/global/dependencies/npm.txt
corepack enable pnpm
```

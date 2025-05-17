# ZSH

Download it

```bash
sudo dnf install -y zsh
```

Make it default

```bash
chsh -s $(which zsh)
```

Install `oh-my-zsh`

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Download Powerlevel10k

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Then change in `.zshrc`

```
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Download fonts and install them manually.

```bash
cd ~/Downloads
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
```

Link the `.zshrc` file

```bash
rm -f -- ~/.zshrc
ln -s ~/dotfiles/fedora/data/.zshrc ~/.zshrc
```

Link the `.p10k.zsh` file

```bash
rm -f -- ~/.p10k.zsh
ln -s ~/dotfiles/global/.p10k.zsh ~/.p10k.zsh
```


brew update
brew upgrade
xargs brew install <~/dotfiles/macos/dependencies/brew.txt
brew autoremove && brew cleanup

xargs mas install <~/dotfiles/macos/dependencies/mas.txt

sudo xcodebuild -license accept

mkdir -p ~/bin

rm ~/.config/fastfetch/config.jsonc
mkdir -p ~/.config/fastfetch
ln -s ~/dotfiles/global/.config/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc

rm ~/.p10k.zsh
ln -s ~/dotfiles/global/.p10k.zsh ~/.p10k.zsh

rm ~/.nvmrc
ln -s ~/dotfiles/global/.nvmrc ~/.nvmrc

rm ~/Library/Application\ Support/VSCodium/User/settings.json
ln -s ~/dotfiles/global/codium/settings.json ~/Library/Application\ Support/VSCodium/User/settings.json

rm ~/.gitconfig
ln -s ~/dotfiles/macos/data/.gitconfig ~/.gitconfig

rm ~/.zshrc
ln -s ~/dotfiles/macos/data/.zshrc ~/.zshrc

cat ~/.nvmrc | xargs fnm install
cat ~/dotfiles/global/dependencies/npm.txt | xargs npm install -g
corepack enable

cat ~/dotfiles/global/codium/extensions.txt | xargs -n 1 codium --install-extension

source ~/.zshrc
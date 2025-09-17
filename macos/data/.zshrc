# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::node
zinit snippet OMZP::nvm
zinit snippet OMZP::npm
zinit snippet OMZP::command-not-found
zinit snippet OMZP::safe-paste

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

zinit ice atload"zpcdreplay" atclone"./zplug.zsh" atpull"%atclone"
zinit light g-plane/pnpm-shell-completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Eza

eza_params=('--git' '--icons' '--classify' '--group-directories-first' '--time-style=long-iso' '--group' '--color-scale')

# Aliases
alias ls='eza $eza_params'
alias l='eza --git-ignore $eza_params'
alias ll='eza --all --header --long $eza_params'
alias llm='eza --all --header --long --sort=modified $eza_params'
alias la='eza -lbhHigUmuSa'
alias lt='eza --tree $eza_params'
alias tree='eza --tree $eza_params'

alias update='brew update && brew upgrade && xargs brew install <~/dotfiles/macos/dependencies/brew.txt && brew cleanup && brew autoremove'

function convert-mov-to-webm() {
  if [ -n "$1" ]
    then
      ffmpeg -i "$1" -c:v libvpx-vp9 -c:a libvorbis "$1.webm"
    else
      echo "Usage: convert-mov-to-webm <filename>"
  fi
}

function convert-mp4-to-webm() {
  if [ -n "$1" ]
    then
      ffmpeg -i "$1" -c:v libvpx-vp9 -b:v 2M -c:a libopus "$1.webm"
    else
      echo "Usage: convert-mp4-to-webm <filename>"
  fi
}

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# FNM
eval "`fnm env --use-on-cd --corepack-enabled --shell zsh`"

autoload -U add-zsh-hook

# User executables
export PATH=$PATH:~/bin

# Go
export PATH=$PATH:$HOME/go/bin

# Java
export PATH=$PATH:/opt/homebrew/opt/openjdk/bin

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/tamibyte/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

fastfetch
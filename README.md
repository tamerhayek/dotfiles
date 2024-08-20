# Dotfiles

Config Dotfiles

## Installation

1. Clone [.dotfiles](https://github.com/tamerhayek/dotfiles) inside your home directory

    ```sh
    git clone https://github.com/tamerhayek/.dotfiles
    ```

2. Set permissions on `~/.dotfiles/scripts/*` files

    ```sh
    chmod +x ~/.dotfiles/scripts/*
    ```

3. (Optional) Install `zsh` and replace `bash`

    ```sh
    ~/.dotfiles/scripts/zsh-install.sh
    ```

4. Run `~/.dotfiles/scripts/setup.sh`

    ```sh
    ~/.dotfiles/scripts/setup.sh
    ```

    Or use `~/.dotfiles/scripts/dotfiles.sh` to only copy all files in `~/.dotfiles`

    ```sh
    ~/.dotfiles/scripts/dotfiles.sh
    ```

    Remember to delete files or folder before running `dotfiles.sh` in order to create symlinks
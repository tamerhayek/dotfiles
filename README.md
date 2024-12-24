# Dotfiles

Config Dotfiles

## Installation

Clone [.dotfiles](https://github.com/tamerhayek/dotfiles) inside your home directory

```sh
git clone https://github.com/tamerhayek/.dotfiles
```

- Linux:

    1. Set permissions on `~/.dotfiles/scripts/*` files

        ```sh
        chmod +x ~/.dotfiles/scripts/*
        ```

    2. (Optional) Install `zsh` and replace `bash`

        ```sh
        ~/.dotfiles/scripts/zsh-install.sh
        ```

    3. Run `~/.dotfiles/scripts/setup.sh`

        ```sh
        ~/.dotfiles/scripts/setup.sh
        ```

        Or use `~/.dotfiles/scripts/dotfiles.sh` to only copy all files in `~/.dotfiles`

        ```sh
        ~/.dotfiles/scripts/dotfiles.sh
        ```

        Remember to delete files or folder before running `dotfiles.sh` in order to create symlinks

- Windows:

    1. Launch `setup.bat` script

        ```sh
        ~\.dotfiles\scripts\setup.bat
        ```

    2. Launch `dotfiles.bat` script

        ```sh
        ~\.dotfiles\scripts\dotfiles.bat
        ```
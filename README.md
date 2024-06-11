# Dotfiles

Config Dotfiles

## Installation

1. Clone [.dotfiles](https://github.com/tamerhayek/dotfiles) inside your home directory

    ```sh
    git clone https://github.com/tamerhayek/dotfiles
    ```

2. Set permissions on `~/.dotfiles/sync.sh`

    ```sh
    chmod +x ~/.dotfiles/sync.sh
    ```

3. Run `~/.dotfiles/sync.sh` using dotfiles alias

    ```sh
    dotfiles
    ```

    Created alias in `~/.zshrc` which calls `~/.dotfiles/sync.sh`.

    ```sh
    alias dotfiles='~/.dotfiles/sync.sh'
    ```

4. All the files inside `~/.dotfiles/data/` will be synced automatically.


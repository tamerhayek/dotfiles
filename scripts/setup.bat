winget source update

winget import %userprofile%\.dotfiles\deps\winget.json --accept-source-agreements --accept-package-agreements

winget upgrade --all
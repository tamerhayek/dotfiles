echo "Upgrade sources..."
winget source update

echo "Install from $env:USERPROFILE\.dotfiles\deps\winget.json..."
winget import "$env:USERPROFILE\.dotfiles\deps\winget.json" --accept-source-agreements --accept-package-agreements

echo "Upgrade all.."
winget upgrade --all
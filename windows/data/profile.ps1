# Aliases
Set-Alias -Name update -Value cat ~/dotfiles/windows/dependencies/winget.txt | ForEach-Object { winget install --accept-source-agreements --accept-package-agreements --id $_ } && winget upgrade --all

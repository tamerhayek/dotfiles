# FNM env
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression

# Aliases
Set-Alias -Name update -Value $env:USERPROFILE/dotfiles/windows/scripts/update.ps1

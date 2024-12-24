#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module
Import-Module -Name Microsoft.WinGet.CommandNotFound

# fnm
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression

# Aliases
Set-Alias -Name update -Value ~/.dotfiles/scripts/update.ps1
Set-ALias -Name dotfiles -Value ~/.dotfiles/scripts/dotfiles.ps1
Set-ALias -Name setup -Value ~/.dotfiles/scripts/setup.ps1

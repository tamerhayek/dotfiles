if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Run your code that needs to be elevated here...
echo "Linking $env:USERPROFILE\AppData\Roaming\VSCodium\User\settings.json to $env:USERPROFILE\.dotfiles\data\codium\settings.json..."
New-Item -Path $env:USERPROFILE\AppData\Roaming\VSCodium\User\settings.json -ItemType SymbolicLink -Value $env:USERPROFILE\.dotfiles\data\codium\settings.json

echo "Linking $env:USERPROFILE\.dotfiles\data\.gitconfig.win to $env:USERPROFILE\.gitconfig..."
New-Item -Path $env:USERPROFILE\.gitconfig -ItemType SymbolicLink -Value $env:USERPROFILE\.dotfiles\data\.gitconfig.win

echo "Linking $env:USERPROFILE\.dotfiles\data\.nvmrc to $env:USERPROFILE\.nvmrc..."
New-Item -Path $env:USERPROFILE\.nvmrc -ItemType SymbolicLink -Value $env:USERPROFILE\.dotfiles\data\.nvmrc
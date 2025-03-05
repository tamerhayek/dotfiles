# Windows

## Post-install

### Winget

Update from source

```powershell
winget source update
```

Install from deps

```powershell
winget import "$env:USERPROFILE\dotfiles\windows\dependencies\winget.json" --accept-source-agreements --accept-package-agreements
```

Upgrade

```powershell
winget upgrade --all
```

### Link files

#### PowerShell profile

```powershell
New-Item -Path $env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -ItemType SymbolicLink -Value $env:USERPROFILE\dotfiles\windows\data\profile.ps1
```

#### Gitconfig

```powershell
New-Item -Path $env:USERPROFILE\.gitconfig -ItemType SymbolicLink -Value $env:USERPROFILE\dotfiles\windows\data\.gitconfig
```

#### VSCodium

```powershell
New-Item -Path $env:USERPROFILE\AppData\Roaming\VSCodium\User\settings.json -ItemType SymbolicLink -Value $env:USERPROFILE\dotfiles\global\codium\settings.json
```

### Setup Apps

#### VSCodium extensions

```powershell
cat ~/dotfiles/global/codium/extensions.txt | ForEach-Object { codium --install-extension $_ }
```

### Source profile

```powershell
. $profile
```

### Install Apps manually

See apps in `~/dotfiles/windows/dependencies/winget-excluded.txt`
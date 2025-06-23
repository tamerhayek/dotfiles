# Git

Install git

```powershell
winget install --id Git.Git
```

## Gitconfig

```powershell
if (Test-Path $env:USERPROFILE\.gitconfig) { Remove-Item $env:USERPROFILE\.gitconfig };
New-Item -Path $env:USERPROFILE\.gitconfig -ItemType SymbolicLink -Value $env:USERPROFILE\dotfiles\windows\data\.gitconfig
```
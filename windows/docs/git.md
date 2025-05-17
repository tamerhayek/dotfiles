# Git

Install git

```powershell
winget install --id Git.Git
```

## Gitconfig

```powershell
New-Item -Path $env:USERPROFILE\.gitconfig -ItemType SymbolicLink -Value $env:USERPROFILE\dotfiles\windows\data\.gitconfig
```
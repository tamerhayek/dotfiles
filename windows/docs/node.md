# Node

```powershell
if (Test-Path $env:USERPROFILE\.nvmrc) { Remove-Item $env:USERPROFILE\.nvmrc };
New-Item -Path $env:USERPROFILE\.nvmrc -ItemType SymbolicLink -Value $env:USERPROFILE\dotfiles\global\.nvmrc
```

## Deps

```powershell
cat $env:USERPROFILE\dotfiles\global\dependencies\npm.txt | ForEach-Object { echo ""; echo "Installing $_"; echo ""; npm install -g $_ }
```

```powershell
corepack enable pnpm
```
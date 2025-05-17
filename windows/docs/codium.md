# VSCodium

```powershell
New-Item -Path $env:USERPROFILE\AppData\Roaming\VSCodium\User\settings.json -ItemType SymbolicLink -Value $env:USERPROFILE\dotfiles\global\codium\settings.json
```

## VSCodium extensions

```powershell
cat $env:USERPROFILE/dotfiles/global/codium/extensions.txt | ForEach-Object { codium --install-extension $_ }
```


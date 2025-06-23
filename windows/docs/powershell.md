# PowerShell

```powershell
if (Test-Path $env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1) { Remove-Item $env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 };
New-Item -Path $env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -ItemType SymbolicLink -Value $env:USERPROFILE\dotfiles\windows\data\profile.ps1
```


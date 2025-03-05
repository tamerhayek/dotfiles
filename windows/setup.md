# Windows

## Post-install

### Download apps

Download Geek Uninstaller [https://www.geekuninstaller.com/](https://www.geekuninstaller.com/)

Download Nvidia App [https://www.nvidia.com/en-us/software/nvidia-app/](https://www.nvidia.com/en-us/software/nvidia-app/) and install Game Ready Drivers

Download Rufus [https://rufus.ie/](https://rufus.ie/)

### Clean windows

Open geek uninstaller and delete the following apps:

Desktop apps

-   OneDrive

Microsoft Store apps

-   Copilot
-   Dev Home
-   Microsoft 365
-   Microsoft Clipchamp
-   Microsoft Bing search
-   Microsoft News
-   Microsoft Teams
-   Microsoft To Do
-   Outlook
-   Solitaire
-   Sticky notes

### Update Micosoft Store apps

Open Microsoft Store and update all apps

### Cleanup Windows start app pinned

Open the Windows start menu and right click on the Windows start menu and uninstall apps not required

### Winget

Update from source

```powershell
winget source update
```

Install git

```powershell
winget install --id Git.Git
```

Then clone [dotfiles](https://github.com/tamerhayek/dotfiles) inside your home directory

```powershell
git clone https://github.com/tamerhayek/dotfiles
```

Install from deps

```powershell
cat ~/dotfiles/windows/dependencies/winget.txt | ForEach-Object { winget install --accept-source-agreements --accept-package-agreements --id $_ }
```

Upgrade

```powershell
winget upgrade --all
```

### Link files

Open terminal as administrator

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
cat $env:USERPROFILE/dotfiles/global/codium/extensions.txt | ForEach-Object { codium --install-extension $_ }
```

### Source profile

```powershell
. $profile
```

### Install Apps manually

Install Hoyoplay [https://hoyoplay.hoyoverse.com/](https://hoyoplay.hoyoverse.com/)

### Manual Configuration

#### Windows terminal

Default profile -> Powershell
Remove others
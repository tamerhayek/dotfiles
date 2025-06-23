# Apps

Download Geek Uninstaller [https://www.geekuninstaller.com/](https://www.geekuninstaller.com/)

Download Nvidia App [https://www.nvidia.com/en-us/software/nvidia-app/](https://www.nvidia.com/en-us/software/nvidia-app/) and install Game Ready Drivers

(One time) Download Nvidia Firmware update tool [https://www.nvidia.com/en-us/drivers/nv-uefi-update-x64/](https://www.nvidia.com/en-us/drivers/nv-uefi-update-x64/)

Download Rufus [https://rufus.ie/](https://rufus.ie/)

## Clean windows

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

## Update Micosoft Store apps

Open Microsoft Store and update all apps

## Cleanup Windows start app pinned

Open the Windows start menu and right click on the Windows start menu and uninstall apps not required

## Winget

Update from source

```powershell
winget source update
```

### Install apps

```powershell
cat ~/dotfiles/windows/dependencies/winget.txt | ForEach-Object { echo ""; echo "Installing $_"; echo ""; winget install --accept-source-agreements --accept-package-agreements --id $_ }
```

Upgrade

```powershell
winget upgrade --all
```

Reset Winget in case of upgrade Errors

```powershell
Get-AppxPackage -Name 'Microsoft.DesktopAppInstaller' | Reset-AppxPackage
```

# Other

Install Hoyoplay [https://hoyoplay.hoyoverse.com/](https://hoyoplay.hoyoverse.com/)

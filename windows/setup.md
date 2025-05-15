# Windows

## Post-install

### Download apps

Download Geek Uninstaller [https://www.geekuninstaller.com/](https://www.geekuninstaller.com/)

Download Nvidia App [https://www.nvidia.com/en-us/software/nvidia-app/](https://www.nvidia.com/en-us/software/nvidia-app/) and install Game Ready Drivers

(One time) Download Nvidia Firmware update tool [https://www.nvidia.com/en-us/drivers/nv-uefi-update-x64/](https://www.nvidia.com/en-us/drivers/nv-uefi-update-x64/)

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

Reset Winget in case of upgrade Errors

```powershell
Get-AppxPackage -Name 'Microsoft.DesktopAppInstaller' | Reset-AppxPackage
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

### Windows update

Manually check for updates and install them

### Manual Configuration

#### Settings

- System
	- Display
		- Advanced Display -> change refresh rate
	- Sound

	- Notifications
		- Disable notifications
		- Enable do not disturb
	- Power
		- Screen timeouts
			- Screen of after 10 minutes
			- Standby after 20 minutes
			- Hibernate after 1 hour
	- Storage
		- Temporary files -> Cleanup
	- Multitasking
		- Show tabs from app when alt+tab -> don't show tabs
		- Enable title bar window shake
	- For developers
		- Enable end task
		- File Explorer
			- Enable show file extensions
			- Enable show full path in title bar
	- Clipboard
		- Enable Clipboard history
		- Enable clipboard history across your devices

- Bluetooth & devices
	- Turn off bluetooth
	- Autoplay
		- Open folder to view files

- Personalization
	- Themes
		- Use the dark theme
		- Sounds
			- More sound settings -> Sounds -> No sounds and disable play windows startup sound
		- Desktop icon settings -> remove every icon
	- Lock screen
		- Use picture as lock screen
		- Disable get fun facts
	- Start
		- Select more pins
		- Disable show recently added apps
		- Disable show reccomended files
		- Disable show reccomandations for tips
		- Folders
			- Settings
			- Documents
			- Downloads
			- Pictures
			- Personal folder
	- Taskbar
		- Taskbar items
			- Select hide on search
			- Disable task view
			- Disable widgets

- Apps
	- Startup
		- Disable apps not required at startup

- Time & language
	- Language & region
		- Windows display language -> English
		- Add a language -> Italian
		- Configure English and Italian language -> install everything and delete unnecessary keyboard layouts
		- Regional Format -> Italy
	- Typing
		- Advanced keyboard settings -> Choose italian and enable Use the desktop language bar when it's available
			- Language bar options
				- Language bar -> Select hidden and disable show text labels
				- Advanced key settings -> Disable every key sequence



- Privacy & security
	- General -> Disable everything
	- Inking & typing personalization -> Disable
	- Activity history -> Disable

- Windows update
	- Enable get the latest updates

#### Control Panel

- System and security
	- Power options -> High performance
		- Choose what the power button does -> Disable Fast startup and enable hibernate

#### Windows terminal

Default profile -> Powershell
Remove others

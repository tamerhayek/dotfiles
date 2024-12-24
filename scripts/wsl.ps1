if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Run your code that needs to be elevated here...
echo "Virtual machine permissions"
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

echo "Installing WSL"
wsl --install --no-launch

echo "Updating WSL"
wsl --update
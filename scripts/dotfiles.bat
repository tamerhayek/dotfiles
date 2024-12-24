@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

echo "Linking %userprofile%\AppData\Roaming\VSCodium\User\settings.json to %userprofile%\.dotfiles\data\codium\settings.json..."
mklink %userprofile%\AppData\Roaming\VSCodium\User\settings.json %userprofile%\.dotfiles\data\codium\settings.json

echo "Linking %userprofile%\.dotfiles\data\.gitconfig to %userprofile%\.gitconfig..."
mklink %userprofile%\.gitconfig %userprofile%\.dotfiles\data\.gitconfig

echo "Linking %userprofile%\.dotfiles\data\.nvmrc to %userprofile%\.nvmrc..."
mklink %userprofile%\.nvmrc %userprofile%\.dotfiles\data\.nvmrc
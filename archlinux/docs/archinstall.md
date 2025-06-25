# Archinstall

## Set IT keyboard

```bash
loadkeys it
```

## (Optional) Setup WIFI

```bash
iwctl
```

```bash
device list
station <device_name> scan
station <device_name> get-networks
station <device_name> connect <network_name>
```

then enter the password.

```bash
exit
```

Ping google.com to check the internet connection

```bash
ping google.com
```

## Archinstall

```bash
archinstall
```

-   Locales -> Keyboard
-   Mirrors and repositories -> Optional repositories -> multilib
-   Disk configuration -> Partitioning -> Use a best effort partitioning scheme -> Select disk -> btrfs -> Yes submodules -> Use compression
-   Bootloader -> Grub
-   Hostname -> archlinux-<device>
-   Root password
-   User -> <username> -> Sudo user
-   Profile
    -   Type -> Desktop -> Gnome
    -   Graphics driver -> Nvidia Proprietary
-   Audio -> Pipewire
-   Network -> Use NetworkManager
-   Additional packages -> git flatpak firefox reflector
-   Timezone -> Europe/Rome (use /rome to find the timezone)

-> install -> yes

-> no chroot -> reboot


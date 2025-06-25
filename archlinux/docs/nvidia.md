# Nvidia

## Install

```bash
sudo pacman -S nvidia nvidia-utils nvidia-settings lib32-nvidia-utils
```

## Update grub config

```bash
sudo nano /etc/default/grub
```

Uncomment `GRUB_DISABLE_OS_PROBER=false`.

```bash
sudo update-grub
```

Append to `GRUB_CMDLINE_LINUX_DEFAULT` `splash nvidia-drm.fbdev=1`

Update MKINITCPIO

```bash
sudo nano /etc/mkinitcpio.conf
```

1. Find `MODULES=(...)` and add `nvidia nvidia_modeset nvidia_uvm nvidia_drm`
2. Find `HOOKS=(...)` and remove `kms` from it

Then run

```bash
sudo mkinitcpio -P
```

Add pacman hook

```bash
cd ~
wget https://raw.githubusercontent.com/korvahannu/arch-nvidia-drivers-installation-guide/main/nvidia.hook
sudo mkdir -p /etc/pacman.d/hooks && sudo mv nvidia.hook /etc/pacman.d/hooks/
```


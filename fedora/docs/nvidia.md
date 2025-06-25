# NVIDIA Drivers

Install nvidia drivers.

```bash
sudo dnf install kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda nvidia-vaapi-driver libva-utils vdpauinfo
sudo dnf mark user akmod-nvidia
```

Wait for the installation to finish. You can check using `modinfo -F version nvidia` command.
It should return you driver version. If it shows ERROR: Module nvidia not found - modules are still building, keep waiting.

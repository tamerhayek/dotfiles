# GRUB

```bash
sudo dnf install grub-customizer
```

then change grub config:

1. `GRUB_ENABLE_BLSCFG=false`
2. `GRUB_DEFAULT="saved"`
3. `GRUB_SAVEDEFAULT=true`
4. `GRUB_TIMEOUT="-1"`

```bash
sudo nano /etc/default/grub
```

then reload grub config

```bash
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

and open grub-customizer.

TIP: Don't move UEFI Firmware settings inside a submenu. It will break!

TIP 2: After customizing GRUB, it will boot directly into fedora. So run this command to fix this behaviour.

```bash
sudo grub2-editenv - unset menu_auto_hide
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

## Install Dedsec Theme

[Github](https://github.com/VandalByte/dedsec-grub2-theme/tree/main)

```bash
git clone --depth 1 https://github.com/VandalByte/dedsec-grub2-theme.git && cd dedsec-grub2-theme
sudo python3 dedsec-theme.py --install
```

Choose Compact Theme (A).

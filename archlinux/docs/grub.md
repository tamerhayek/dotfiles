# Grub

Update grub config

```bash
sudo nano /etc/default/grub
```

Uncomment `GRUB_DISABLE_OS_PROBER=false`.

```bash
sudo update-grub
```

## Install Dedsec Theme

[Github](https://github.com/VandalByte/dedsec-grub2-theme/tree/main)

```bash
git clone --depth 1 https://github.com/VandalByte/dedsec-grub2-theme.git && cd dedsec-grub2-theme
sudo python3 dedsec-theme.py --install
```

Choose Compact Theme (A).
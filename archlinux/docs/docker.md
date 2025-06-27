# Docker

Use docker without sudo permissions

```bash
sudo usermod -aG docker $USER
newgrp docker
docker ps -a
```
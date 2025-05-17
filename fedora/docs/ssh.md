# SSH

Create config file `~/ssh/config`

```
# Github

Host github.com
	Hostname github.com
	AddKeysToAgent yes
	IdentityFile ~/.ssh/github
	User git

# Servers

Host server
	HostName 1.1.1.1
	IdentityFile ~/.ssh/server
	User user

```

Create ssh keys

```bash
ssh-keygen -t ed25519 -C "label"
```

Re-clone this repo using ssh via github.

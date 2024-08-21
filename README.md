# Reinstall WSL

```powershell
wsl --terminate Ubuntu-24.04 ; wsl --unregister Ubuntu-24.04 ; wsl --install -d Ubuntu-24.04
```

# Installation WSL

```powershell
wsl --install -d Ubuntu-24.04
```

# Initiale Einrichtung

## Einrichtung SSH

```
sudo apt update && sudo apt upgrade -y && \
sudo apt install gh && \
ssh-keygen && \
gh auth login && \
git clone git@github.com:xGerTowelie/wsl.git ~/projects/wsl && \
~/projects/wsl/install
```

tasks to do:
- programs:
	- fzf

- change nvim config to install mason packages automatically
	- tailwindcss
	- eslint-lsp
	- mkdnflow
	- ...

- install go
- install teleport
- setup teleport in zshrc

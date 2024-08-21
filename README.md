
## WSL Setup
### Installation (initial)

```powershell
wsl --install -d Ubuntu-24.04
```

### Reinstallation

```powershell
wsl --terminate Ubuntu-24.04 ; wsl --unregister Ubuntu-24.04 ; wsl --install -d Ubuntu-24.04
```
## Installer Script

To run the whole script make sure, that its executable.

**NOTE**:
change to your repository

```
sudo apt update && sudo apt upgrade -y \
  && sudo apt install gh \
  && ssh-keygen \
  && gh auth login \
  && gh repo clone wsl ~/projects/wsl
  && ~/projects/wsl/install
```

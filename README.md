
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
sudo add-apt-repository ppa:wslutilities/wslu -y \
  && sudo apt update && sudo apt upgrade -y \
  && sudo apt install gh wslu -y \
  && ssh-keygen \
  && gh auth login \
  && gh repo clone wsl ~/projects/wsl \
  && ~/projects/wsl/install
```

## Todo
- [ ] add binary for filemanager
- [ ] add binary for todos
- [ ] autoinstall lsps, linter, ect. for mason
- [ ] fix git commit bug for vim
- [ ] fix which-key warning


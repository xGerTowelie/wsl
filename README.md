
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
  && ssh-keygen -f ~/.ssh/id_ed25519 \
  && eval "$(ssh-agent -s)" \
  && ssh-add ~/.ssh/id_ed25519 \
  && gh auth login \
  && gh repo clone wsl ~/projects/wsl \
  && echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc \
  && echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc \
  && echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc \
  && source ~/.bashrc
```

After start the installation script:

```
~/projects/wsl/install
```

## Todo
- [ ] add binary for filemanager
- [ ] add binary for todos
- [ ] autoinstall lsps, linter, ect. for mason
- [ ] fix git commit bug for vim
- [ ] fix which-key warning


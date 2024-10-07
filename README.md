# WSL Autoinstall script
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

> [!Warning]
> change to your repository 

```
  git clone https://github.com/xGerTowelie/wsl.git \
  && cd ~/projects/wsl/ 
  && ./install
```

## Todo
- [ ] add binary for filemanager
- [ ] add binary for todos
- [ ] autoinstall lsps, linter, ect. for mason
- [ ] reduce everything into just install script
- [ ] integrate config folder into dotfiles ".config"


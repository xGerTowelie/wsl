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
<<<<<<< HEAD
  git clone https://github.com/xGerTowelie/wsl.git \
  && cd ~/projects/wsl/ 
  && ./install
=======
  git clone https://github.com/xGerTowelie/wsl.git ~/projects/wsl/ && cd ~/projects/wsl && ./install
>>>>>>> 350ebc677b2b4e74290f1f42e195add3bc9b5ef0
```

## Todo
- [ ] add binary for filemanager
- [ ] add binary for todos
- [ ] autoinstall lsps, linter, ect. for mason
- [ ] reduce everything into just install script
- [ ] integrate config folder into dotfiles ".config"


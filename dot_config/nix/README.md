# nixubuntu

Nix System manage for Ubuntu 

## Istallation

```bash
sudo rm -rf /etc/nix
git clone https://github.com/yefengwu/nixubuntu.git ~/.config/nix && cd ~/.config/nix
sudo ln -s $HOME/.config/nix /etc/
sudo nix run 'github:numtide/system-manager' -- switch --flake '.'
```

# Dotfiles

## Install

```bash
apt install git stow

git clone https://github.com/TheAxelander/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

stow git
mkdir ~/.config && stow hyprland
mkdir ~/.config && stow micro
stow ssh
stow zsh
```

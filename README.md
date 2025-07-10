# Dotfiles

## Install

```bash
apt install git stow

git clone https://github.com/TheAxelander/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

stow git
mkdir -p $HOME/.gnupg && stow gpg
mkdir -p $HOME/.config/micro && stow micro
mkdir -p $HOME/.ssh && stow ssh
stow tmux
stow zsh # or: stow zsh-arch
```

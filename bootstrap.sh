#!/bin/bash

pre_gpg() {
  mkdir -p $HOME/.gnupg
}

pre_kitty() {
  mkdir -p $HOME/.config/kitty
}

pre_micro() {
  mkdir -p $HOME/.config/micro
}

pre_ssh() {
  mkdir -p $HOME/.ssh
}

pre_zsh() {
  mkdir -p $HOME/.config/myzsh

  TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")

  if [ -f "$HOME/.zshrc" ]; then
      mv "$HOME/.zshrc" "$HOME/.zshrc.$TIMESTAMP.old"
  fi
  echo 'source "$HOME/.config/myzsh/.zshrc"' > ~/.zshrc
}

if [ "$#" -gt 0 ]; then
  selections="$@"
else
  cmd=(whiptail --separate-output --title "Stow config" --checklist "Select configs to apply:" 20 78 7)
  options=(
    1 "Git" off
    2 "GPG" off
    3 "kitty" off
    4 "micro" off
    5 "SSH" off
    6 "tmux" off
    7 "zsh" off
  )

  selections=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
  clear
fi

for selection in $selections; do
    case $selection in
        1) stow git ;;
        2) pre_gpg && stow gpg ;;
        3) pre_kitty && stow kitty ;;
        4) pre_micro && stow micro ;;
        5) pre_ssh && stow ssh ;;
        6) stow tmux ;;
        7) pre_zsh && stow zsh ;;
        *) echo "Invalid selection: $selection" ;;
    esac
done

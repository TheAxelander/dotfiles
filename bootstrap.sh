#!/bin/bash

pre_btop() {
  mkdir -p $HOME/.config/btop

  TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")

  if [ -f "$HOME/.config/btop/btop.conf" ]; then
      mv "$HOME/.config/btop/btop.conf" "$HOME/.config/btop/btop.conf.$TIMESTAMP.old"
  fi
}

pre_gpg() {
  mkdir -p $HOME/.gnupg
}

pre_micro() {
  mkdir -p $HOME/.config/micro
}

pre_ssh() {
  mkdir -p $HOME/.ssh
}

pre_zsh() {
  TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")

  if [ -f "$HOME/.zshrc" ]; then
      mv "$HOME/.zshrc" "$HOME/.zshrc.$TIMESTAMP.old"
  fi
}

if [ "$#" -gt 0 ]; then
  selections="$@"
else
  cmd=(whiptail --separate-output --title "Stow config" --checklist "Select configs to apply:" 20 78 7)
  options=(
    1 "btop" off
    2 "Git" off
    3 "GPG" off
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
        1) pre_btop && stow btop ;;
        2) stow git ;;
        3) pre_gpg && stow gpg ;;
        4) pre_micro && stow micro ;;
        5) pre_ssh && stow ssh ;;
        6) stow tmux ;;
        7) pre_zsh && stow zsh ;;
        *) echo "Invalid selection: $selection" ;;
    esac
done

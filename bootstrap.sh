#!/bin/bash

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
  TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

  if [ -f "$HOME/.zshrc" ]; then
      mv "$HOME/.zshrc" "$HOME/.zshrc.$TIMESTAMP.old"
  fi
}

if [ "$#" -gt 0 ]; then
  selections="$@"
else
  cmd=(whiptail --separate-output --title "Stow config" --checklist "Select configs to apply:" 20 78 7)
  options=(
    1 "Git" off
    2 "GPG" off
    3 "micro" off
    4 "SSH" off
    5 "tmux" off
    6 "zsh" off
  )

  selections=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
  clear
fi

for selection in $selections; do
    case $selection in
        1) stow git ;;
        2) pre_gpg && stow gpg ;;
        3) pre_micro && stow micro ;;
        4) pre_ssh && stow ssh ;;
        5) stow tmux ;;
        6) pre_zsh && stow zsh ;;
        *) echo "Invalid selection: $selection" ;;
    esac
done

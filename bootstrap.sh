#!/bin/sh

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

cmd=(whiptail --separate-output --title "Stow config" --checklist "Select configs to apply:" 20 78 7)
options=(
  1 "Git" off
  2 "GPG" off
  3 "micro" off
  4 "SSH" off
  5 "tmux" off
  6 "zsh" off
  7 "zsh-arch" off
)

selections=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

clear

for selection in $selections; do
    case $selection in
        1) stow git ;;
        2) pre-gpg && stow gpg ;;
        3) pre-micro && stow micro ;;
        4) pre-ssh && stow ssh ;;
        5) stow tmux ;;
        6) pre-zsh && stow zsh ;;
        7) pre-zsh && stow zsh-arch ;;
        *) echo "Invalid selection: $selection" ;;
    esac
done

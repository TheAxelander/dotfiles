#!/bin/bash

pre_fastfetch() {
  mkdir -p $HOME/.config/fastfetch
}

pre_gpg() {
  mkdir -p $HOME/.gnupg
}

pre_kitty() {
  mkdir -p $HOME/.config/kitty
}

pre_micro() {
  mkdir -p $HOME/.config/micro
}

pre_noctalia() {
  mv "$HOME/.config/hypr" "$HOME/.config/hypr.old"
  mv "$HOME/.config/noctalia" "$HOME/.config/noctalia.old"
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
    1 "fastfetch" off
    2 "Git" off
    3 "GPG" off
    4 "kitty" off
    5 "micro" off
    6 "noctalia" off
    7 "SSH" off
    8 "tmux" off
    9 "zsh" off
  )

  selections=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
  clear
fi

for selection in $selections; do
    case $selection in
        1) pre_fastfetch && stow fastfetch ;;
        2) stow git ;;
        3) pre_gpg && stow gpg ;;
        4) pre_kitty && stow kitty ;;
        5) pre_micro && stow micro ;;
        6) pre_noctalia && stow noctalia ;;
        7) pre_ssh && stow ssh ;;
        8) stow tmux ;;
        9) pre_zsh && stow zsh ;;
        *) echo "Invalid selection: $selection" ;;
    esac
done

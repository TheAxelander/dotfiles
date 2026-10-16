export PATH=$PATH:$HOME/bin:/usr/local/bin:$HOME/.local/bin
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools

export DOTNET_ROOT=/usr/share/dotnet
export BAT_THEME=gruvbox-dark
export GPG_TTY=$(tty)
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"

source $HOME/.config/myzsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

plugins=(fzf-tab git dirhistory docker docker-compose dotnet zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias exa="eza -la --group-directories-first --icons auto"
alias batp="bat --plain"
alias rsynca="rsync -ah --info=progress2"

# zoxide config
eval "$(zoxide init --cmd cd zsh)"

# fzf config
export FZF_DEFAULT_OPTS="--style=full --height=80%"
# catppuccin-fzf-mocha color theme
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"
eval "$(fzf --zsh)"

# fzf-tab config
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# include hidden dirs
setopt globdots && zstyle ':completion:*' special-dirs true
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -a -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --style=full --height=80%
# show SSH hosts from config file
zstyle ':completion:*:*:ssh:*' hosts $(awk '/^Host / {for (i=2; i<=NF; i++) print $i}' ~/.ssh/config)
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
# Run enable-fzf-tab
enable-fzf-tab

# navi config
# Installing navi shell widget
eval "$(navi widget zsh)"

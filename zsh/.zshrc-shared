export PATH=$PATH:$HOME/bin:/usr/local/bin:$HOME/.local/bin
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools

export DOTNET_ROOT=/usr/share/dotnet
export BAT_THEME=gruvbox-dark
export GPG_TTY=$(tty)
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"

plugins=(fzf-tab git dirhistory docker docker-compose dotnet zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias exa="eza -la --group-directories-first"
alias batp="bat --plain"
alias rsynca="rsync -ah --info=progress2"

function pastebin() {
  curl -F "file=@$1" https://bin.axelander.net
}

# zoxide config
eval "$(zoxide init --cmd cd zsh)"

# fzf config
export FZF_DEFAULT_OPTS="--style=full --height=80%"
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

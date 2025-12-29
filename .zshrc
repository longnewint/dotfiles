
# Enable colors and change prompt:
autoload -U colors && colors
PS1='%F{183}%1~%f - '
setopt autocd nomatch
setopt interactive_comments
stty stop undef
zstyle :compinstall filename '$HOME/.zshrc'

# History config
HISTFILE="$HOME/.zhistory"
HISTSIZE=1000000
SAVEHIST=1000000
setopt inc_append_history

#bindkey -v
export KEYTIMEOUT=1

bindkey '^z' fzf-history-widget

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# yazi cd on quit
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# zle
zle -N fzo

# fuzzy find repo
fz() {
  local dir_name
  dir_name=$(find ~/repo -maxdepth 3 \
   -type d -name '*.vscode*'  -prune -o \
    -type d -name '*.settings*'  -prune -o \
    -type d -name '*.idea*'  -prune -o \
    -type d -name '*.git*'  -prune -o \
    -type d -name '*.gradle*'  -prune -o \
    -type d -name '*build*'  -prune -o \
    -type d -name '*.mvn*'  -prune -o \
    -type d -name '*target*' -prune -o \
    -type d -name '*dist*'  -prune -o \
    -type d -name '*node_modules*' -prune -o \
    -type d -name '*bin*'  -prune -o \
  -type d -print | fzf --reverse) || return
  z $dir_name
}

fzn() {
  local file_name
  file_name=$(find ~/notes -maxdepth 3 \
    -type d -name '*.git*'  -prune -o \
  -type f -print | fzf --reverse) || return
  nvim $file_name
}

fzo() {
  file_name=$(find . \
    -type d -name '*.vscode*'  -prune -o \
    -type d -name '*.settings*'  -prune -o \
    -type d -name '*.idea*'  -prune -o \
    -type d -name '*.git*'  -prune -o \
    -type d -name '*.gradle*'  -prune -o \
    -type d -name '*build*'  -prune -o \
    -type d -name '*.mvn*'  -prune -o \
    -type d -name '*target*' -prune -o \
    -type d -name '*dist*'  -prune -o \
    -type d -name '*node_modules*' -prune -o \
    -type d -name '*bin*'  -prune -o \
  -type f -print | fzf --reverse) || return
  nvim $file_name

  zle reset-prompt
}

# fuzzy find doc folder
doc() {
  local dir_name
  dir_name=$(find ~/docs -maxdepth 3 \
    -type d -name '.git'  -prune -o \
    -type d -name target -prune -o \
  -type d -print | fzf --reverse) || return
  z $dir_name
}

# bind keys
bindkey '^O' fzo

# Load external configuration
function load () {
    [ -f $1 ] && source $1
}

load "$HOME/.aliasrc"

# zoxide
eval "$(zoxide init zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# vi mode plugin
source $HOME/.config/zsh/zsh-vi-mode.plugin.zsh

ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE

ZVM_SYSTEM_CLIPBOARD_ENABLED=true
ZVM_VI_HIGHLIGHT_FOREGROUND=#1e1e2e
ZVM_VI_HIGHLIGHT_BACKGROUND=#f9e2af

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


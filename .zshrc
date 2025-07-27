
# Enable colors and change prompt:
autoload -U colors && colors
PS1='%F{072}%1~%f - '
setopt autocd nomatch
setopt interactive_comments
stty stop undef
zstyle :compinstall filename '$HOME/.zshrc'

# History config
HISTFILE="$HOME/.zhistory"
HISTSIZE=1000000
SAVEHIST=1000000
setopt inc_append_history

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Set cursor shape for different vi modes
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[2 q';;      # block
        viins|main) echo -ne '\e[6 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# yazi cd on quit
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# fuzzy find repo
fz() {
  local dir_name
  dir_name=$(find ~/repo -maxdepth 3 \
    -type d -name '.git'  -prune -o \
    -type d -name target -prune -o \
  -type d -print | fzf) || return
  z $dir_name
}

fzn() {
  local file_name
  file_name=$(find ~/notes -maxdepth 3 \
    -type d -name '.git'  -prune -o \
  -type f -print | fzf --reverse) || return
  nvim $file_name
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

# Load external configuration
function load () {
    [ -f $1 ] && source $1
}

load "$HOME/.aliasrc"

# zoxide
eval "$(zoxide init zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


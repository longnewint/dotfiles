
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

# nnn cd on quit
n()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # Default flags go here
    # DEFAULT_NNN_FLAG="A"

    nnn "$@" -AR

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
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

# nnn environment
#export NNN_BMS='h:~;d:~/Downloads;m:~/textbook;t:~/Algonquin/L4Theory;l:~/Algonquin/L4Lab'
export NNN_COLORS='#48afd609'
export NNN_FCOLORS='41dc6d8e006033f7c6d6aba7'
export NNN_TRASH=1

# Load external configuration
function load () {
    [ -f $1 ] && source $1
}

load "$HOME/.aliasrc"

# Auto start x server on tty 1
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

# zoxide
eval "$(zoxide init zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


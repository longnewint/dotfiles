
# Enable colors and change prompt:
autoload -U colors && colors
PS1='%1~ - '
setopt autocd nomatch
setopt interactive_comments
stty stop undef
zstyle :compinstall filename '/home/nhl/.zshrc'

# History config
HISTFILE="/home/nhl/.zhistory"
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

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# nnn environment
#export NNN_BMS='h:~;d:~/Downloads;m:~/textbook;t:~/Algonquin/L4Theory;l:~/Algonquin/L4Lab'
export NNN_COLORS='#48afd609'
export NNN_FCOLORS='41dc6d8e006033f7c6d6aba7'
export NNN_TRASH=1

# Quote
quote='"May each of you rise high by spending each day of a long life aiming low."'
echo -e "\n$quote\n"

# System aliases
alias f="cd"
alias l="ls"
alias ll="ls -al"
alias v="nvim"
alias n="n -AR"
alias fetch="fastfetch"
alias fz="fzf"
alias tm="tmux"

alias ud="sudo dnf check-update"
alias ug="sudo dnf upgrade -y"
alias ss="sudo systemctl"

alias xfhalt="xfce4-session-logout --halt"
alias xfboot="xfce4-session-logout --reboot"
alias lout="xfce4-session-logout --logout"
alias sus="xfce4-session-logout --suspend"
alias lk="i3lock"

# Development aliases
alias doc="chromium-browser /usr/share/javadoc/java/index.html"
alias jv="java"

# Application
alias iv="qimgv"
alias sx="sxiv"


# Auto start x server on tty 1
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

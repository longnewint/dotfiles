# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Auto start x server on tty 1
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

# Quote
quote='"May each of you rise high by spending each day of a long life aiming low."'
echo -e "\n$quote\n"

# set vim key bind
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

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
alias ug="sudo dnf upgrade"
alias ss="sudo systemctl"

alias xfhalt="xfce4-session-logout --halt"
alias xfboot="xfce4-session-logout --reboot"
alias lout="xfce4-session-logout --logout"
alias sus="xfce4-session-logout --suspend"
alias lk="i3lock"

# Development aliases
alias pie="http"
alias doc="chromium-browser /usr/share/javadoc/java/index.html"
alias jv="java"

# Application
alias iv="qimgv"
alias sx="sxiv"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export EDITOR=/usr/bin/nvim
export JAVA_HOME=/home/nhl/.sdkman/candidates/java/current
export PATH=$JAVA_HOME/bin:$PATH
export PATH=/usr/local/go/bin:$PATH

# input method
export XMODIFIERS=@im=fcitx
unset GTK_IM_MODULE

# User specific environment
if ! [[ "$PATH" =~ "$HOME/bin:$HOME/bin/app" ]]; then
  PATH="$HOME/bin:$HOME/bin/app:$PATH"
fi
export PATH

# fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4"

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


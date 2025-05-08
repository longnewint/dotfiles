export EDITOR=/usr/bin/nvim
export JAVA_HOME=/home/nhl/.sdkman/candidates/java/current
export PATH=$JAVA_HOME/bin:$PATH

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH


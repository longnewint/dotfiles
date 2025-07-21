export EDITOR=/usr/bin/nvim
export JAVA_HOME=/home/nhl/.sdkman/candidates/java/current
export PATH=$JAVA_HOME/bin:$PATH
export PATH=/usr/local/go/bin:$PATH

# User specific environment
if ! [[ "$PATH" =~ "$HOME/bin:$HOME/bin/app" ]]; then
  PATH="$HOME/bin:$HOME/bin/app:$PATH"
fi
export PATH


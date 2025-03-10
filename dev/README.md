
## install zsh
sudo dnf install zsh
chsh <USER_NAME>
mkdir -p ~/.cache/zsh

## install sdkman and java

## add $PATH=$JAVA_HOME/bin:$PATH to ~/.profile

## install javadoc
sudo dnf install java-21-openjdk-javadoc

## git config
git config --global init.defaultBranch main

## c dev tool
sudo dnf groupinstall 'Development Tools'


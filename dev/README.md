
## install zsh
sudo dnf install zsh
chsh <USER_NAME>
mkdir -p ~/.cache/zsh

## install sdkman and java

## add $PATH=$JAVA_HOME/bin:$PATH to ~/.profile

## install javdoc
sudo dnf install java-21-openjdk-javadoc

## git config
git config --global init.defaultBranch main

## c dev tool
sudo dnf groupinstall 'Development Tools'

## install wrk2
sudo dnf install openssl-devel zlib-ng-compat-devel


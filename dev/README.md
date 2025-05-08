
## install sdkman and java

## install javadoc
sudo dnf install java-21-openjdk-javadoc

## postgres install and init
ref: https://docs.fedoraproject.org/en-US/quick-docs/postgresql/
sudo dnf install postgresql-server postgresql-contrib
sudo postgresql-setup --initdb --unit postgresql

## dbeaver vim config
Go to Help > Install New Software
Click on Add...
Name: Vrapper
Location: https://vrapper.sourceforge.net/update-site/stable/
Install Vrapper

## c dev tool
sudo dnf groupinstall 'Development Tools'


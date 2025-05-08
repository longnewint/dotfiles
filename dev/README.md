
## install sdkman and java

## install javadoc
sudo dnf install java-21-openjdk-javadoc

## postgres install and init
ref: https://docs.fedoraproject.org/en-US/quick-docs/postgresql/
sudo dnf install postgresql-server postgresql-contrib
sudo postgresql-setup --initdb --unit postgresql

## login as postgres user and create dev role
sudo -u postgres psql
CREATE ROLE dev WITH SUPERUSER CREATEDB LOGIN PASSWORD 'pass';
change postgres user password: \password postgres

## dbeaver vim config
Go to Help > Install New Software
Click on Add...
Name: Vrapper
Location: https://vrapper.sourceforge.net/update-site/stable/
Install Vrapper

## c dev tool
sudo dnf groupinstall 'Development Tools'



## install sdkman and java

## install awscli
sudo dnf install awscli2

## install javadoc
sudo dnf install java-21-openjdk-javadoc

## k8s
https://kubernetes.io/docs/tasks/tools/

## postgres install and init
ref: https://docs.fedoraproject.org/en-US/quick-docs/postgresql/
sudo dnf install postgresql-server postgresql-contrib
sudo postgresql-setup --initdb --unit postgresql

## login as postgres user and create dev role
sudo -u postgres psql
CREATE ROLE dev WITH SUPERUSER CREATEDB LOGIN PASSWORD 'pass';
change postgres user password: \password postgres

## postgres login error
sudo -e /var/lib/pgsql/data/pg_hba.conf
change authentication method for all database to md5

## dbeaver vim config
Go to Help > Install New Software
Click on Add...
Name: Vrapper
Location: https://vrapper.sourceforge.net/update-site/stable/
Install Vrapper

# python
sudo dnf install python3-pip python-launcher

## golang
sudo dnf install golang go-task

## c dev tool
sudo dnf groupinstall 'Development Tools'


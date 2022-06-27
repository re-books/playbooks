# About Playbooks

## How to install master ?

You should SSH into your server as sudoer and run the following commands in your terminal :

```bash
PLAYBOOKS_WD=/srv/playbooks
APP_HOSTNAME=pilot.example.com
APP_REPOSITORY=https://github.com/ouest-code/pilot.git
PHP_VERSION=8.1
WWW_USER=pilot
MYSQL_ROOT_PASSWORD="$(date +%s | sha256sum | base64 | head -c 32 ; echo)"
MYSQL_USER=pilot
MYSQL_PASSWORD="$(date +%s | sha256sum | base64 | head -c 32 ; echo)"
MYSQl_DATABASE=pilot
CERTBOT_EMAIL=admin@pilot.example.com

sudo apt update && sudo apt install -y ansible git

sudo git clone https://github.com/ouest-code/playbooks.git $PLAYBOOKS_WD

cd $PLAYBOOKS_WD || exit

sudo cp hosts.example.ini hosts.ini

ansible-playbook -i hosts.ini setup-master.yml \
  -e playbooks_wd=$PLAYBOOKS_WD \
  -e app_hostname=$APP_HOSTNAME \
  -e app_repository=$APP_REPOSITORY \
  -e php_version=$PHP_VERSION \
  -e www_user=$WWW_USER \
  -e mysql_root_password=$MYSQL_ROOT_PASSWORD \
  -e mysql_user=$MYSQL_USER \
  -e mysql_password=$MYSQL_PASSWORD \
  -e mysql_database=$MYSQL_DATABASE \
  -e certbot_email=$CERTBOT_EMAIL
```

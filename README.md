# About Playbooks

## How to install master ?

You should SSH into your server as sudoer and run the following commands in your terminal :

```bash
PLAYBOOKS_WD=/srv/playbooks
APP_REPOSITORY=https://github.com/ouest-code/pilot.git
PHP_VERSION=8.1
WWW_USER=pilot
MYSQL_ROOT_PASSWORD="$(date +%s | sha256sum | base64 | head -c 32 ; echo)"

sudo apt update && sudo apt install -y ansible git

sudo git clone https://github.com/ouest-code/playbooks.git $PLAYBOOKS_WD

cd $PLAYBOOKS_WD || exit

sudo cp hosts.example.ini hosts.ini

ansible-playbook -i hosts.ini setup.yml \
  -e playbooks_wd=$PLAYBOOKS_WD \
  -e php_version=$PHP_VERSION \
  -e www_user=$WWW_USER \
  -e mysql_root_password=$MYSQL_ROOT_PASSWORD 
```

#!/bin/bash

PLAYBOOKS_WD=/srv/playbooks
PHP_VERSION=8.1
NODE_VERSION=18.7
WWW_USER=pilot
MYSQL_ROOT_PASSWORD="$(date +%s | sha256sum | base64 | head -c 32 ; echo)"

sudo apt update && sudo apt install -y ansible git

sudo git clone https://github.com/ouest-code/playbooks.git $PLAYBOOKS_WD

cd $PLAYBOOKS_WD || exit

sudo cp hosts.example.ini hosts.ini

ansible-playbook -i hosts.ini playbook.yml --tags "setup" \
  -e php_version=$PHP_VERSION \
  -e node_version=$NODE_VERSION \
  -e www_user=$WWW_USER \
  -e mysql_root_password="$MYSQL_ROOT_PASSWORD"

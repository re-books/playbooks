# About Playbooks

## How to install master ?

You should SSH into your server as sudoer and run the following command in your terminal :

```bash
curl https://raw.githubusercontent.com/ouest-code/playbooks/master/setup.sh | sudo bash
```

## New application

```bash
WWW_USER=pilot
APP_HOSTNAME=example.org
APP_DIRECTORY=/home/$WWW_USER/$APP_HOSTNAME/current/public
PHP_VERSION=8.1
DB_USERNAME=pilot
DB_PASSWORD="$(date +%s | sha256sum | base64 | head -c 32 ; echo)"
DB_DATABASE=example
CERTBOT_EMAIL=admin@example.org

echo $DB_PASSWORD

ansible-playbook -i hosts.ini playbook.yml --tags "new-app" \
  -e app_hostname=$APP_HOSTNAME \
  -e app_directory=$APP_DIRECTORY \
  -e php_version=$PHP_VERSION \
  -e www_user=$WWW_USER \
  -e mysql_database=$DB_DATABASE \
  -e mysql_user=$DB_USERNAME \
  -e mysql_password="$DB_PASSWORD" \
  -e certbot_email="$CERTBOT_EMAIL"
```

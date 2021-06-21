#!/usr/bin/env bash
cd /root/docker/ || exit

./setUpNetwork.sh

export PRIMARY_DOMAIN='phpza.com'
export SECONDARY_PRIMARY_DOMAIN='phpafrica.com'

export CF_DNS_API_TOKEN=''
export WP_MYSQL_PROD_MASTER_PASSWORD=''
export WP_MYSQL_PROD_MASTER_ROOT_PASSWORD=''
export OUROBOROS_NOTIFIERS=""
export TRAEFIK_BASIC_PASSWORD_RAW=''

export TRAEFIK_BASIC_USER='traefik'
TRAEFIK_BASIC_PASSWORD=$(docker run --rm -ti xmartlabs/htpasswd "${TRAEFIK_BASIC_USER}" "${TRAEFIK_BASIC_PASSWORD_RAW}" | sed -E -e 's#.+\:(.+)#\1#' | xargs)
export TRAEFIK_BASIC_PASSWORD

export TIME_ZONE='Africa/Johannesburg'

#mysql
export WP_MYSQL_PROD_MASTER_SERVER_ID='1'
export WP_MYSQL_PROD_MASTER_INNODB_BUFFER_POOL_SIZE='512M'
export WP_MYSQL_PROD_MASTER_LOCK_WAIT_TIMEOUT='300'
export WP_MYSQL_PROD_MASTER_DB_HOST='mysql-prod-master.server'
export WP_MYSQL_PROD_MASTER_USER='phpza'
export WP_MYSQL_PROD_MASTER_DB='phpza'

export WP_MYSQL_PROD_MASTER_VOLUME_MYSQL='/docker/phpza/mysql'
export WP_MYSQL_PROD_MASTER_VOLUME_MYSQL_BACKUP='/docker/phpza/mysql_backup'

export WP_PHPZA_VOLUME='/docker/phpza/wp'

mkdir -p /root/ltencrypt
touch /root/ltencrypt/acme.json
chmod 600 /root/ltencrypt/acme.json

mkdir -p "${WP_MYSQL_PROD_MASTER_VOLUME_MYSQL}"
mkdir -p "${WP_MYSQL_PROD_MASTER_VOLUME_MYSQL_BACKUP}"
mkdir -p "${WP_PHPZA_VOLUME}"

docker stack deploy --compose-file ./stack/stack-mysql-prod-master.yml --prune --with-registry-auth mysql-prod-master
docker stack deploy --compose-file ./stack/stack-ouroboros.yml --prune --with-registry-auth ouroboros
docker stack deploy --compose-file ./stack/stack-traefik.yml --prune --with-registry-auth traefik
docker stack deploy --compose-file ./stack/stack-wordpress-phpza.yml --prune --with-registry-auth wordpress-phpza

# Nextcloud

https://nextcloud.com/

## Configure
```
echo POSTGRES_PASSWORD=$(openssl rand -base64 32) >> .env
```

if you want to change the `pm.max_children` value for nextcloud container (default value of official nextcloud container is untouched if variable is not exported):
```
echo NEXTCLOUD_MAX_CHILDREN=50 >> .env
```

## Deploy

```bash
docker-compose up -d
```

Then you can connect to your Nextcloud instance to perform the installation.

If you prefer to install the instance in command line, you can launch the following commands (Replace variables below by their value ): 

Note: in order to run the following commands, you may need to manually install [jq](https://stedolan.github.io/jq), you can do so by running the following command on debian: `apt install jq`

```
docker-compose exec --user www-data app php /var/www/html/occ maintenance:install --database "pgsql" --database-name "nextcloud"  --database-host="db" --database-user "nextcloud" --database-pass "$POSTGRES_PASSWORD" --admin-user "$ADMIN_USER" --admin-pass "$ADMIN_PASSWORD"
docker-compose exec --user www-data app php occ config:system:set trusted_domains 0 --value=$CHATONS_SERVICE.$CHATONS_DOMAIN
docker-compose exec --user www-data app php occ config:system:set overwrite.cli.url --value=http://$CHATONS_SERVICE.$CHATONS_DOMAIN
# to avoid error message related to untrusted proxies
idx=0
for ip_range in $(docker network inspect web | jq '.[].IPAM.Config[].Subnet');
do
  docker-compose exec --user www-data app php occ config:system:set trusted_proxies ${idx} --value="${ip_range}"
  idx=$((idx+1))
done
# to ensure reset password is working fine behind proxy
docker-compose exec --user www-data app php occ config:system:set  overwriteprotocol --value="https" --type="string"
```

## Deploy with scaling of the "app" container

```
docker-compose up -d --scale app=3  # to get 3 instance of the "app" container
```


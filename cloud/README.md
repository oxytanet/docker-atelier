# Nextcloud

https://nextcloud.com/

## Configure
```
echo MYSQL_ROOT_PASSWORD=$(openssl rand -base64 32) >> .env
echo MYSQL_PASSWORD=$(openssl rand -base64 32) >> .env
echo MYSQL_DATABASE=nextcloud >> .env
echo MYSQL_USER=nextcloud >> .env
echo MYSQL_HOST=db >> .env
```

## Deploy
```
docker-compose up -d
```

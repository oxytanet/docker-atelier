# Nextcloud

https://nextcloud.com/

## Configure
```
echo POSTGRES_PASSWORD=$(openssl rand -base64 32) >> .env
echo POSTGRES_USER=nextcloud >> .env
echo POSTGRES_HOST=db >> .env
```

## Deploy
```
docker-compose up -d
```

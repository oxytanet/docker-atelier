# Nextcloud

https://nextcloud.com/

## Configure
```
echo POSTGRES_PASSWORD=$(openssl rand -base64 32) >> .env
```

## Deploy
```
docker-compose up -d
```

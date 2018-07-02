# Peertube

https://framagit.org/chocobozzz/PeerTube

## Configure

:warning: You *must* use a working SMTP server :warning:

```
export DB_PASSWORD=$(openssl rand -base64 32)
echo POSTGRES_USER=postgres_user >> .env
echo POSTGRES_PASSWORD=$DB_PASSWORD >> .env
echo POSTGRES_DB=peertube >> .env
echo PEERTUBE_WEBSERVER_PORT=80 >> .env
echo PEERTUBE_WEBSERVER_HTTPS=false >> .env
echo PEERTUBE_DB_HOSTNAME=db >> .env
echo PEERTUBE_DB_USERNAME=postgres_user >> .env
echo PEERTUBE_DB_PASSWORD=$DB_PASSWORD >> .env
echo PEERTUBE_REDIS_HOSTNAME=redis >> .env
echo PEERTUBE_SMTP_PASSWORD=null >> .env
echo PEERTUBE_SMTP_HOSTNAME=null >> .env
echo PEERTUBE_SMTP_PORT=465 >> .env
echo PEERTUBE_SMTP_TLS=true >> .env
echo PEERTUBE_SMTP_USERNAME=peertube@${CHATONS_DOMAIN:-local} >> .env
echo PEERTUBE_SMTP_FROM=peertube@${CHATONS_DOMAIN:-local} >> .env
echo PEERTUBE_ADMIN_EMAIL=peertube@${CHATONS_DOMAIN:-local} >> .env
```

## Deploy
```
docker-compose up -d
```

## Get `root`'s password

```
docker-compose logs | grep password
```

# Peertube

https://framagit.org/chocobozzz/PeerTube

## Configure

### :warning: You **must** use a working SMTP server :warning:
### :warning: You **can't** change hostname or http/https with this service :warning:

```
export DB_PASSWORD=$(openssl rand -base64 32)
echo POSTGRES_PASSWORD=$DB_PASSWORD >> .env
echo PEERTUBE_DB_PASSWORD=$DB_PASSWORD >> .env
echo PEERTUBE_SMTP_USERNAME=changeme >> .envv
echo PEERTUBE_SMTP_PASSWORD=changeme >> .env
echo PEERTUBE_SMTP_HOSTNAME=changeme >> .env
echo PEERTUBE_SMTP_PORT=465 >> .env
echo PEERTUBE_SMTP_TLS=true >> .env
echo PEERTUBE_SMTP_USERNAME=${CHATONS_SERVICE:-peertube}@${CHATONS_DOMAIN:-localhost} >> .env
echo PEERTUBE_SMTP_FROM=${CHATONS_SERVICE:-peertube}@${CHATONS_DOMAIN:-localhost} >> .env
echo PEERTUBE_ADMIN_EMAIL=${CHATONS_SERVICE:-peertube}@${CHATONS_DOMAIN:-localhost} >> .env
```

If you want to use HTTPS, you will have to add:
```
echo PEERTUBE_WEBSERVER_HTTPS=true >> .env
echo PEERTUBE_WEBSERVER_PORT=443 >> .env
```

## Deploy
```
docker-compose up -d
```

## Get `root`'s password

```
docker-compose logs | grep password
```

*Alternatively*, you can set `root`'s password:

```
docker-compose exec app npm run reset-password -- -u root
```

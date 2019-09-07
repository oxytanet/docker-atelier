# Wallabag

https://wallabag.org

## Configure
```
echo POSTGRES_PASSWORD=$(openssl rand -base64 32) >> .env
echo SYMFONY__ENV__DATABASE_PASSWORD=$(openssl rand -base64 32) >> .env
echo SYMFONY__ENV__MAILER_HOST=changeme >> .env
echo SYMFONY__ENV__MAILER_USER=changeme >> .env
echo SYMFONY__ENV__FROM_EMAIL=changeme >> .env
echo SYMFONY__ENV__MAILER_PASSWORD=changeme >> .env
```
## Deploy
```
docker-compose up -d
```

## First login

Go to your browser and login with wallabag/wallabag
**DO NOT FORGET** to change the user & password after first login


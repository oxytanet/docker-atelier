# Wallabag

https://wallabag.org

## Configure
```
echo POSTGRES_PASSWORD=$(openssl rand -base64 32) >> .env
echo SYMFONY__ENV__DATABASE_PASSWORD=$(openssl rand -base64 32) >> .env
echo SYMFONY__ENV__SECRET=$(openssl rand -base64 30) >> .env
echo SYMFONY__ENV__MAILER_HOST=changeme >> .env
echo SYMFONY__ENV__MAILER_USER=changeme >> .env
echo SYMFONY__ENV__FROM_EMAIL=changeme >> .env
echo SYMFONY__ENV__MAILER_PASSWORD=changeme >> .env
```

If you want to test with **http** instead of **https**, just export the following variable before launching `docker-compose`:
```
# when not exported, default to https
export PROTOCOL=http
```

## Deploy
```
docker-compose up -d
```

## First login

Go to your browser and login with wallabag/wallabag
**DO NOT FORGET** to change the user & password after first login


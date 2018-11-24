# Wallabag

https://wallabag.org

## Configure
```
export DB_PASSWORD=$(openssl rand -base64 32)
echo MYSQL_ROOT_PASSWORD=$DB_PASSWORD >> .env
echo SYMFONY__ENV__DATABASE_NAME=wallabag >> .env
echo SYMFONY__ENV__DATABASE_USER=wallabag >> .env
echo SYMFONY__ENV__DATABASE_PASSWORD=$(openssl rand -base64 32) >> .env
echo SYMFONY__ENV__MAILER_HOST=changeme >> .env
echo SYMFONY__ENV__MAILER_USER=changeme >> .env
echo SYMFONY__ENV__FROM_EMAIL=changeme >> .env
echo SYMFONY__ENV__MAILER_PASSWORD=changeme >> .env
```

Go to your browser and login with wallabag/wallabag
DO NOT FORGET to change the password after first login

## Deploy
```
docker-compose up -d
```

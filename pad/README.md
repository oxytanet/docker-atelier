# Etherpad

http://etherpad.org/

## Configure
```
export DB_PASSWORD=$(openssl rand -base64 32)
echo POSTGRES_PASSWORD=$DB_PASSWORD >> .env
echo ETHERPAD_DB_PASSWORD=$DB_PASSWORD >> .env
echo ETHERPAD_TITLE=Bloc Note >> .env
echo ETHERPAD_ADMIN_USER=admin >> .env
echo ETHERPAD_ADMIN_PASSWORD=$(openssl rand -base64 32) >> .env
echo ETHERPAD_DB_HOST=db >> .env
echo ETHERPAD_DB_TYPE=postgres >> .env
echo ETHERPAD_DB_USER=etherpad >> .env
echo ETHERPAD_DB_PORT=5432 >> .env
echo POSTGRES_USER=etherpad >> .env
echo POSTGRES_PASSWORD=$DB_PASSWORD >> .env
```

## (Optionnal) Add a theme

```
echo THEME_IMAGE=oxytanet/front-pad >> .env
```

## Deploy
```
docker-compose up -d
```

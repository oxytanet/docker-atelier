# Etherpad

http://etherpad.org/

## Configure
```
export MYSQL_ROOT_PASSWORD=$(openssl rand -base64 32)
echo MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD >> .env
echo ETHERPAD_DB_PASSWORD=$MYSQL_ROOT_PASSWORD >> .env
echo ETHERPAD_DB_HOST=db >> .env
echo ETHERPAD_TITLE=Bloc Note >> .env
```

## Deploy
```
docker-compose up -d
```

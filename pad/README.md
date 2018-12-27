# Etherpad

http://etherpad.org/

## Configure
```
export DB_PASSWORD=$(openssl rand -base64 32)
echo POSTGRES_PASSWORD=$DB_PASSWORD >> .env
echo ETHERPAD_DB_PASSWORD=$DB_PASSWORD >> .env
echo ETHERPAD_TITLE=Bloc Note >> .env
```

## Deploy
```
docker-compose up -d
```

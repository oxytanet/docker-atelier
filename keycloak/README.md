# Keycloak for centralized auth

https://www.keycloak.org/

## Configure
```
export DB_PASSWORD=$(openssl rand -base64 32)
echo KEYCLOAK_USER=admin >> .env
echo KEYCLOAK_PASSWORD=$(openssl rand -base64 32) >> .env
echo DB_USER=keycloak >> .env
echo DB_PASSWORD=$DB_PASSWORD >> .env
echo POSTGRES_USER=keycloak >> .env
echo POSTGRES_PASSWORD=$DB_PASSWORD >> .env
```

## Deploy
```
docker-compose up -d
```

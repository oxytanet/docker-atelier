# Dolibarr

## Usage

```
echo POSTGRES_PASSWORD=$(openssl rand -base64 32) >> .env
docker-compose up -d --build
docker-compose exec app touch conf/conf.php
docker-compose exec app chown www-data documents conf/conf.php
```

Go to your webbrowser to finish installation:
- DB name / DB host / DB user: `postgres`
- DB password: look inside .env
- DB port: empty

```
docker-compose exec app touch documents/install.lock
docker-compose exec app chmod -w conf/conf.php documents/install.lock
```

## Update

```
docker-compose pull
docker-compose up -d --build
docker-compose exec app rm documents/install.lock
```

Go to your webbrowser to finish upgrade

```
docker-compose exec app touch documents/install.lock
docker-compose exec app chmod -w documents/install.lock
```

# Dolibarr

```
echo POSTGRES_PASSWORD=$(openssl rand -base64 32) >> .env
docker-compose up -d --build
```

Go to your webbrowser to finish installation:
- DB name / DB host / DB user: `postgres`
- DB password: look inside .env
- DB port: empty

- create admin user / password

```
docker-compose exec app touch documents/install.lock
docker-compose exec app chmod -w conf/conf.php documents/install.lock
```

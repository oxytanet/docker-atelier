# Whoami

debug util.

## Configure

- if you want to change the url:

```bash
echo CHATONS_SERVICE=who >> .env
echo CHATONS_DOMAIN=example.org >> .env
```

- otherwise:

```bash
touch .env
```

## Deploy

```bash
docker-compose up -d
```

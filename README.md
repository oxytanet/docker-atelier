# Sentry w/ docker-compose & traefik

You need a [traefik](https://traefik.io/) instance first, like https://github.com/nim65s/traefik-prod

```bash
echo SENTRY_SECRET_KEY=$(openssl rand -base64 32) >> .env
echo DOMAIN_NAME=$YOUR_FQDN> >> .env
echo SENTRY_EMAIL_HOST= >> .env
echo SENTRY_EMAIL_PORT= >> .env
echo SENTRY_EMAIL_USER= >> .env
echo SENTRY_EMAIL_PASSWORD= >> .env
echo SENTRY_EMAIL_USE_TLS= >> .env
```

```bash
docker-compose up -d
docker-compose exec sentry sentry upgrade
```

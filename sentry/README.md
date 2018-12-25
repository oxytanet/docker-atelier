# Sentry on proxyta.net

Sentry is an error tracking software:
https://sentry.io

## Configure

```bash
echo SENTRY_SECRET_KEY=$(openssl rand -base64 32) >> .env
echo SENTRY_EMAIL_HOST= >> .env
echo SENTRY_EMAIL_PORT= >> .env
echo SENTRY_EMAIL_USER= >> .env
echo SENTRY_EMAIL_PASSWORD= >> .env
echo SENTRY_EMAIL_USE_TLS= >> .env
```

## Deploy

```bash
docker-compose up -d
docker-compose exec sentry sentry upgrade
```

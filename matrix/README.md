# Matrix & Riot

https://matrix.org & https://riot.im

## DNS

For this project, you need to setup both `matrix` & `riot` subdomains of `$CHATONS_DOMAIN` (which defaults to
`localhost`)

## Configure

```
echo POSTGRES_PASSWORD=$(openssl rand -base64 32) >> .env
echo SYNAPSE_REPORT_STATS=no >> .env
echo SYNAPSE_ENABLE_REGISTRATION=yes >> .env
echo SYNAPSE_SMTP_PORT=465 >> .env
echo SYNAPSE_SMTP_HOST=mail.gandi.net >> .env
echo SYNAPSE_SMTP_USER=dev@oxyta.net >> .env
echo SYNAPSE_SMTP_PASSWORD=changeme >> .env
```

## Deploy
```
docker-compose up -d
```

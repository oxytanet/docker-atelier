# Static site

## Configure
To serve a static site for `changeme.domain.tld`:
```
echo CHATONS_STATIC_SITE=changeme >> .env
echo CHATONS_DOMAIN=domain.tld >> .env
```

## Deploy
```
docker-compose up -d
```

You just need to copy your static site content to:
```
/srv/chatons/static/changeme
```

Now you have a static site at URL `changeme.domain.tld`

## Update to latest version

```
docker pull nginx:alpine
docker-compose build --no-cache --pull
docker-compose up -d
```


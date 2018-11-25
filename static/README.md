# Static site

## Configure
To serve a static site for `changeme.domain.tld`:
```
export CHATONS_STATIC_SITE=changeme
export CHATONS_DOMAIN=domain.tld
```

## Deploy
```
docker-compose up -d
```

You just need to copy your static site content to:
```
/srv/chatons/static/changeme
```

Then ensure that root have read access to the files in `/srv/chatons/static/changeme`

Now you have a static site at URL `changeme.localhost` or `changeme.${CHATONS_DOMAIN}`


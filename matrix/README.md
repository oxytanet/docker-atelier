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
echo PROTOCOL=http >> .env  # or https for production
```

You can use `$CHATONS_DOMAIN` as `$SYNAPSE_SERVER_NAME`, if you setup the
[delegation](https://github.com/matrix-org/synapse/blob/master/docs/federate.md#delegation)

## Deploy
```
# first generate the configuration file based on environment variables
# the configuration file will be found in /$CHATONS_ROOT_DIR/$CHATONS_SERVICE/data/homserver.yaml
docker-compose run -e SYNAPSE_SERVER_NAME="${CHATONS_SERVICE}.${CHATONS_DOMAIN}" app migrate_config
docker-compose down

# If you want to activate mail functionality, you need now to add SMTP configuration to the file
# ${CHATONS_ROOT_DIR}/$CHATONS_SERVICE/data/homserver.yaml
# keep the first empty line to ensure it adds a new line to the last property in existing file
# do not activate notifs so far as it will prevent the server from starting
cat <<-EOF >> ${CHATONS_ROOT_DIR}/${CHATONS_SERVICE}/data/homserver.yaml

public_baseurl: ${PROTOCOL}://${CHATONS_SERVICE}.${CHATONS_DOMAIN}

email:
   enable_notifs: false
   smtp_host: "mail.gandi.net"
   smtp_port: 465
   smtp_user: "dev@oxyta.net"
   smtp_pass: "changeme"
   require_transport_security: true
   notif_from: "dev@oxyta.net"
   notif_for_new_users: true
   riot_base_url: "${PROTOCOL}://${RIOT_SUBDOMAIN}.${CHATONS_DOMAIN}"
EOF

# run the service
docker-compose up -d
```


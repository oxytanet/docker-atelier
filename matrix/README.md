# Matrix & Element

https://matrix.org & https://element.io

## DNS

For this project, you need to setup both `matrix` & `element` subdomains of `$CHATONS_DOMAIN` (which defaults to
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
source .env
# first generate the configuration file based on environment variables
# the configuration file will be found in ${CHATONS_ROOT_DIR:-/srv/chatons}/${CHATONS_SERVICE:-matrix}/data/homeserver.yaml
docker-compose run -e SYNAPSE_SERVER_NAME="${CHATONS_SERVICE:-matrix}.${CHATONS_DOMAIN:-localhost}" synapse migrate_config
docker-compose down

# Finish the configuration of the synapse serveur:
# keep the first empty line to ensure it adds a new line to the last property in existing file
cat <<-EOF >> ${CHATONS_ROOT_DIR:-/srv/chatons}/${CHATONS_SERVICE:-matrix}/data/homeserver.yaml

public_baseurl: "${PROTOCOL}://${CHATONS_SERVICE:-matrix}.${CHATONS_DOMAIN:-localhost}"
client_base_url: "${PROTOCOL}://${ELEMENT_SUBDOMAIN:-element}.${CHATONS_DOMAIN:-localhost}"

email:
   enable_notifs: false
   smtp_host: "mail.gandi.net"
   smtp_port: 465
   smtp_user: "dev@oxyta.net"
   smtp_pass: "changeme"
   require_transport_security: true
   notif_from: "dev@oxyta.net"
   notif_for_new_users: true
EOF

# Configure the client:
curl https://raw.githubusercontent.com/vector-im/element-web/develop/config.sample.json \
 | sed "/base_url/s=https://matrix-client.matrix.org=${PROTOCOL}://${CHATONS_SERVICE:-matrix}.${CHATONS_DOMAIN:-localhost}=;/server_name/s=matrix.org=${CHATONS_DOMAIN:-localhost}=" \
 > ${CHATONS_ROOT_DIR:-/srv/chatons}/${CHATONS_SERVICE:-matrix}/config.json

# run the service
docker-compose up -d
```

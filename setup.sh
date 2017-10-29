#!/bin/sh

# Set variables
export CHATONS_ROOT_DIR=/srv
export CHATONS_DOMAIN=oxyta.net
export CHATONS_MAIL=services@$CHATONS_DOMAIN
export CHATONS_MYSQL_PASSWORD=$(openssl rand -base64 32)
export CHATONS_MYSQL_ROOT_PASSWORD=$(openssl rand -base64 32)

if [ ! -d "$CHATONS_ROOT_DIR" ]; then
    echo "error: $CHATONS_ROOT_DIR must exist and be a regular folder" >&2
    exit 1
fi

# Export common environment variables

echo "CHATONS_ROOT_DIR=$CHATONS_ROOT_DIR" > .env
echo "CHATONS_DOMAIN=$CHATONS_DOMAIN" >> .env
echo "CHATONS_MAIL=$CHATONS_MAIL" >> .env

# Export specific environment configuration

mkdir -p cloud pad

echo "MYSQL_PASSWORD=$CHATONS_MYSQL_PASSWORD" > cloud/.env
echo "MYSQL_ROOT_PASSWORD=$CHATONS_MYSQL_ROOT_PASSWORD" >> cloud/.env
echo "MYSQL_ROOT_PASSWORD=$CHATONS_MYSQL_ROOT_PASSWORD" > pad/.env
echo "ETHERPAD_DB_PASSWORD=$CHATONS_MYSQL_ROOT_PASSWORD" >> pad/.env

# Configure traefik

mkdir -p "$CHATONS_ROOT_DIR/traefik"
touch "$CHATONS_ROOT_DIR/traefik/acme.json"
chmod 600 "$CHATONS_ROOT_DIR/traefik/acme.json"
sed "s/###DOMAIN###/$CHATONS_DOMAIN/" traefik/traefik.toml > "$CHATONS_ROOT_DIR/traefik/traefik.toml"
# Ateliers Docker

[Pad](https://mypads.framapad.org/mypads/?/mypads/group/altermediatic-toulouse-deatm79d/pad/view/docker-atelier-acqwh7km)

## Install on a clean Arch

```
# Install packages
pacman -Syu git docker docker-compose nginx certbot
systemctl start docker
systemctl enable docker

# Add keys
cd
git clone git@framagit.org:altermediatic/keys.git
cd .ssh
rm authorized_keys
ln -s ../keys/ssh authorized_keys

# Add this repo
cd
git clone git@framagit.org:altermediatic/docker-atelier.git
cd docker-atelier
```

## Deploy Services

add `include /etc/nginx/sites-enabled/*` to /etc/nginx/nginx.conf in http section

```
mkdir /etc/nginx/sites-enabled/ /srv/letsencrypt
export DOMAIN=oxyta.net
export MAIL=services@$DOMAIN
export MYSQL_PASSWORD=$(openssl rand -base64 32)
export MYSQL_ROOT_PASSWORD=$(openssl rand -base64 32)

for service in pad git cloud
do
    pushd $service
    ln -s $PWD/nginx.conf /etc/nginx/sites-enabled/$service
    certbot certonly --email $MAIL --webroot -w /srv/letsencrypt/ --agree-tos -d www.$service.$DOMAIN -d $service.$DOMAIN
    docker-compose up -d
    popd
done
```

## Deploy Frontal

```
cd frontal
docker build -t oxytanet .
docker run -d -p 8080:80 -t oxytanet
ln -s $PWD/nginx.conf /etc/nginx/sites-enabled/frontal
certbot certonly --email $MAIL --webroot -w /srv/letsencrypt/ --agree-tos -d www.$DOMAIN -d $DOMAIN
```

## Restart nginx

```
systemctl restart nginx
```

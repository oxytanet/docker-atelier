# Ateliers Docker

[Pad](https://mypads.framapad.org/mypads/?/mypads/group/altermediatic-toulouse-deatm79d/pad/view/docker-atelier-acqwh7km)

## All

- add `include /etc/nginx/sites-enabled/*` to /etc/nginx/nginx.conf in http section
```
mkdir /etc/nginx/sites-enabled/ /srv/letsencrypt
export DOMAIN=oxyta.net
export MAIL=<le mail pour les services>
```

## Frontal

```
cd frontal
docker build -t oxytanet .
docker run -d -p 8080:80 -t oxytanet
ln -s $PWD/nginx.conf /etc/nginx/sites-enabled/main
certbot certonly --email $MAIL --webroot -w /srv/letsencrypt/ --agree-tos -d www.$DOMAIN -d $DOMAIN
```

## Etherpad

```
cd etherpad
export MYSQL_ROOT_PASSWORD=$(openssl rand -base64 32)
ln -s $PWD/nginx.conf /etc/nginx/sites-enabled/etherpad
certbot certonly --email $MAIL --webroot -w /srv/letsencrypt/ --agree-tos -d www.pad.$DOMAIN -d pad.$DOMAIN
docker-compose up -d
```


## Nextcloud

```
cd nextcloud
export MYSQL_ROOT_PASSWORD=$(openssl rand -base64 32)
export MYSQL_PASSWORD=$(openssl rand -base64 32)
ln -s $PWD/nginx.conf /etc/nginx/sites-enabled/nextcloud
certbot certonly --email $MAIL --webroot -w /srv/letsencrypt/ --agree-tos -d www.cloud.$DOMAIN -d cloud.$DOMAIN
docker-compose up -d
```

## gitlab

```
cd gitlab
ln -s $PWD/nginx.conf /etc/nginx/sites-enabled/gitlab
certbot certonly --email $MAIL --webroot -w /srv/letsencrypt/ --agree-tos -d www.git.$DOMAIN -d git.$DOMAIN
docker-compose up -d
```

## After

```
systemctl restart nginx
```

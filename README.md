# Ateliers Docker

[Pad](https://mypads.framapad.org/mypads/?/mypads/group/altermediatic-toulouse-deatm79d/pad/view/docker-atelier-acqwh7km)

## Set main domain

`export MAIN_DOMAIN=oxyta.net`

## Etherpad

```
cd etherpad
export MYSQL_ROOT_PASSWORD=$(openssl rand -base64 32)
docker-compose up
```


## Nextcloud

```
cd nextcloud
export MYSQL_ROOT_PASSWORD=$(openssl rand -base64 32)
export MYSQL_PASSWORD=$(openssl rand -base64 32)

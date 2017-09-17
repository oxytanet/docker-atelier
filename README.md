# Ateliers Docker

[Pad](https://mypads.framapad.org/mypads/?/mypads/group/altermediatic-toulouse-deatm79d/pad/view/docker-atelier-acqwh7km)

## Install on a clean Arch

```
echo 'LANG="en_US.UTF-8"' > /etc/locale.conf
mkdir -p /etc/nginx/sites-enabled/ /srv/letsencrypt ~/.ssh

# Install packages
pacman -Syu --noconfirm git docker docker-compose nginx certbot
systemctl start docker
systemctl enable docker

# Add keys
cd
git clone https://framagit.org/altermediatic/keys.git
cd .ssh
rm -f authorized_keys
ln -s ../keys/ssh authorized_keys

# Add this repo
cd
git clone https://framagit.org/altermediatic/docker-atelier.git
cd docker-atelier
```

## Deploy Services


```
export DOMAIN=oxyta.net
export MAIL=services@$DOMAIN
export MYSQL_PASSWORD=$(openssl rand -base64 32)
export MYSQL_ROOT_PASSWORD=$(openssl rand -base64 32)

cp nginx.conf /etc/nginx
systemctl restart nginx
certbot certonly --email $MAIL --webroot -w /srv/letsencrypt/ --agree-tos -d www.$DOMAIN,$DOMAIN
for service in pad git cloud frontal
do
    pushd $service
    ln -s $PWD/nginx.conf /etc/nginx/sites-enabled/$service
    [[ $service != frontal ]] && certbot certonly --email $MAIL --webroot -w /srv/letsencrypt/ --agree-tos -d www.$service.$DOMAIN,$service.$DOMAIN
    docker-compose up -d
    popd
done
```

## Restart nginx

```
systemctl restart nginx
```

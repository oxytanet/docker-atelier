# Ateliers Docker

[Pad](https://mypads.framapad.org/mypads/?/mypads/group/altermediatic-toulouse-deatm79d/pad/view/docker-atelier-acqwh7km)

## Install on a clean Arch

```
# Set variables
export LANG=en_US.UTF-8
export DOMAIN=oxyta.net
export MAIL=services@$DOMAIN
export MYSQL_PASSWORD=$(openssl rand -base64 32)
export MYSQL_ROOT_PASSWORD=$(openssl rand -base64 32)

echo LANG="$LANG" > /etc/locale.conf
mkdir -p /etc/nginx/sites-enabled/ /srv/letsencrypt ~/.ssh

# Install packages
pacman -Syu --noconfirm git docker docker-compose nginx certbot msmtp-mta
systemctl start docker
systemctl enable docker
systemctl enable nginx
echo 'Port 222' >> /etc/ssh/sshd_config
systemctl restart sshd

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

# Get main Lets Encrypt cert

cp nginx.conf /etc/nginx
systemctl restart nginx
certbot certonly --email $MAIL --webroot -w /srv/letsencrypt/ --agree-tos -n -d  $(echo {,www.}{,pad.,git.,cloud.}$DOMAIN|tr ' ' ',')

# Set environment configuration

echo "MYSQL_PASSWORD=$MYSQL_PASSWORD" > cloud/.env
echo "MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD" >> cloud/.env
echo "MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD" > pad/.env
echo "ETHERPAD_DB_PASSWORD=$MYSQL_ROOT_PASSWORD" >> pad/.env

# Deploy Services

for service in pad git cloud homepage
do
    pushd $service
    ln -s $PWD/nginx.conf /etc/nginx/sites-enabled/$service
    docker-compose up -d
    popd
done

# Restart nginx

systemctl restart nginx

```

## Configure mail

[doc](mail)

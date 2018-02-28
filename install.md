## Install

```
# Install docker
# See https://docs.docker.com/engine/installation/linux/docker-ce/debian/#install-using-the-repository
apt install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -

echo \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable" \
   > /etc/apt/sources.list.d/docker.list

apt update && apt install docker-ce msmtp python3-pip

# install docker-compose
pip3 install docker-compose

# Start docker
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

# Configure environment variables in setup.sh then run it
./setup.sh

# Deploy Services (project name should only be set via the setup.sh file!)
docker-compose up -d
```

## Configure mail

[doc](mail)

## Update homepage

docker-compose build --no-cache

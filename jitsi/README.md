# Jitsi

https://jitsi.org/

## Configure

```bash
cp env.example .env
for pw in JICOFO_COMPONENT_SECRET JICOFO_AUTH_PASSWORD JVB_AUTH_PASSWORD JIGASI_XMPP_PASSWORD JIBRI_RECORDER_PASSWORD JIBRI_XMPP_PASSWORD
do
    echo $pw=$(openssl rand -base64 32) >> .env
done
echo DOCKER_HOST_ADDRESS="WRITE YOUR PUBLIC IP HERE" >> .env
echo CHATONS_DOMAIN=domain.tld >> .env
```

## Deploy

```bash
docker-compose up -d
```

# Kanboard

https://kanboard.org

## Configure
```
export DB_PASSWORD=$(openssl rand -base64 32|sed 's/[+/=]//g')
echo POSTGRES_PASSWORD=$DB_PASSWORD >> .env
echo DATABASE_URL=postgres://kanboard:$DB_PASSWORD@db/kanboard >> .env
```

## Deploy
```
docker-compose up -d
```

## First login

Go to your browser and login with admin/admin
**DO NOT FORGET** to change the user & password after first login

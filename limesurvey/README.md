# Limesurvey

https://www.limesurvey.org/

## Usage

```
echo POSTGRES_PASSWORD=$(openssl rand -base64 32) >> .env
docker-compose up -d --build
docker-compose exec app php application/commands/console.php install "ADMIN_USER" "ADMIN_PASSWORD" "ADMIN_NAME" "ADMIN_EMAIL"
```

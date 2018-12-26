# Limesurvey

https://www.limesurvey.org/

## Usage

```
echo POSTGRES_PASSWORD=$(openssl rand -base64 32) >> .env
docker-compose up -d --build
```

Go to your webbrowser to finish installation:
- DB name / DB host / DB user: `postgres`
- DB password: look inside .env

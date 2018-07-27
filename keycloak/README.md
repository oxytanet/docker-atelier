# Keycloak for centralized auth

https://www.keycloak.org/

## Configure
```
export DB_PASSWORD=$(openssl rand -base64 32)
echo KEYCLOAK_USER=admin >> .env
echo KEYCLOAK_PASSWORD=$(openssl rand -base64 32) >> .env
echo DB_USER=keycloak >> .env
echo DB_PASSWORD=$DB_PASSWORD >> .env
echo POSTGRES_USER=keycloak >> .env
echo POSTGRES_PASSWORD=$DB_PASSWORD >> .env
```

## Deploy
```
docker-compose up -d
```

## Configuring Keycloak and Nextcloud

Notes:
- When following the instruction below, replace YOURDOMAIN with your actual base domain name, or by "localhost" if you are developping locally.
- When values between "" are indicated to fill form fields, the "" themselves must not be included.

### Keycloak side

- Login to keycloak using the admin account at `keycloak.YOURDOMAIN`
  (the login and password for the admin account can be found in the `.env` file under `KEYCLOAK_USER` and `KEYCLOACK_PASSWORD`)
- If it is not the current realm already, switch the realm to `chatons`
- Under `Clients`, select the client with `Client ID` "nextcloud", then go the the `Credentials` tab, note the `Secret`
- OPTIONAL: If there is no registered user yet you can create a test user: go to `Users`, click the `Add User` button, fill the `Username` with "test" and save. Then go to the `Credentials` tab, put the new password, toggle the `Temporary` option to `OFF`, press `Reset Password` and confirm

Keycloak is now ready to be used for Nextcloud.

### NextCloud side

(here we assume the base Nextcloud instance has already been configured with an admin account)

- login to your Nextcloud instance with the admin account
- Click on the user profile, then `Apps`
- Go to `Social & communication` and install the `Social Login` app
- Go to `Settings` (in your user profile) the `Social Login`
- Add a new `Custom OpenID Connect` by clicking on the `+` to its side
- Fill the following:
  - `Title` -> "keycloak"
  - `Authorize url` -> "http://keycloak.YOURDOMAIN/auth/realms/master/protocol/openid-connect/auth" (don't forget to replace "YOURDOMAIN" by your own domain here!)
  - `Token url` -> "http://keycloak:8080/auth/realms/master/protocol/openid-connect/token"
  - `Client id` -> "nextcloud"
  - `Client Secret` -> put the secret you noted down during the Keycloak configuration
  - `Scope` -> "openid"
- Press `Save`

Your Nextcloud instance is now configured. Log out and log back in using the `Alternative Logins -> keycloak` method on the login page. It should redirect you to a keycloak auth form where you can log in with a registered keycloak user, then back to Nextcloud where you are now logged.

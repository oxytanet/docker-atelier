FROM jboss/keycloak:4.1.0.Final

COPY chatons-realm.json /import/chatons-realm.json

CMD ["-b", "0.0.0.0", "-Dkeycloak.migration.action=import", "-Dkeycloak.migration.provider=dir", "-Dkeycloak.migration.dir=/import", "-Dkeycloak.migration.strategy=IGNORE_EXISTING"]

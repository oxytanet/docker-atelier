FROM jboss/keycloak:4.1.0.Final

COPY chatons-realm.json /import/chatons-realm.json

RUN curl -L -o keycloak/standalone/deployments/keycloak-protocol-cas-4.1.0.jar https://github.com/Doccrazy/keycloak-protocol-cas/releases/download/4.1.0/keycloak-protocol-cas-4.1.0.jar

USER root

CMD ["-b", "0.0.0.0", "-Djboss.http.port=80", "-Dkeycloak.migration.action=import", "-Dkeycloak.migration.provider=dir", "-Dkeycloak.migration.dir=/import", "-Dkeycloak.migration.strategy=IGNORE_EXISTING"]

FROM nginx:alpine

WORKDIR /usr/share/nginx/html
RUN apk add --no-cache curl

ARG RIOT_VERSION
ARG SYNAPSE_SERVER_NAME

RUN curl -sSL https://github.com/vector-im/riot-web/releases/download/$RIOT_VERSION/riot-$RIOT_VERSION.tar.gz | tar -xz
RUN mv riot-$RIOT_VERSION/* .
RUN sed "/default_hs_url/s/https:\/\/matrix.org/\/\/$SYNAPSE_SERVER_NAME/" config.sample.json > config.json

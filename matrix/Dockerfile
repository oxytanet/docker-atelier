FROM nginx:alpine

WORKDIR /usr/share/nginx/html
RUN apk add --no-cache curl

ARG RIOT_VERSION
RUN curl -sSL https://github.com/vector-im/riot-web/releases/download/$RIOT_VERSION/riot-$RIOT_VERSION.tar.gz \
  | tar -xz --strip-components=1

ARG SYNAPSE_FULL_URL
ARG PROTOCOL
RUN sed "/default_hs_url/s=https://matrix.org=${PROTOCOL}://${SYNAPSE_FULL_URL}=" config.sample.json > config.json

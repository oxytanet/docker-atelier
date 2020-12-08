FROM nginx:alpine

WORKDIR /usr/share/nginx/html
RUN apk add --no-cache curl

ARG ELEMENT_VERSION
RUN curl -sSL https://github.com/vector-im/element-web/releases/download/$ELEMENT_VERSION/element-$ELEMENT_VERSION.tar.gz \
  | tar -xz --strip-components=1

ARG SYNAPSE_FULL_URL
ARG PROTOCOL
ARG CHATONS_DOMAIN
RUN sed "/base_url/s=https://matrix-client.matrix.org=${PROTOCOL}://${SYNAPSE_FULL_URL}=;/server_name/s=matrix.org=${CHATONS_DOMAIN}=" config.sample.json > config.json

FROM node:alpine as build

RUN apk add --no-cache curl
RUN mkdir /front-pad
RUN curl -sSL https://framagit.org/altermediatic/front-pad/repository/master/archive.tar.gz | tar --directory /front-pad -xz --strip 1
WORKDIR /front-pad
RUN npm set progress=false && npm i && npm run css

FROM tvelocity/etherpad-lite

WORKDIR /opt/etherpad-lite

COPY --from=build /front-pad/index.html src/templates/
COPY --from=build /front-pad/static/custom/index.css src/static/custom/

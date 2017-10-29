FROM node:alpine as build

RUN apk add --no-cache curl
RUN mkdir /front-chatons
RUN curl -sSL https://framagit.org/altermediatic/front-chatons/repository/master/archive.tar.gz | tar --directory /front-chatons -xz --strip 1
WORKDIR /front-chatons
RUN npm set progress=false && npm i

FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html
COPY --from=build /front-chatons /usr/share/nginx/html

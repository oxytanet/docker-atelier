ARG THEME_IMAGE

FROM ${THEME_IMAGE} AS build
FROM tvelocity/etherpad-lite

WORKDIR /opt/etherpad-lite

COPY --from=build /opt/etherpad-lite/src/templates/index.html src/templates/
COPY --from=build /opt/etherpad-lite/src/static/custom/index.css src/static/custom/

COPY  plugins.txt ./plugins.txt
COPY  install-plugins.sh ./install-plugins.sh

RUN ./install-plugins.sh

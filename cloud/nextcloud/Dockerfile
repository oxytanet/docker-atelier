FROM nextcloud:production-fpm-alpine

ARG max_children
RUN if [ "${max_children}" != "default" ]; then echo "pm.max_children = ${max_children}" > /usr/local/etc/php-fpm.d/z-local.conf; fi


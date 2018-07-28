#!/bin/bash

DATE=$(date +"%Y%m%d-%H:%M")

if [ "$#" -ne 1 ]; then
    echo "Usage: $(basename $0) <output folder>"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: folder $1 does not exist" >&2
    exit 2
fi

# Get the absolute path of the output dir
# Note: This is important, since we will move to the script directory
OUT_PATH="$( readlink -m $1)"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd $SCRIPT_DIR

docker-compose exec --user www-data app php occ maintenance:mode --on

docker cp "$(docker-compose ps -q app)":/var/www/html - > "$OUT_PATH"/nextcloud-folder.$DATE.tar.gz && \
    docker-compose exec -T db sh -c 'pg_dump -U $POSTGRES_USER' > "$OUT_PATH"/nextcloud-db.$DATE.pgdump # Note: -T required to get correct return code

BACKUP_CODE="$?"

if [ $BACKUP_CODE -ne 0 ]; then
    echo
    echo "Backup failed (code $BACKUP_CODE)! Nextcloud kept in maintenance mode" >&2
else
    docker-compose exec --user www-data app php occ maintenance:mode --off
fi

exit $BACKUP_CODE

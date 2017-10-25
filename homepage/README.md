# Homepage in frontal_app

## Install

    cd homepage
    ln -s $PWD/nginx.conf /etc/nginx/sites-enabled/frontal
    docker-compose up -d

## Update

    cd homepage
    docker-compose build --no-cache
    docker-compose up -d

#!/bin/sh

# User developer with perms
useradd \
    --uid ${UID:=1000} \
    --create-home \
    --shell=/bin/bash \
    developer

chown \
    developer: \
    -R \
    /home/developer

ln \
    -s \
    /var/www/html \
    ~developer/current

# Start Postgres and init user
service postgresql start
sudo -u postgres sh -c 'createuser -d developer'
sudo -u postgres psql -c "ALTER USER developer PASSWORD 'developer';"

# Start Apache
service apache2 start

# Container command
tail -f /var/log/apache2/error.log

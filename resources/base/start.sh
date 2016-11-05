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

# Bin
sudo -u developer sh -c 'mkdir ~/bin'

sh /resources/php56-apache/start.sh
sh /resources/php56-apache/install-composer.sh developer
sh /resources/postgres94/start.sh

# Container command
tail -f /var/log/apache2/error.log

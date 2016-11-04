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

# Composer
sudo -u developer sh -c 'wget https://getcomposer.org/installer -O composer-installer.php'
sudo -u developer sh -c 'php composer-installer.php --install-dir ~/bin --filename composer'
sudo -u developer sh -c 'rm composer-installer.php'

# Node version manager & Node
sudo -i -u developer /node.sh

# Start services
service postgresql start
service apache2 start

# Container command
tail -f /var/log/apache2/error.log

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

# SSH
sudo -u developer sh -c 'mkdir ~/.ssh && touch ~/.ssh/known_hosts'
sudo -u developer sh -c 'ssh-keyscan -t rsa bitbucket.org > ~/.ssh/known_hosts'
if [ -z "$SSH_KEY" ]
then
    echo "Attention: Env var SSH_KEY is not set!"
else
    sudo -E -u developer sh -c '(umask 077; echo $SSH_KEY | base64 --decode > /home/developer/.ssh/id_rsa)'
fi

sh /resources/shared/apache-php/start.sh
sh /resources/shared/apache-php/install-composer.sh developer
sh /resources/shared/postgres94/start.sh

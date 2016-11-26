#!/usr/bin/env bash

sudo -i -u $1 sh -c 'wget https://getcomposer.org/installer -O composer-installer.php'
sudo -i -u $1 sh -c 'php composer-installer.php --install-dir ~/bin --filename composer'
sudo -i -u $1 sh -c 'rm composer-installer.php'

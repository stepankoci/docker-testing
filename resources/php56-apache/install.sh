#!/usr/bin/env bash

apt-get install -y \
        libapache2-mod-php5 \
        php5-pgsql \
        php5-gd \
        php5-curl \
        php5-intl \
        php5-json

apt-get clean

#!/usr/bin/env bash

cat /resources/php70-apache/sources.list >> /etc/apt/sources.list

apt-get update -y

apt-get install -y \
        libapache2-mod-php7.0 \
        php7.0-curl \
        php7.0-ctype \
        php7.0-gd \
        php7.0-intl \
        php7.0-json \
        php7.0-mbstring \
        php7.0-mcrypt \
        php7.0-mysql \
        php7.0-pgsql \
        php7.0-xml

apt-get clean

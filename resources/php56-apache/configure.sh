#!/usr/bin/env bash

# User
RUN sed -i 's/^export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=developer/' /etc/apache2/envvars

# Enable mod rewrite
RUN a2enmod rewrite

# Apache virtual
cp /resources/php56-apache/apache-virtual.conf /etc/apache2/sites-enabled/000-default.conf

# PHP ini
cp /resources/php56-apache/php.ini /etc/php5/apache2/conf.d/90-user.ini
cp /resources/php56-apache/php.ini /etc/php5/cli/conf.d/90-user.ini

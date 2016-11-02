FROM debian:stable
MAINTAINER Stepan Koci <stepan.koci@gmail.com>

ENV HOME /root

RUN echo " \n\
    deb http://httpredir.debian.org/debian stable main\n \
    deb http://httpredir.debian.org/debian stable-updates main\n \
    deb http://security.debian.org/ stable/updates main" > /etc/apt/sources.list

RUN apt-get update && apt-get upgrade -y

# ========== INSTALL ==========

# Basic utilities
RUN apt-get install -y \
        zip \
        openssl \
        pwgen \
        curl \
        vim \
        ssh \
        less \
        git \
        screen \
        wget \
        bzip2 \
        sudo \
        rsync \
        unzip \
        locales \
        subversion \
        mc

# PHP & Apache
RUN apt-get install -y \
        libapache2-mod-php5 \
        php5-pgsql \
        php5-gd \
        php5-curl \
        php5-intl \
        php5-json

# Postgres
RUN apt-get install -y \
        postgresql

# Cleanup
RUN apt-get clean

# Composer
RUN wget https://getcomposer.org/installer -O composer-installer.php && php composer-installer.php && rm composer-installer.php

# Node version manager & Node
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
ENV NVM_DIR=$HOME/.nvm
RUN . $NVM_DIR/nvm.sh && nvm install stable && nvm use stable

# ========== SETUP ==========

RUN git config --global core.editor vim && \
    git config --global color.ui true && \
    git config --global core.fileMode false

# Apache user
RUN sed -i 's/^export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=developer/' /etc/apache2/envvars
# Enable mod rewrite
RUN a2enmod rewrite
ENV TERM xterm


EXPOSE 80
EXPOSE 443

WORKDIR /var/www/html

COPY ./bin/start.sh /start.sh
COPY ./config/php.ini /etc/php5/apache2/conf.d/90-user.ini
COPY ./config/php.ini /etc/php5/cli/conf.d/90-user.ini
COPY ./config/apache-virtual.conf /etc/apache2/sites-enabled/000-default.conf

# Start
CMD ["/start.sh"]


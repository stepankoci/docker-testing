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


# ========== SETUP ==========

RUN git config --global core.editor vim && \
    git config --global color.ui true && \
    git config --global core.fileMode false

# Apache user
RUN sed -i 's/^export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=developer/' /etc/apache2/envvars
# Enable mod rewrite
RUN a2enmod rewrite
ENV TERM xterm

# Postgres user
RUN service postgresql start && \
    sudo -u postgres sh -c 'createuser -d developer' && \
    sudo -u postgres psql -c "ALTER USER developer PASSWORD 'developer';"

EXPOSE 80
EXPOSE 443

WORKDIR /var/www/html

COPY ./bin/start.sh /start.sh
COPY ./bin/node.sh /node.sh
COPY ./config/php.ini /etc/php5/apache2/conf.d/90-user.ini
COPY ./config/php.ini /etc/php5/cli/conf.d/90-user.ini
COPY ./config/apache-virtual.conf /etc/apache2/sites-enabled/000-default.conf
RUN chmod a+rwx /node.sh

# Start
CMD ["/start.sh"]


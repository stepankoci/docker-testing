#!/usr/bin/env bash

cat /resources/shared/base/sources.list > /etc/apt/sources.list

apt-get update -y

apt-get install -y \
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
        cron \
        mysql-client \
        mc

apt-get clean

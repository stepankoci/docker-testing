#!/usr/bin/env bash

cat /resources/base/sources.list > /etc/apt/sources.list

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
        mc

apt-get clean

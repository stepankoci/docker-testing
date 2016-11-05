Apache + PHP 5.6
================

Dockerfile
----------

    RUN sh /resources/php56-apache/install.sh
    RUN sh /resources/php56-apache/configure.sh

    EXPOSE 80
    EXPOSE 443
    
    WORKDIR /var/www/html

Start
-----

    /resources/php56-apache/start.sh

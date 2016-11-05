FROM debian:stable
MAINTAINER Stepan Koci <stepan.koci@gmail.com>

ENV HOME /root
ENV TERM xterm

COPY resources /resources

RUN sh /resources/base/install.sh
RUN sh /resources/base/configure.sh

RUN sh /resources/php56-apache/install.sh
RUN sh /resources/php56-apache/configure.sh

RUN sh /resources/postgres94/install.sh
RUN sh /resources/postgres94/configure.sh

EXPOSE 80
EXPOSE 443

WORKDIR /var/www/html

CMD /resources/base/start.sh
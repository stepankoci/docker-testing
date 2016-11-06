#!/bin/sh

sh /resources/base/start.sh

# Container command
tail -f /var/log/apache2/error.log

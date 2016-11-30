#!/bin/sh

sh /resources/shared/base/start.sh

# Container command
tail -f /var/log/apache2/error.log

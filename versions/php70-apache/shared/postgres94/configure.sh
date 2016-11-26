#!/usr/bin/env bash

service postgresql start
sudo -u postgres sh -c 'createuser -d developer'
sudo -u postgres psql -c "ALTER USER developer PASSWORD 'developer';"

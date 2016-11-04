#!/bin/sh

# Download NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash

# Define nvm dir
export NVM_DIR=$HOME/.nvm

# Run nvm
. ~/.nvm/nvm.sh

# Install and set and freeze node/npm versions
nvm install stable
nvm use stable
echo "stable" > $HOME/.nvmrc

#!/bin/bash

# checking Homebrew
BREW_DIR=`which brew`
if [ "$BREW_DIR" == "" ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# install the application path
BASE_DIR=$(dirname $0)
echo "export PATH=\$PATH:${BASE_DIR}" >> ~/.bash_profile

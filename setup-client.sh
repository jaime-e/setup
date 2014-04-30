#!/bin/bash
# ripple gateway setup

#instalar python, g++, make, libpq-dev, nodejs, grunt, npm

sudo apt-get -y install python-software-properties
sudo apt-get -y install python
sudo apt-get -y install g++
sudo apt-get -y install make
sudo apt-get -y install libpq-dev
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get -y update
sudo apt-get -y install nodejs
sudo apt-get -y install npm
sudo npm install -g grunt-cli

#instalar cliente
git clone https://github.com/ripple/ripple-client ./ripple-client
cd ripple-client
sudo npm install
cp src/js/config-example.js src/js/config.js
grunt





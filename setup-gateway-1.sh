#!/bin/bash
# ripple gateway setup

#instalar python, g++, make, libpq-dev, nodejs

sudo apt-get -y install python-software-properties
sudo apt-get -y install python
sudo apt-get -y install g++
sudo apt-get -y install make
sudo apt-get -y install libpq-dev
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get -y update
sudo apt-get -y install nodejs
sudo apt-get -y install postgresql
sudo apt-get -y install postgresql-client
sudo -u postgres psql postgres

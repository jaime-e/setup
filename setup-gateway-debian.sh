#!/bin/bash
# Ripple gateway for Debian wheezy


#install node

sudo apt-get install python g++ make checkinstall fakeroot
src=$(mktemp -d) && cd $src
wget -N http://nodejs.org/dist/node-latest.tar.gz
tar xzvf node-latest.tar.gz && cd node-v*

./configure

sudo fakeroot checkinstall -y --install=no --pkgversion $(echo $(pwd) | sed -n -re's/.+node-v(.+)$/\1/p') make -j$(($(nproc)+1)) install

sudo dpkg -i node_*
 
sudo apt-get -y update

#postgres
sudo apt-get install postgresql postgresql-client

cd $home

git clone https://github.com/ripple/gatewayd

cd gatewayd
 
# install gateway dependencies
sudo apt-get install -y libpq-dev python-software-properties
sudo npm install --global pg pm2 grunt grunt-cli forever grunt-db-migrate
sudo npm install --global grunt-jsdoc
sudo npm install --save
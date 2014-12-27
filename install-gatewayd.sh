#!/bin/bash
# dnxapp-gatewayd for Debian wheezy

cd $home

git clone https://github.com/dinexcode/dnxapp-gatewayd.git

cd gatewayd
 
# install gateway dependencies
sudo apt-get install -y libpq-dev python-software-properties
sudo npm install --global pg pm2 grunt grunt-cli forever grunt-db-migrate
sudo npm install --global grunt-jsdoc
sudo npm install --save

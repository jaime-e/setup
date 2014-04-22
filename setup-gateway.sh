#!/bin/bash
#setup for ripple gateway on ubuntu 13.04

#node.js and packages
sudo apt-get -y install git
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

#configure postgres
sudo -u postgres psql postgres
\password postgres
\q

sudo -u postgres createdb ripple_gateway

#gateway API server
git clone https://github.com/ripple/ripple-gateway
cd ripple-gateway

npm install -g pg

sudo npm install -g db-migrate
sudo npm install -g forever

npm install

#migrate database to create network tables
#export DATABASE_URL=postgres://postgres:password@localhost:5432/ripple_gateway
#cd node_modules/ripple-gateway-data-sequelize
#db-migrate up
#cd ../..

#start the gateway rest api server
#bin/gateway start


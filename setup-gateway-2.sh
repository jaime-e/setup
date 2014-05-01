#!/bin/bash
# ripple gateway setup

sudo -u postgres createdb ripple_gateway

#poner como editar postgres.conf para cambiar los postgre.conf para cambiar la ip de escucha

cd /etc/postgresql/9.3/main/

sudo chmod 777 postgresql.conf pg_hba.conf
sudo sed -i '59 s/#//' postgresql.conf
sudo sed -i '59 s/localhost/*/' postgresql.conf
sudo sed -i '92 s+127.0.0.1/32+0.0.0.0/0+' pg_hba.conf
sudo sed -i '94 s+::1/128+::/0+' pg_hba.conf
cd $HOME
sudo /etc/init.d/postgresql restart

#instalar ripple-gateway api

sudo npm install -g pg
sudo npm install -g db-migrate
sudo npm install -g forever
sudo npm install -g grunt-cli
sudo npm install -g grunt
sudo npm install --save ripple-gateway

cd node_modules/ripple-gateway/config
sudo sed -i '8 s+localhost+ec2-54-186-166-153.us-west-2.compute.amazonaws.com+' config.js
sudo sed -i '9 s+password+pass+' config.js
sudo sed -i '9 s+localhost+54.186.166.153+' config.js
sudo sed -i '15 s+localhost+ec2-54-186-166-153.us-west-2.compute.amazonaws.com+' config.js

cd ..
sudo npm install -g grunt-db-migrate
export DATABASE_URL=postgres://postgres:pass@54.186.166.153:5432/ripple_gateway?native=true
grunt migrate:up



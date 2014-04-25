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
\password postgres
sudo -u postgres createdb ripple_gateway

#poner como editar postgres.conf para cambiar los postgre.conf para cambiar la ip de escucha
cd /etc/postgresql/9.3/main/
#sudo chmod 777 postgresql.conf pg_hba.conf
#sudo sed -i '59 s/#//' postgresql.conf
#sudo sed -i '59 s/localhost/*/' postgresql.conf
#sudo sed -i '92 s+127.0.0.1/32+0.0.0.0/0+' pg_hba.conf
#sudo sed -i '94 s+::1/128+::/0+' pg_hba.conf
#cd $HOME
#sudo /etc/init.d/postgresql restart
#export DATABASE_URL=postgres://postgres:pass@54.186.97.132:5432/ripple_gateway?native=true

#instalar ripple-gateway api

#sudo npm install -g pg
#sudo npm install -g db-migrate
#sudo npm install -g forever
#sudo npm install -g grunt-cli
#sudo npm install -g grunt
#sudo npm install -g grunt-db-migrate
#sudo npm install --save ripple-gateway

#cd node_modules/ripple-gateway/config
#sudo sed -i '8 s+localhost+ec2-54-186-97-132.us-west-2.compute.amazonaws.com+' config.js
#sudo sed -i '9 s+password+pass+' config.js
#sudo sed -i '9 s+localhost+54.186.97.132+' config.js
#sudo sed -i '15 s+localhost+ec2-54-186-97-132.us-west-2.compute.amazonaws.com+' config.js

#cd ..
#grunt migrate:up






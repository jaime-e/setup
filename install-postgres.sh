#!/bin/bash
# postgres db setup

#install
sudo apt-get install postgresql postgresql-client

#poner como editar postgres.conf para cambiar los postgre.conf para cambiar la ip de escucha

cd /etc/postgresql/9.1/main/
sudo chmod 777 postgresql.conf pg_hba.conf
sudo sed -i '59 s/#//' postgresql.conf
sudo sed -i '59 s/localhost/*/' postgresql.conf
sudo sed -i '92 s+127.0.0.1/32+0.0.0.0/0+' pg_hba.conf
sudo sed -i '94 s+::1/128+::/0+' pg_hba.conf

#restart
cd $HOME
sudo /etc/init.d/postgresql restart

#!/bin/bash
# ripple gateway config development

sudo -u postgres createdb ripple_gateway

cd gatewayd/config

sudo sed -i '8 s+production+development+' config.js
sudo sed -i '9 s+localhost+108.59.85.231+' config.js
sudo sed -i '12 s+password+pass+' config.js
sudo sed -i '12 s+localhost+108.59.85.231+' config.js
sudo sed -i '24 s+localhost+108.59.85.231+' config.js

cd ..
ln -s ~/gatewayd/lib/data/migrations ~/gatewayd/migrations

cd lib/data
cp database.example.json database.json

sudo sed -i '3 s+DATABASE_URL+DATABASE_URL=postgres://postgres:pass@108.59.85.231:5432/ripple_gateway+' database.json 

cd ..
cd ..
grunt migrate



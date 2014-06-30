#!/bin/bash
# ripple gateway config

sudo -u postgres createdb ripple_gateway

cd node_modules/ripple-gateway/config
sudo sed -i '8 s+localhost+108.59.85.231+' config.js
sudo sed -i '11 s+password+pass+' config.js
sudo sed -i '11 s+localhost+108.59.85.231+' config.js
sudo sed -i '23 s+localhost+108.59.85.231+' config.js

cd ..
ln -s ~/node_modules/ripple-gateway/lib/data/migrations ~/node_modules/ripple-gateway/migrations

cd $HOME
export DATABASE_URL=postgres://postgres:pass@108.59.85.231:5432/ripple_gateway?native=true
cd node_modules/ripple-gateway/
grunt migrate



#!/bin/bash
# ripple gateway config

cd node_modules/ripple-gateway/config
sudo sed -i '8 s+localhost+108.59.85.231+' config.js
sudo sed -i '9 s+password+pass+' config.js
sudo sed -i '9 s+localhost+108.59.85.231+' config.js
sudo sed -i '15 s+localhost+108.59.85.231+' config.js

cd ..
ln -s ~/node_modules/ripple-gateway/lib/data ~/node_modules/ripple-gateway/

cd $HOME
export DATABASE_URL=postgres://postgres:pass@108.59.85.231:5432/ripple_gateway?native=true
cd node_modules/ripple-gateway/
grunt migrate



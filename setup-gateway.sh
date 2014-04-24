#!/bin/bash
# simple dev environment for ubuntu no heroku
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg


# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/jaime-e/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

#instalar python, g++, make, libpq-dev, nodejs

sudo apt-get -y install python-software-properties
sudo apt-get -y install python
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

sudo /etc/init.d/postgresql restart

sudo npm install -g pg
sudo npm install -g db-migrate
sudo npm install -g forever
sudo npm install -g grunt-cli
sudo npm install grunt
sudo npm install grunt-db-migrate


#instalar pip para manejar paquetes de piython
sudo apt-get install python-pip


#!/bin/bash
# simple dev environment for debian

sudo apt-get -y install emacs


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


#install node
sudo apt-get install -y python g++ make checkinstall fakeroot
sudo apt-get install -y libpq-dev python-software-properties
src=$(mktemp -d) && cd $src
wget -N http://nodejs.org/dist/node-latest.tar.gz
tar xzvf node-latest.tar.gz && cd node-v*
./configure
sudo fakeroot checkinstall -y --install=no --pkgversion $(echo $(pwd) | sed -n -re's/.+node-v(.+)$/\1/p') make -j$(($(nproc)+1)) install
 sudo dpkg -i node_*
 
sudo apt-get -y update
 
#postgres
sudo apt-get install postgresql postgresql-client
 
# install gateway dependencies
sudo npm install --global pg pm2 grunt grunt-cli forever db-migrate

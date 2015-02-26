#!/bin/bash
# Simple setup.sh for configuring Ubuntu 14.04 LTS desktop
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm

sudo apt-get install -y curl

# Load nvm and install latest stable node
#curl https://raw.github.com/creationix/nvm/master/install.sh | sh
#source $HOME/.nvm/nvm.sh
#nvm install stable
#nvm use stable

#get nodejs from package manager
curl -sL https://deb.nodesource.com/setup | sudo bash -

#install
sudo apt-get install nodejs

#update npm
sudo npm install -g npm

#set npm folder to user owned dir
npm config set prefix '/usr/local'

#change ownership of npm folder
sudo chown -R `whoami` /usr/local

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
git clone https://github.com/jaime-ez/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

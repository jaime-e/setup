#!/bin/bash
# nodejs installation for a recently created debian machine using nvm

#set locale
sudo sed -i 's|# es_CL.UTF-8 UTF-8|es_CL.UTF-8 UTF-8|g' /etc/locale.gen
sudo locale-gen

#update
sudo apt-get update && sudo apt-get -y upgrade

#git
sudo apt-get -y install git

#nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | bash

# Load nvm and install latest production node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install stable
nvm use stable

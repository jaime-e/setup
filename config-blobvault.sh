#!/bin/bash
#1: Install postgres y postgres-dev:
sudo apt-get install -u postgresql libpq-dev &&

#2: Clone repo and install dependencies
git clone https://github.com/ripple/ripple-blobvault.git &&
cd ripple-blobvault &&
npm install --save



#!/bin/bash
#dnxapp-blobvault installation scripto for debian
#path cd home?

#2: Clone repo and install dependencies

git clone https://github.com/dinexcode/dnxapp-blobvault.git &&
cd  dnxapp-blobvault
npm install --save

#knexmigration


#allow node to use port 80
sudo apt-get install libcap2-bin
sudo setcap cap_net_bind_service=+ep /usr/local/bin/node

#install pm2
sudo npm install pm2 -g --unsafe-perm

#change ownership
chown safeuser /var/www/


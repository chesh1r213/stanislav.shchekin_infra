#!/bin/bash
echo "deb http://repo.pritunl.com/stable/apt focal main" | sudo tee /etc/apt/so>
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D58>
curl https://raw.githubusercontent.com/pritunl/pgp/master/pritunl_repo_pub.asc >
echo "deb https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse">
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add>
apt update
apt -y install wireguard wireguard-tools
ufw disable
apt -y install pritunl mongodb-org
systemctl enable mongod pritunl
systemctl start mongod pritunl
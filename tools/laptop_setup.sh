#!/bin/bash

set -e

wget -c https://releases.hashicorp.com/vagrant/2.2.3/vagrant_2.2.3_x86_64.deb
sudo dpkg -i vagrant_2.2.3_x86_64.deb
echo "deb https://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee --append /etc/apt/sources.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt update
sudo apt install -y virtualbox-6.0 hugo git

#vagrant box add --name laptop https://s3-us-west-2.amazonaws.com/ts2019-ops/laptop.box
vagrant box add --name laptop laptop.box


cd ~ && git clone https://github.com/dneff/ts2019-challenges.git


echo 'Host devops
   User vagrant
   StrictHostKeyChecking no
   UserKnownHostsFile=/dev/null
   IdentityFile ~/.vagrant.d/boxes/laptop/0/virtualbox/vagrant_private_key
   Hostname 192.168.33.10
   Port 22' >> ~/.ssh/config

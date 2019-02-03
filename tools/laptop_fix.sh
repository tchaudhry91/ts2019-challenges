#!/bin/bash

set -e

# ensure distro is up to date
#sudo apt update
#sudo apt upgrade -y

wget -c https://releases.hashicorp.com/vagrant/2.2.3/vagrant_2.2.3_x86_64.deb
sudo dpkg -i vagrant_2.2.3_x86_64.deb
#echo "deb https://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee --append /etc/apt/sources.list
#wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
#sudo apt update
sudo apt install -y virtualbox-6.0 hugo git
sudo apt install -y nginx

# assuming the laptop.box image is local to script. Swap to pull from remote (~4Gb)

#vagrant box add --name laptop https://s3-us-west-2.amazonaws.com/ts2019-ops/laptop.box
#vagrant box add --name laptop laptop.box

# assuming script is not being run from inside repo.

sudo rm -rf ts2019-challenges
cd ~ && git clone https://github.com/dneff/ts2019-challenges.git

cd ${HOME}/ts2019-challenges && sudo hugo -s docs -d /var/www/html -b "http://localhost:1313"
sudo sed -i 's/80/1313/' /etc/nginx/sites-enabled/default
sudo service nginx restart

sudo rm -rf ~/.ssh/config

echo 'Host devops
   User vagrant
   StrictHostKeyChecking no
   UserKnownHostsFile=/dev/null
   IdentityFile ~/.vagrant.d/boxes/laptop/0/virtualbox/vagrant_private_key
   Hostname 192.168.33.10
   Port 22' > ~/.ssh/config

lsmod | grep vbox

sudo rm -rf  ~/.vagrant.d/

cat ~/.ssh/config

firefox http://localhost:1313

set -e
vagrant box add --name laptop laptop.box
cd ts2019-challenges/
vagrant up
ssh devops /snap/bin/kubectl get nodes
ssh devops 'cd /vagrant/challanges/devops/ci-cd/; PATH=$PATH:/snap/bin bash /vagrant/challanges/devops/ci-cd/start.sh'
history -c
firefox http://192.168.33.10


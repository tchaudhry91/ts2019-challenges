
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "laptop"
  config.vm.define :laptop do |vm|
  end
  config.vm.box_check_update = false
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provider "virtualbox" do |vb|
     vb.gui = false
     vb.memory = "4096"
     vb.cpus = "4"
  end
  config.vm.provision "shell", inline: "microk8s.status --wait-ready && iptables -P FORWARD ACCEPT && microk8s.inspect"
end

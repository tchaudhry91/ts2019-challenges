
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
     vb.memory = "8192"
     vb.cpus = "4"
     vb.customize [ "modifyvm", :id, "--uart1", "0x3F8", "4" ]
     vb.customize [ "modifyvm", :id, "--uartmode1", "file", File.join(Dir.pwd, "ubuntu-bionic-18.04-cloudimg-console.log") ]
  end
  config.vm.provision "shell", inline: "microk8s.status --wait-ready"
  config.vm.provision "shell", inline: "sleep 5; microk8s.status --wait-ready"
  config.vm.provision "shell", inline: "iptables -P FORWARD ACCEPT"
  config.vm.provision "shell", inline: "microk8s.inspect"
end

#!/bin/bash
set -e
rm -f laptop.box
vagrant destroy -f
vagrant up
vagrant package --output laptop.box --vagrantfile Vagrantfile.laptop
vagrant destroy -f
vagrant box list | grep laptop  && vagrant box remove laptop
vagrant box add laptop.box --name laptop


#!/bin/bash
set -e
rm -f laptop.box
(cd ../../ && vagrant destroy -f)
vagrant destroy -f
vagrant up
vagrant package --output laptop.box
vagrant destroy -f
vagrant box list | grep laptop  && vagrant box remove -f laptop
vagrant box add laptop.box --name laptop


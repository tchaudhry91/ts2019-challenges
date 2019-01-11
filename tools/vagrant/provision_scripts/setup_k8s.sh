#!/bin/bash
set -e

snap install microk8s --classic --channel=1.12/stable
microk8s.status --wait-ready
microk8s.enable dns registry ingress
snap alias microk8s.kubectl kubectl
snap alias microk8s.docker docker
iptables -P FORWARD ACCEPT
microk8s.inspect

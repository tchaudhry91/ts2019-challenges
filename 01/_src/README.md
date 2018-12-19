Source files to build containers for challange
should not be userd by user who solve challange

`build_containers.sh` creates required containers and upload then to the hub.docker.com

New containers should be defined in the `../../tools/vagrant/provision_scripts/create_local_registry.sh` to put them to the local docker registry

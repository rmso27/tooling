###########################################################
#
#   DESCRIPTION: Script to install Docker (latest version)
#
###########################################################

#!/bin/bash

# update the package manager and install some prerequisites (all of these aren't technically required)
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common libssl-dev libffi-dev git wget nano

# create a group named docker and add yourself to it
#   so that we don't have to type sudo docker every time
#   note you will need to logout and login before this takes affect (which we do later)
sudo groupadd docker
sudo usermod -aG docker ${USER}

# add Docker key and repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# update the package manager with the new repos
sudo apt update
sudo apt autoremove -y

# install docker
sudo apt install -y docker-ce containerd.io
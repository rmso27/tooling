###########################################################
#
#   DESCRIPTION: Script to install Kubectl (latest version)
#
###########################################################

#!/bin/bash

# update the package manager and install some prerequisites (all of these aren't technically required)
sudo apt update

# add kubectl key and repo
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update

# install kubectl
sudo apt install -y kubectl
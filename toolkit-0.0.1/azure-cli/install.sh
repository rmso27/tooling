#############################################################
#
#   DESCRIPTION: Script to install Azure Cli (latest version)
#
#############################################################

#!/bin/bash

# update the package manager and install some prerequisites (all of these aren't technically required)
sudo apt update

# install azure cli
sudo apt install azure-cli
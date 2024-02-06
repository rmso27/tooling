###########################################################
#
#   DESCRIPTION: Script to install Helm (v.3.9.3)
#
###########################################################

#!/bin/bash

# Use wget to download the latest version of Helm. The download links for all supported architectures are available on the official website. For example, if your system uses the x64 architecture, type the following in the terminal to download the 3.9.3 version of Helm:
wget https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz

# Next, unpack the Helm file using the Linux tar command:
tar xvf helm-v3.9.3-linux-amd64.tar.gz

# Move the linux-amd64/helm file to the /usr/local/bin directory:
sudo mv linux-amd64/helm /usr/local/bin

# Remove the downloaded file using the following command:
rm helm-v3.9.3-linux-amd64.tar.gz

# Remove the linux-amd64 directory to clean up space by running:
rm -rf linux-amd64
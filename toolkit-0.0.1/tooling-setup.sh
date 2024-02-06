######################################################################
#
#   DESCRIPTION: Script to validate if the basic tooling is installed.
#
######################################################################

#!/bin/bash

################
# MISC
################

# Define colors (just to beautify the output)
green="\e[32m"
yellow="\e[33m"
red="\e[31m"
no_color="\e[0m"

################
# VALIDATIONS
################

# Docker
validate_docker_install() {
    docker_version=$(docker --version)
    if [ $? -eq 0 ]; then
        echo -e "Docker is ${green}installed${no_color} and running on version ${yellow}${docker_version:15:6}${no_color}"
        main
    else
        read -p "Docker is not installed. Do you wish to install it? (y/n)" choice
        if [ ${choice,,} = 'y' ]; then
            echo "Installing Docker"
            docker/install.sh
        else
            echo "Skipping Docker installation"
        fi
        main
    fi
}

# Kubectl
validate_kubectl_install() {
    kubectl_version=$(kubectl version --short | grep "Client Version")
    if [ $? -eq 0 ]; then
        echo -e "Kubectl is ${green}installed${no_color} and running on version ${yellow}${kubectl_version:17:6}${no_color}"
        main
    else
        read -p "Kubectl is not installed. Do you wish to install it? (y/n)" choice
        if [ ${choice,,} = 'y' ]; then
            echo "Installing Kubectl"
            kubectl/install.sh
        else
            echo "Skipping Kubectl installation"
        fi
        main
    fi
}

# Helm
validate_heml_install() {
    helm_version=$(helm version)
    if [ $? -eq 0 ]; then
        echo -e "Helm is ${green}installed${no_color} and running on version ${yellow}${helm_version:28:5}${no_color}"
        main
    else
        read -p "Helm is not installed. Do you wish to install it? (y/n)" choice
        if [ ${choice,,} = 'y' ]; then
            echo "Installing Helm"
            helm/install.sh
        else
            echo "Skipping Helm installation"
        fi
        main
    fi
}

# AZ Cli
validate_az_cli_install() {
    az_cli_version=$(az --version)
    if [ $? -eq 0 ]; then
        echo -e "Azure Cli is ${green}installed${no_color} and running on version ${yellow}${az_cli_version:34:6}${no_color}"
        main
    else
        read -p "Azure Cli is not installed. Do you wish to install it? (y/n)" choice
        if [ ${choice,,} = 'y' ]; then
            echo "Installing Azure Cli"
            azure-cli/install.sh
        else
            echo "Skipping Azure Cli installation"
        fi
        main
    fi
}


################
# MAIN
################

main() {
    echo "-------------------------------------------------"
    echo "Select a tool to install:"
    echo "-------------------------------------------------"
    echo "1 - Docker"
    echo "2 - Kubectl"
    echo "3 - Helm"
    echo "4 - Azure Cli"
    echo "0 - Exit"
    echo "-------------------------------------------------"
    read -p "Which tool do you wish to install? (number) " choice

    if [ ${choice} -eq 1 ]; then
        validate_docker_install
    elif [ ${choice} -eq 2 ]; then
        validate_kubectl_install
    elif [ ${choice} -eq 3 ]; then
        validate_heml_install
    elif [ ${choice} -eq 4 ]; then
        validate_az_cli_install
    elif [ ${choice} -eq 0 ]; then
        exit
    else
        echo "Invalid option!"
        main
    fi
}

# Entrypoint
main




# TODO:
#   - pass application version argument on install;
#   - add pip3;
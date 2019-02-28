#! /bin/bash

. ./vars.sh

echo -e "\nCreating $docker_network_name docker network"
docker network create $docker_network_name

echo -e "\nCreating $master_container_name node for master role"
docker run --name $master_container_name -d --restart=always --security-opt seccomp:unconfined --network $docker_network_name $conjur_appliance_name:$conjur_appliance_version

echo -e "\nCreating $standby1_container_name node for standby role"
docker run --name $standby1_container_name -d --restart=always --security-opt seccomp:unconfined --network $docker_network_name $conjur_appliance_name:$conjur_appliance_version

echo -e "\nCreating $standby2_container_name node for standby role"
docker run --name $standby2_container_name -d --restart=always --security-opt seccomp:unconfined --network $docker_network_name $conjur_appliance_name:$conjur_appliance_version


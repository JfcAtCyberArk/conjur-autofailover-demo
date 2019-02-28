#! /bin/bash

. ./vars.sh

docker stop $master_container_name && docker rm $master_container_name
docker stop $standby1_container_name && docker rm $standby1_container_name
docker stop $standby2_container_name && docker rm $standby2_container_name
docker stop $conjur_cli_container_name && docker rm $conjur_cli_container_name
docker network rm $docker_network_name
rm cluster-policy.yml

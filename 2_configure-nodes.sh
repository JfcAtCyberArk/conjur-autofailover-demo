#! /bin/bash

. ./vars.sh

echo -e "\nConfiguring $master_container_name to be the master"
docker exec -it $master_container_name bash -c "evoke configure master -h $master_container_name --master-altnames \"$docker_network_name,$standby1_container_name,$standby2_container_name\" -p $admin_password $org_account"

echo -e "\nSending a seed to $standby1_container_name"
docker exec $master_container_name evoke seed standby $standby1_container_name | docker exec -i $standby1_container_name evoke unpack seed -

echo -e "\nSending a seed to $standby2_container_name"
docker exec $master_container_name evoke seed standby $standby2_container_name | docker exec -i $standby2_container_name evoke unpack seed -


echo -e "\nConfiguring $standby1_container_name to be a standby"
docker exec $standby1_container_name evoke configure standby --master-address $master_container_name

echo -e "\nConfiguring $standby2_container_name to be a standby"
docker exec $standby2_container_name evoke configure standby --master-address $master_container_name

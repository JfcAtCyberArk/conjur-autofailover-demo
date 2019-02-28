#! /bin/bash

. ./vars.sh

echo -e "\nEnrolling $master_container_name to the cluster :"
docker exec $master_container_name evoke cluster enroll -n $master_container_name cluster-policy

echo -e "\nEnrolling $standby1_container_name to the cluster :"
docker exec $standby1_container_name evoke cluster enroll -n $standby1_container_name -m $master_container_name cluster-policy

echo -e "\nEnrolling $standby2_container_name to the cluster :"
docker exec $standby2_container_name evoke cluster enroll -n $standby2_container_name -m $master_container_name cluster-policy



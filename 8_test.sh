#! /bin/bash

. ./vars.sh

echo -e "\n Killing the master !"
docker stop $master_container_name

echo -e "\n Waiting 30sec to reach TTL"
sleep 30

echo -e "\n Checking that a standby became master"

echo -e "\n $standby1_container_name :"
docker exec $standby1_container_name curl -s localhost/health | jq ."ok"

echo -e "\n $standby2_container_name :"
docker exec $standby2_container_name curl -s localhost/health | jq ."ok"

standby1_container_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $standby1_container_name)
standby2_container_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $standby2_container_name)

echo -e "\n You can also check through the UI"
echo -e "\n $standby1_container_name : https://$standby1_container_ip"
echo -e "\n $standby2_container_name : https://$standby2_container_ip"
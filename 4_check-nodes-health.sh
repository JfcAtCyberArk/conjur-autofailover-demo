#! /bin/bash

. ./vars.sh

echo -e "\nChecking $master_container_name health (expected: true):"
docker exec $master_container_name curl -s localhost/health | jq ."ok"

echo -e "\nChecking $standby1_container_name health (expected: false,true,false):"
docker exec $standby1_container_name curl -s localhost/health | jq ."services"."ok"
docker exec $standby1_container_name curl -s localhost/health | jq ."database"."ok"
docker exec $standby1_container_name curl -s localhost/health | jq ."ok"

echo -e "\nChecking $standby2_container_name health (expected: false,true,false):"
docker exec $standby2_container_name curl -s localhost/health | jq ."services"."ok"
docker exec $standby2_container_name curl -s localhost/health | jq ."database"."ok"
docker exec $standby2_container_name curl -s localhost/health | jq ."ok"

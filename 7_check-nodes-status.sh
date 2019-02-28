#! /bin/bash

. ./vars.sh

echo -e "\nChecking $master_container_name node status (expected: true):"
docker exec $master_container_name curl -s localhost/health | jq ."cluster"."ok"

echo -e "\nChecking $standby1_container_name node status (expected: true):"
docker exec $standby1_container_name curl -s localhost/health | jq ."cluster"."ok"

echo -e "\nChecking $standby2_container_name node status (expected: true):"
docker exec $standby2_container_name curl -s localhost/health | jq ."cluster"."ok"
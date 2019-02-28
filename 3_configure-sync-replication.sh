#! /bin/bash

. ./vars.sh

echo -e "\nConfiguring synchronous replication"
docker exec $master_container_name evoke replication sync
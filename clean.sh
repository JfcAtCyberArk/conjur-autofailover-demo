#! /bin/bash

docker stop conjur-autofailover-master && docker rm conjur-autofailover-master
docker stop conjur-autofailover-standby1 && docker rm conjur-autofailover-standby1
docker stop conjur-autofailover-standby2 && docker rm conjur-autofailover-standby2
docker stop conjur-autofailover-cli && docker rm conjur-autofailover-cli
docker network rm conjur-autofailover-cluster
rm cluster-policy.yml
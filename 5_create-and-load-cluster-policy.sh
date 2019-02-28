#! /bin/bash

. ./vars.sh

docker run -d -it --network $docker_network_name --name $conjur_cli_container_name $conjur_cli_image:$conjur_cli_version
cat cluster-policy-template.yml | sed -e "s/{{ CONJUR_AUTOFAILOVER_MASTER }}/$master_container_name/g" \
    -e "s/{{ CONJUR_AUTOFAILOVER_STANDBY1 }}/$standby1_container_name/g" \
    -e "s/{{ CONJUR_AUTOFAILOVER_STANDBY2 }}/$standby2_container_name/g" \
    > cluster-policy.yml

docker cp cluster-policy.yml $conjur_cli_container_name:/cluster-policy.yml
docker exec -it $conjur_cli_container_name bash -c "yes yes | conjur init -u https://$master_container_name -a $org_account"
docker exec $conjur_cli_container_name conjur authn login -u admin -p $admin_password
docker exec $conjur_cli_container_name conjur policy load root cluster-policy.yml

#! /bin/bash

# Variables
conjur_appliance_name=conjur-appliance
conjur_appliance_version=5.2.4
docker_network_name=conjur-autofailover-cluster
master_container_name=conjur-autofailover-master
standby1_container_name=conjur-autofailover-standby1
standby2_container_name=conjur-autofailover-standby2
admin_password=Cyberark1
org_account=conjur-poc
conjur_cli_image=conjur-cli
conjur_cli_version=5
conjur_cli_container_name=conjur-autofailover-cli

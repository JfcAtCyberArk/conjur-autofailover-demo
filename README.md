# conjur-autofailover-demo

Automated steps to deploy and test a Conjur autofailover cluster (demo purposes).
https://docs.conjur.org/Latest/en/Content/Deployment/HighAvailability/ha-config-intro.htm 

## How it works 
1 - Deploy 3 conjur containers. 

2 - Configure nodes to give them specific roles: 1 master and 2 standbys.

3 - Configure the sync replication.

4 - Check nodes health.

5 - Create and load the cluster policy that specifies nodes in the cluster.

6 - Enroll nodes to the cluster.

7 - Check nodes cluster status. 

8 - Kill the master and observe automatic election of a new master.

Clean environment demo environment.

## Software Prerequisites
Docker should be installed

jq should be installed (for script 4)

## Variables to set
Variables should be set in the file vars.sh

CyberArk opensource binary summon can be used to inject variables. 
https://github.com/cyberark/summon

## Versions
conjur-appliance v5.2.4 (requires >= 5.2.3)

conjur-cli cyberark/conju-cli v5 (publicly available on dockerhub)


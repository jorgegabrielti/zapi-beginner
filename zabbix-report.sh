#!/bin/bash

set -e

### Alias eXpands
shopt -s expand_aliases

### Import configs
WORK_DIR="${PWD}"
sed -i 's/\r$//' ${WORK_DIR}/conf/zabbix-api.conf
source ${WORK_DIR}/conf/zabbix-api.conf

### Import functions
for FUNCTION in $(grep -F 'Test: [OK]' -l -r ${WORK_DIR}/function/); do
    sed -i 's/\r$//' ${FUNCTION}
    source ${FUNCTION}
done

# Zabbix API Availiability Check
availability_check  

# Zabbix API Authentication
authentication_token


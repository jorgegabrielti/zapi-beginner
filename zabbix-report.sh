#!/bin/bash

set -e

### Alias eXpands
shopt -s expand_aliases

case $1 in 
    "--hosts-list")
        source function/import_function.sh && \
        import_function
        
        # Zabbix API Availiability Check
        api_availability_check 
        
        # Zabbix API Authentication
        authentication_token
        hosts_get
    ;;
esac
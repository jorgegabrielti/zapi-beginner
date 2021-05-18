#!/bin/bash
# Test: [OK]

# Check availability of Zabbix API

### HTTP Responde Codes
# 200 => OK
# 301 => Moved Permanently
# 500 => Internal Server Error
# 503 => Service Unavailable
# 504 => Gateway Timeout

api_availability_check ()
{
    curl -Is ${ZABBIX_URL} > .header.tmp 
    HTTP_STATUS_CODE=$(grep HTTP .header.tmp | cut -d' ' -f2)
    
    case ${HTTP_STATUS_CODE} in
        "200")
            echo $(grep HTTP .header.tmp)
        ;;
        "301")
            sed -i 's/\r$//' .header.tmp
            ZABBIX_URL="$(grep -E 'Location' .header.tmp | awk '{print $2}')"
        ;;
        *)
            exit 0
        ;;
    esac
    rm -f .header
}

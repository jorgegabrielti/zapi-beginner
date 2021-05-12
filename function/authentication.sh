# Test: [OK]
# Function to obtain authentication token
authentication_token () 
{
    JSON='
    {
        "jsonrpc":"2.0",
        "method":"user.login",
        "params":{
            "user":"'${API_USER}'",
            "password":"'${API_PASS}'"
        },
        "id":0
    }
    '
    TOKEN=$(curl -s -X POST -H "${HEADER}" -d "${JSON}" ${ZABBIX_URL} | cut -d'"' -f8)

    echo "Obtained token [ ${TOKEN} ]"
}



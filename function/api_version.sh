# Test: [OK]
api_version ()
{
 JSON='
    {
	    "jsonrpc": "2.0",
	    "method": "apiinfo.version",
	    "id": 1,
	    "auth": null,
	    "params": {}
    }
    '
    
 API_VERSION=$(curl -s -X POST -H "$HEADER" -d "$JSON" "$ZABBIX_URL"/api_jsonrpc.php | cut -d '"' -f8)
 echo "Zabbix API Version: [ ${API_VERSION} ]"
}   
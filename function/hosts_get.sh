# Test: [OK]
hosts_get ()
{
 JSON='
    {
    	"jsonrpc": "2.0",
    	"method": "host.get",
    	"params": {
    		"output": [
    			"hostid ",
    			"host"
    		],
            "sortfield":"name",
            "sortordes":"DESC"
    	},
    	"auth": "'$TOKEN'",
    	"id": 1
    }
    '
 awk 'BEGIN { print "ID - Host" }'
 curl -s -X POST -H "$HEADER" -d "$JSON" "$ZABBIX_URL"/api_jsonrpc.php | awk -v RS='{"' -F\" '/^hostid/ {printf $3 " - " $7 "\n"}'
}
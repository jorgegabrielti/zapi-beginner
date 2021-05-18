import_function () 
{
    ### Import configs
    WORK_DIR="${PWD}"
    sed -i 's/\r$//' ${WORK_DIR}/conf/zabbix-api.conf
    source ${WORK_DIR}/conf/zabbix-api.conf

    ### Import functions
    for FUNCTION in $(grep -F 'Test: [OK]' -l -r ${WORK_DIR}/function/ | grep -v import_function.sh); do
        sed -i 's/\r$//' ${FUNCTION}
        source ${FUNCTION}
    done
}
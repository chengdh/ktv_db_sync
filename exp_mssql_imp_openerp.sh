#!/bin/bash
work_dir=$(dirname $0)
mssql_db=eVideoBill_SH
mssql_user=sa
mssql_pw=vonger
mssql_host=192.168.8.252

#判断是否需要执行导入操作
./get_mssql_state.sh
mssql_state=`cat export/mssql_state.csv`
#先执行从mssql中导出数据,然后再导入到openerp
if [ $mssql_state = 0.00 ]
  then
    echo "开始同步..."
    ./mssql_export_from_mssql.sh
    ./imp2openerp
    ./reset_mssql_sync_flag.sh
    echo "同步结束"
fi

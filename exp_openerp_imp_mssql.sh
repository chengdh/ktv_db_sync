#!/bin/bash
#判断是否需要执行导入操作
./get_openerp_state.sh
openerp_state=`cat export/openerp_state.csv`
#先执行从mssql中导出数据,然后再导入到openerp
if [ $openerp_state = 1 ]
  then
    echo "开始同步..."
    ./exec_export.sh
    ./imp2mssql.sh
    echo "同步结束"
fi

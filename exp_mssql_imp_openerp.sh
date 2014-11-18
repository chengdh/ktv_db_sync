#!/bin/bash

#判断是否需要执行导入操作
./get_mssql_state.sh
mssql_state=`cat export/mssql_state.csv`
#先执行从mssql中导出数据,然后再导入到openerp
if [$mssql_state == 0.00]
  then
    ./mssql_export_from_mssql.sh
    ./imp2openerp
fi

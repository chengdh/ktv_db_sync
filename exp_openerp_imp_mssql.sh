#!/bin/bash
#先执行从openerp中导出数据,然后再导入到mssql
./exec_export.sh
./imp2mssql.sh

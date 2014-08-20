#!/bin/bash
#先执行从mssql中导出数据,然后再导入到openerp
./mssql_export_from_mssql.sh
./imp2openerp

#!/bin/sh
echo "导出stock_inventory.csv"
echo ""
aaj=`date +%F`
out_fl=export/stock_inventory_$aaj.csv
rm -f $out_fl
sqsh=/usr/bin/sqsh
$sqsh -D$mssql_db -S$mssql_host -U$mssql_user -P$mssql_pw -mbcp -o$out_fl <<QRY
use eVideoBill_SH
\set bcp_colsep=","
\set bcp_rowsep=""
\echo id,name
SELECT 
  'ktv_stock_inventory_' + CONVERT(VARCHAR(30),GETDATE(),12) AS id,
  'ktv_stock_inventory_' + CONVERT(VARCHAR(30),GETDATE(),12) AS name;
\go -f
quit
QRY

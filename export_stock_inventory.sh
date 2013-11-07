#!/bin/sh
echo "导出stock_inventory.csv"
echo ""
aaj=`date +%F`
out_fl=export/stock_inventory_$aaj.csv
sqsh=/usr/bin/sqsh
$sqsh -DeVideoBill_SH -S192.168.8.252 -Usa -Pvonger -mbcp -o$out_fl <<QRY
use eVideoBill_SH
\set bcp_colsep=","
\set bcp_rowsep=""

SELECT 
  'stock_invontory_' + CONVERT(VARCHAR(30),GETDATE(),12) AS id,
  'stock_invontory_' + CONVERT(VARCHAR(30),GETDATE(),12) AS name;
\go -f
quit
QRY

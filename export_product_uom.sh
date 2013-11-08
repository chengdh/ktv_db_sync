#!/bin/sh
echo "导出product_uom.csv"
echo ""
aaj=`date +%F`
out_fl=export/product_uom_$aaj.csv
rm -f $out_fl
sqsh=/usr/bin/sqsh
$sqsh -D$mssql_db -S$mssql_host -U$mssql_user -P$mssql_pw -mbcp -o$out_fl <<QRY
use eVideoBill_SH
\set bcp_colsep=","
\set bcp_rowsep=""
\echo id,name,category_id:id,factor
SELECT DISTINCT 
     a.MaterialUnitCode AS id,
     a.MaterialUnit AS name,
     'product.product_uom_categ_unit' AS 'category_id:id',
     '1' AS factor
FROM BL_TBL_MaterialCode a;
\go -f
quit
QRY

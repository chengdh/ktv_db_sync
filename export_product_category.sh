#!/bin/sh
echo "导出product_category.csv"
echo ""
aaj=`date +%F`
out_fl=export/product_category_$aaj.csv
rm -f out_fl
sqsh=/usr/bin/sqsh
$sqsh -D$mssql_db -S$mssql_host -U$mssql_user -P$mssql_pw -mbcp -o$out_fl <<QRY
use eVideoBill_SH
\set bcp_colsep=","
\set bcp_rowsep=""
\echo id,name,parent_id:id
SELECT  
     MaterialSortID AS id,
     MaterialSortName as name ,
     'product.product_category_1' AS 'parent_id:id'
FROM BL_TBL_Material_Sort;
\go
quit
QRY

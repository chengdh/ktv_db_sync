#!/bin/sh
echo "导出product_uom.csv"
echo ""
aaj=`date +%F`
out_fl=export/product_uom_$aaj.csv
sqsh=/usr/bin/sqsh
$sqsh -DeVideoBill_SH -S192.168.8.252 -Usa -Pvonger -mbcp -o$out_fl <<QRY
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

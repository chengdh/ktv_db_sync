#!/bin/sh
echo "导出product_category.csv"
echo ""
aaj=`date +%F`
out_fl=export/product_category_$aaj.csv
sqsh=/usr/bin/sqsh
$sqsh -DeVideoBill_SH -S192.168.8.252 -Usa -Pvonger -mbcp -o$out_fl <<QRY
use eVideoBill_SH
\set bcp_colsep=","
\set bcp_rowsep=""
SELECT  
     MaterialSortID AS id,
     MaterialSortName as name ,
     'product.product_category_1' AS 'parent_id:id'
FROM BL_TBL_Material_Sort;
\go -f
quit
QRY

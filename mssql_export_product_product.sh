#!/bin/sh
echo "导出product_product.csv"
echo ""
aaj=`date +%F`
out_fl=export/product_product_$aaj.csv
rm -f $out_fl
sqsh=/usr/bin/sqsh
$sqsh -D$mssql_db -S$mssql_host -U$mssql_user -P$mssql_pw -mbcp -o$out_fl <<QRY
use eVideoBill_SH
\set bcp_colsep=","
\set bcp_rowsep=""
\echo id,name,code,uom_id:id,uom_po_id:id,type,categ_id:id,standard_price,list_price,description,external_id
SELECT 
'ktv_product_product_' + CAST(b.WineMaterialID AS VARCHAR(20))  AS id,
b.MaterName AS name,
b.MaterialBarcode AS code,
'ktv_product_uom_' + b.MaterialUnitCode AS 'uom_id:id',
'ktv_product_uom_' + b.MaterialUnitCode AS 'uom_po_id:id',
'product' AS type,
'ktv_product_category_' + CAST(b.MaterialSortID AS VARCHAR(20)) AS  'categ_id:id',
b.PriceA AS standard_price,
b.PriceB AS list_price,
b.MaterialCode AS description,
b.WineMaterialID
FROM BL_TBL_MaterialCode b
-- WHERE SellSign = 1 AND IsVisible = 1;
\go -f
quit
QRY

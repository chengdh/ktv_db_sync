#!/bin/sh
echo "导出product_product.csv"
echo ""
aaj=`date +%F`
out_fl=export/product_product_$aaj.csv
sqsh=/usr/bin/sqsh
$sqsh -DeVideoBill_SH -S192.168.8.252 -Usa -Pvonger -mbcp -o$out_fl <<QRY
use eVideoBill_SH
\set bcp_colsep=","
\set bcp_rowsep=""

SELECT 
b.WineMaterialID  AS id,
b.MaterName AS name,
b.MaterialBarcode AS ean13,
b.MaterialCode AS code,
b.MaterialUnitCode AS 'uom_id:id',
b.MaterialUnitCode AS 'uom_po_id:id',
'product' AS type,
b.MaterialSortID AS  'categ_id:id',
b.PriceA AS standard_price,
b.PriceB AS list_price,
b.MaterialBarcode AS description
FROM BL_TBL_MaterialCode b
-- WHERE SellSign = 1 AND IsVisible = 1;
\go -f
quit
QRY

#!/bin/sh
echo "导出stock_inventory_line.csv"
echo ""
aaj=`date +%F`
out_fl=export/stock_inventory_line_$aaj.csv
sqsh=/usr/bin/sqsh
$sqsh -DeVideoBill_SH -S192.168.8.252 -Usa -Pvonger -mbcp -o$out_fl <<QRY
use eVideoBill_SH
\set bcp_colsep=","
\set bcp_rowsep=""

SELECT 
     b.WineMaterialID  AS 'product_id:id',
     b.MaterialUnitCode AS 'product_uom:id',
     'stock_invontory_' + CONVERT(VARCHAR(30),GETDATE(),12) AS 'inventory:id',
     a.StorageNumber AS product_qty,
     'stock.stock_location_stock' AS 'location_id:id'
FROM BL_TBL_Material_Storage a,BL_TBL_MaterialCode b
WHERE a.WineMaterialID = b.WineMaterialID
\go -f
quit
QRY

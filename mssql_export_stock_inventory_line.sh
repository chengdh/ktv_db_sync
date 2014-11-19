#!/bin/sh

echo "导出stock_inventory_line.csv"
echo ""
aaj=`date +%F`
out_fl=export/stock_inventory_line_$aaj.csv
rm -f $out_fl
sqsh=/usr/bin/sqsh
rm -f $out_fl
$sqsh -D$mssql_db -S$mssql_host -U$mssql_user -P$mssql_pw -mbcp -o$out_fl <<QRY
use eVideoBill_SH
\set bcp_colsep=","
\set bcp_rowsep=""
\echo product_id:id,product_uom:id,inventory_id:id,product_qty,location_id:id

SELECT 
  'ktv_product_product_'+ CAST(b.WineMaterialID AS VARCHAR(20))  AS 'product_id:id',
  'ktv_product_uom_'+b.MaterialUnitCode AS 'product_uom:id',
  '$inventory_external_id' AS 'inventory_id:id';
  a.StorageNumber AS product_qty,
  'stock.stock_location_for_252' AS 'location_id:id'
FROM BL_TBL_Material_Storage a,BL_TBL_MaterialCode b
WHERE a.WineMaterialID = b.WineMaterialID
AND a.StorageUnitID = 1
\go -f
quit
QRY
#FIXME 从总仓库同步数据到erp,总仓库id = 1

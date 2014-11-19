#!/bin/sh

echo "同步完毕后,重设mssql的状态,将erp商品的库存重新设置为1"
echo "StorageUnitID : 1"
echo "WineMaterialID: 695"
sqsh=/usr/bin/sqsh
$sqsh -D$mssql_db -S$mssql_host -U$mssql_user -P$mssql_pw -mbcp  <<QRY
use eVideoBill_SH
\set bcp_colsep=","
\set bcp_rowsep=""
UPDATE BL_TBL_Material_Storage
  SET StorageNumber=1
WHERE BL_TBL_Material_Storage.StorageUnitID = 1
AND BL_TBL_Material_Storage.WineMaterialID=695
\go
quit
QRY

#!/bin/sh

echo "判断mssql的状态,是否需要同步"
out_fl=export/mssql_state.csv
rm -f $out_fl
sqsh=/usr/bin/sqsh
$sqsh -D$mssql_db -S$mssql_host -U$mssql_user -P$mssql_pw -mbcp -o$out_fl <<QRY
use eVideoBill_SH
\set bcp_colsep=","
\set bcp_rowsep=""

SELECT ISNULL(sum(b.StorageNumber),1)   FROM BL_TBL_MaterialCode a,BL_TBL_Material_Storage b
WHERE a.WineMaterialID  = b.WineMaterialID
AND a.MaterName='ERP'
AND b.StorageUnitID = 1
\go -f
quit
QRY

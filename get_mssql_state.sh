#!/bin/sh
work_dir=$(dirname $0)
mssql_db=eVideoBill_SH
mssql_user=sa
mssql_pw=vonger
mssql_host=192.168.8.252


echo "判断mssql的状态,是否需要同步"
out_fl=export/mssql_state.csv
rm -f $out_fl
sqsh=/usr/bin/sqsh
rm -f $out_fl
$sqsh -D$mssql_db -S$mssql_host -U$mssql_user -P$mssql_pw -mbcp -o$out_fl <<QRY
use eVideoBill_SH
\set bcp_colsep=","
\set bcp_rowsep=""

SELECT sum(b.StorageNumber)   FROM BL_TBL_MaterialCode a,BL_TBL_Material_Storage b
WHERE a.WineMaterialID  = b.WineMaterialID  
AND a.MaterName='ERP'
AND b.StorageUnitID = 1
\go -f
quit
QRY

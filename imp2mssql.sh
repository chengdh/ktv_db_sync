#!/bin/bash
#批量执行从mssal导出命令
work_dir=$(dirname $0)
mssql_db=eVideoBill_SH
mssql_user=sa
mssql_pw=vonger
mssql_host=192.168.8.252

sqsh=/usr/bin/sqsh

$sqsh -D $mssql_db -S $mssql_host -U $mssql_user -P $mssql_pw -mbcp <<SQL
use eVideoBill_SH
\go
DROP TABLE TMP_BL_TBL_Material_Storage
\go
CREATE TABLE TMP_BL_TBL_Material_Storage
(
	WineMaterialID INT,
	StorageNumber INT,
	AdvanceNumber INT,
	StorageUnitID INT
)
\go
BULK
INSERT TMP_BL_TBL_Material_Storage
FROM '//192.168.8.44/export_file/BL_TBL_Material_Storage.csv'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '0x0A'
)
\go
SELECT * FROM TMP_BL_TBL_Material_Storage
\go
quit
SQL

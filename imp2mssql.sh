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
  product_id INT,
  categ_id INT,
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
UPDATE BL_TBL_Material_Storage
  SET StorageNumber=TMP_BL_TBL_Material_Storage.StorageNumber
FROM TMP_BL_TBL_Material_Storage
WHERE BL_TBL_Material_Storage.WineMaterialID = TMP_BL_TBL_Material_Storage.WineMaterialID 
AND BL_TBL_Material_Storage.StorageUnitID = 1
AND BL_TBL_Material_Storage.categ_id in (20,8,7) 
\go
quit
SQL
#categ_id:20 扣除类 
#categ_id:7  小吃类 
#categ_id:8  果盘类 
#id:695 ERP

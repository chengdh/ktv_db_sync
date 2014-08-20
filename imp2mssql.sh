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
\GO
-- BL_TBL_Material_Sort
DROP TABLE TMP_BL_TBL_Material_Sort
\GO
CREATE TABLE TMP_BL_TBL_Material_Sort
(
  MaterialSortID INT,
  MaterialSortName VARCHAR(100),
  HeadMaterialSortID INT
)
\GO
BULK
INSERT TMP_BL_TBL_Material_Sort
FROM '.\export\BL_TBL_Material_Sort.csv'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n'
)
\GO -f
quit
SQL

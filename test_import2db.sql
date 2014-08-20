-- 创建要导入sql server的临时表
@db_name = 'eVideoBill_SH'
USE @db_name
GO
-- BL_TBL_Material_Sort
DROP TABLE TMP_BL_TBL_Material_Sort
GO
CREATE TABLE TMP_BL_TBL_Material_Sort
(
  MaterialSortID INT,
  MaterialSortName VARCHAR(100),
  HeadMaterialSortID INT
)
GO
-- import
BULK
INSERT TMP_BL_TBL_Material_Sort
FROM '.\export\BL_TBL_Material_Sort.csv'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n'
)
GO

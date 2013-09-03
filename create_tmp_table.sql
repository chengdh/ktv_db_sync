-- 创建要导入sql server的临时表
USE test_db
GO
-- BL_TBL_Material_Sort
DROP TABLE TMP_BL_TBL_Material_Sort
GO
CREATE TABLE TMP_BL_TBL_Material_Sort
(
  MaterialSortID INT,
  MaterialSortName	VARCHAR(100),
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
--Check the content of the table.
SELECT * FROM TMP_BL_TBL_Material_Sort
GO

-- BL_TBL_StorageUnit
DROP TABLE TMP_BL_TBL_StorageUnit
GO
CREATE TABLE TMP_BL_TBL_StorageUnit
(
  MStorageUnitId	INT,
  StorageName VARCHAR(100) 
)
GO
-- import
BULK
INSERT TMP_BL_TBL_StorageUnit
FROM '.\export\BL_TBL_StorageUnit.csv'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n'
)
GO
--Check the content of the table.
SELECT * FROM TMP_BL_TBL_StorageUnit
GO

-- BL_TBL_MaterialCode
DROP TABLE TMP_BL_TBL_MaterialCode
GO
CREATE TABLE TMP_BL_TBL_MaterialCode
(
  WineMaterialID INT,
	MaterialCode VARCHAR(100),
	MaterialBarcode VARCHAR(100),
	MaterName VARCHAR(100),
	MaterialUnitCode VARCHAR(100),
	MaterialUnit VARCHAR(100),			              
	PurchasePrice MONEY,			          
	HallPrice MONEY,			          
	RoomPrice MONEY,			          
	MemberPrice MONEY,			        
	PriceA MONEY,			            
  PriceB MONEY,			            
	VIPPrice MONEY,			          
	PromotionPrice MONEY,			    
	PromotionSign INT,			      
	MaterialSortID INT,			  
	PickUpGainSign INT,			    
	PickUpMoney MONEY,			        
	MateSign TINYINT,			          
	EditPrice TINYINT,			          
	IsVisible TINYINT,			          
	IsCombineMaterial TINYINT,			  --是否套餐
	IsParticipateStorage TINYINT,	  
	IsControlStorage TINYINT,			  
	SellSign TINYINT,			          
	DiscountSign TINYINT,			      
	CustomDamage TINYINT,			      
	HeadWineMaterialID INT		  
)
GO
-- import
BULK
INSERT TMP_BL_TBL_MaterialCode
FROM '.\export\BL_TBL_MaterialCode.csv'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n'
)
GO
--Check the content of the table.
SELECT * FROM TMP_BL_TBL_MaterialCode
GO

-- BL_TBL_Material_Storage
DROP TABLE TMP_BL_TBL_Material_Storage
GO
CREATE TABLE TMP_BL_TBL_Material_Storage
(
	WineMaterialID INT,
	StorageNumber INT,
	AdvanceNumber INT,
	StorageUnitID INT

)
GO
-- import
BULK
INSERT TMP_BL_TBL_Material_Storage
FROM '.\export\BL_TBL_Material_Storage.csv'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n'
)
GO
--Check the content of the table.
SELECT * FROM TMP_BL_TBL_Material_Storage
GO


-- KTV_TBL_Customer
DROP TABLE TMP_KTV_TBL_Customer
GO
CREATE TABLE TMP_KTV_TBL_Customer
(
  MemberID INT,	
	CustomerName VARCHAR(100),
	Sex VARCHAR(100),
	Address VARCHAR(100),
	CardTypeID INT,
	CardNum VARCHAR(100),
	Balance MONEY,			            -- 余额
	BirthDate DATETIME,
	RelationPhone VARCHAR(100),
	GradeID INT,
	MemberPsw VARCHAR(100),
	CardIntegral INT,			      -- 卡积分
	MemberAccountBalance MONEY,    -- 卡积分
	MemberAccountOverdraft MONEY,	              -- 透支额
	CardToolType TINYINT,			      
	TotalIntegral INT,	          -- 全部积分
	CarNum VARCHAR(100),			            -- 车牌号码
	CompanyName VARCHAR(100),			        -- 公司名称
	Email VARCHAR(100),
	QQ VARCHAR(100)	
)
GO
-- import
BULK
INSERT TMP_KTV_TBL_Customer
FROM '.\export\KTV_TBL_Customer.csv'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n'
)
GO
--Check the content of the table.
SELECT * FROM TMP_KTV_TBL_Customer
GO

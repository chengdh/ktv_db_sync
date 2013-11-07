-- 创建要导入sql server的临时表
@db_name = 'test_db'
USE @db_name
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
UPDATE BL_TBL_Material_Sort a
FROM BL_TBL_Material_Sort a
  SET MaterialSortName = b.MaterialSortName,
WHERE  a.id = b.id
GO
INSERT INTO BL_TBL_Material_Sort (MaterialSortID,MaterialSortName) 
  SELECT MaterialSortID,MaterialSortName FROM TMP_BL_TBL_Material_Sort
  WHERE MaterialSortID NOT IN (SELECT MaterialSortID FROM BL_TBL_Material_Sort)
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
UPDATE BL_TBL_StorageUnit a
FROM TMP_BL_TBL_StorageUnit b
  SET StorageName = b.StorageName,
WHERE  a.id = b.id
GO
INSERT INTO BL_TBL_StorageUnit (MStorageUnitID,StorageName) 
  SELECT MStorageUnitID,StorageName FROM TMP_BL_TBL_StorageUnit
  WHERE MStorageUnitID NOT IN (SELECT MStorageUnitID FROM BL_TBL_StorageUnit)
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
UPDATE BL_TBL_MaterialCode a
FROM TMP_BL_TBL_MaterialCode b
  SET 
  MaterialCode     =    b.MaterialCode             ,
  MaterialBarcode  =     b.MaterialBarcode          ,
  MaterName        =     b.MaterName                ,
  MaterialUnitCode =     b.MaterialUnitCode         , 
  MaterialUnit     =     b.MaterialUnit             ,
  PurchasePrice    =     b.PurchasePrice            ,
  HallPrice        =     b.HallPrice                ,
  RoomPrice        =     b.RoomPrice                ,
  MemberPrice      =     b.MemberPrice              ,
  PriceA           =     b.PriceA                   ,
  PriceB           =     b.PriceB                   ,
  VIPPrice         =     b.VIPPrice                 ,
  PromotionPrice   =     b.PromotionPrice           ,
  PromotionSign    =     b.PromotionSign            ,
  MaterialSortID   =     b.MaterialSortID           ,
  PickUpGainSign   =     b.PickUpGainSign           ,
  PickUpMoney      =     b.PickUpMoney              ,
  MateSign         =     b.MateSign                 ,
  EditPrice        =     b.EditPrice                ,
  IsVisible        =     b.IsVisible                ,
  IsCombineMaterial=     b.IsCombineMaterial        ,--是否套餐
  IsParticipateStorage =  b.IsParticipateStorage     ,
  IsControlStorage =      b.IsControlStorage         ,
  SellSign         =     b.SellSign                 ,
  DiscountSign     =     b.DiscountSign             ,
  CustomDamage     =     b.CustomDamage             ,
	HeadWineMaterialID=    b.HeadWineMaterialID 
WHERE  a.id = b.id
GO
INSERT INTO BL_TBL_MaterialCode 
  (MStorageUnitID,StorageName) 
  SELECT MStorageUnitID,StorageName FROM TMP_BL_TBL_MaterialCode
  WHERE WineMaterialID NOT IN (SELECT WineMaterialID FROM BL_TBL_MaterialCode)
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
UPDATE BL_TBL_Material_Storage a
FROM TMP_BL_TBL_Material_Storage b
  SET 
	  StorageNumber = b.StorageNumber,
	  AdvanceNumber = b.AdvanceNumber,
	  StorageUnitID = b.StorageUnitID
WHERE  a.id = b.id
GO
INSERT INTO BL_TBL_Material_Storage 
(	WineMaterialID ,
	StorageNumber ,
	AdvanceNumber ,
	StorageUnitID 
) 
  SELECT 
  WineMaterialID ,
	StorageNumber ,
	AdvanceNumber ,
	StorageUnitID 
  FROM TMP_BL_TBL_Material_Storage
  WHERE WineMaterialID NOT IN (SELECT WineMaterialID FROM BL_TBL_Material_Storage)
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
UPDATE KTV_TBL_Customer a
FROM TMP_KTV_TBL_Customer b
  SET 
	CustomerName              =	  b.CustomerName             ,
	Sex                       =		b.Sex                      ,
	Address                   =		b.Address                  ,
	CardTypeID                =		b.CardTypeID               ,
	CardNum                   =		b.CardNum                  ,
	Balance                   =		b.Balance                  ,-- 余额
	BirthDate                 =		b.BirthDate                ,
	RelationPhone             =		b.RelationPhone            ,
	GradeID                   =		b.GradeID                  ,
	MemberPsw                 =		b.MemberPsw                ,
	CardIntegral              =		b.CardIntegral             ,			      -- 卡积分
	MemberAccountBalance      =		b.MemberAccountBalance     ,    -- 卡积分
	MemberAccountOverdraft    =		b.MemberAccountOverdraft   ,	              -- 透支额
	CardToolType              =		b.CardToolType             ,
	TotalIntegral             =		b.TotalIntegral            ,	          -- 全部积分
	CarNum                    =		b.CarNum                   ,			            -- 车牌号码
	CompanyName               =		b.CompanyName              ,			        -- 公司名称
	Email                     =		b.Email                    ,
	QQ                        =		b.QQ                       
WHERE  a.MemberID = b.MemberID
GO
INSERT INTO KTV_TBL_Customer 
(	
  MemberID,
	CustomerName,          
	Sex,                   
	Address,               
	CardTypeID,            
	CardNum,               
	Balance,               
	BirthDate,             
	RelationPhone,         
	GradeID,               
	MemberPsw,             
	CardIntegral,          
	MemberAccountBalance,  
	MemberAccountOverdraft,
	CardToolType,          
	TotalIntegral,         
	CarNum ,               
	CompanyName,           
	Email,                 
	QQ                    
) 
SELECT 
  MemberID,
	CustomerName,          
	Sex,                   
	Address,               
	CardTypeID,            
	CardNum,               
	Balance,               
	BirthDate,             
	RelationPhone,         
	GradeID,               
	MemberPsw,             
	CardIntegral,          
	MemberAccountBalance,  
	MemberAccountOverdraft,
	CardToolType,          
	TotalIntegral,         
	CarNum,                
	CompanyName,           
	Email,                 
	QQ                    
  FROM TMP_KTV_TBL_Customer
  WHERE MemberID NOT IN (SELECT MemberID FROM TMP_KTV_TBL_Customer)
GO

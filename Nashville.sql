SELECT TOP (1000) [UniqueID ]
      ,[ParcelID]
      ,[LandUse]
      ,[PropertyAddress]
      ,[SaleDate]
      ,[SalePrice]
      ,[LegalReference]
      ,[SoldAsVacant]
      ,[OwnerName]
      ,[OwnerAddress]
      ,[Acreage]
      ,[TaxDistrict]
      ,[LandValue]
      ,[BuildingValue]
      ,[TotalValue]
      ,[YearBuilt]
      ,[Bedrooms]
      ,[FullBath]
      ,[HalfBath]
  FROM [sales].[dbo].[Nashville]

ALTER TABLE Nashville 
ALTER COLUMN SaleDate DATE;
 
select SaleDate from Nashville
   
Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress , ISNULL(a.PropertyAddress,b.PropertyAddress)
From Nashville a
JOIN Nashville b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null

update a 
set PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
From Nashville a
JOIN Nashville b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null

select PropertyAddress from Nashville 
where PropertyAddress is null

--SELECT
--SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
--, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress) ) as City
--From Nashville

SELECT 
    SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) - 1) AS StreetAddress,
    SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress) - CHARINDEX(',', PropertyAddress)) AS City
FROM Nashville;

alter table Nashville
add StreetAddress NVARCHAR(255);

UPDATE Nashville
SET StreetAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) - 1) 

alter table Nashville
add City NVARCHAR(255);

UPDATE Nashville
SET City = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress) - CHARINDEX(',', PropertyAddress))

select * from Nashville 

Select OwnerAddress
From Nashville 

Select
PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)
From Nashville 

ALTER TABLE Nashville 
Add Owner_Address Nvarchar(255);

Update Nashville 
SET Owner_Address = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)

ALTER TABLE Nashville 
Add OwnerCity Nvarchar(255);

Update Nashville 
SET OwnerCity = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)


ALTER TABLE Nashville 
Add OwnerState Nvarchar(255);

Update Nashville 
SET OwnerState = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)

Select *
From Nashville 

select distinct [soldasvacant] , count (soldasvacant) 
From Nashville 
group by SoldAsVacant

select soldasvacant 
, case when soldasvacant = 'Y' then 'Yes'
       when soldasvacant = 'N' then 'No'
	   ELSE soldasvacant
	   END 
From Nashville 

Update Nashville 
SET soldasvacant = case when soldasvacant = 'Y' then 'Yes'
       when soldasvacant = 'N' then 'No'
	   ELSE soldasvacant
	   END 
From Nashville 


ALTER TABLE Nashville
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate

WITH rownumber as (
select *, 
         ROW_NUMBER() over(
		 partition by [parcelid] , 
		              [ownername],
					  [totalvalue]
					   ORDER BY
					   UniqueID
					   ) row_num
from Nashville  
)
select * from rownumber 
where row_num > 1
order by parcelid


WITH rownumber as (
select *, 
         ROW_NUMBER() over(
		 partition by [parcelid] , 
		              [ownername],
					  [totalvalue]
					   ORDER BY
					   UniqueID
					   ) row_num
from Nashville  
)
delete 
from rownumber 
where row_num > 1


Select *
From Nashville

SELECT /*+ MAX_EXECUTION_TIME(5000) */ * FROM Nashville ;



SET STATISTICS TIME ON
 SELECT *
FROM Nashville
WHERE OwnerName IS NULL OR Acreage IS NULL ;

SELECT 
    COUNT(CASE WHEN ParcelID IS NULL THEN 1 END) AS Null_ParcelID,
    COUNT(CASE WHEN SalePrice IS NULL THEN 1 END) AS Null_SalePrice,
    COUNT(CASE WHEN OwnerName IS NULL THEN 1 END) AS Null_OwnerName
FROM Nashville;

SELECT 
    COALESCE(ParcelID, 'Unknown') AS AdjustedParcelID,
    COALESCE(SalePrice, 0) AS AdjustedSalePrice,
    COALESCE(Acreage, 0) AS AdjustedAcreage,
	COALESCE(landvalue, 0) AS Adjustedlandvalue,
	COALESCE(buildingvalue, 0) AS Adjustedbuildingvalue,
	COALESCE(totalvalue, 0) AS Adjustedtotalvalue,
	COALESCE(yearbuilt, 0) AS Adjustedbuildingvalue,
	COALESCE(bedrooms, 0) AS Adjustedbedrooms,
	COALESCE(fullbath, 0) AS Adjustedfullbath,
	COALESCE(halfbath, 0) AS Adjustedhalfbath,
	COALESCE(owner_address,'Unknown') AS Adjustedowner_address,
	COALESCE(ownercity, 'Unknown') AS Adjustedownercity,
	COALESCE(OwnerName, 'Unknown') AS AdjustedOwnerName,
	COALESCE(ownerstate, 'Unknown') AS Adjustedownerstate
FROM Nashville;

update Nashville 
set ParcelID =    COALESCE(ParcelID, 'Unknown') ,
    SalePrice =COALESCE(SalePrice, 0) ,
	Acreage =COALESCE(Acreage, 0) ,
	landvalue =COALESCE(landvalue, 0), 
	buildingvalue = COALESCE(buildingvalue, 0) ,
	totalvalue =COALESCE(totalvalue, 0) ,
	yearbuilt =COALESCE(yearbuilt, 0),
	bedrooms = COALESCE(bedrooms, 0) ,
	fullbath =COALESCE(fullbath, 0),
	halfbath =COALESCE(halfbath, 0) ,
	ownercity =COALESCE(owner_address,'Unknown'),
	owner_address =COALESCE(ownercity, 'Unknown'),
	OwnerName =COALESCE(OwnerName, 'Unknown') ,
	ownerstate =COALESCE(ownerstate, 'Unknown') 
	FROM Nashville;

	 SELECT * FROM Nashville

SELECT 
    COUNT(CASE WHEN ownercity IS NULL THEN 1 END) AS Null_ownercity,
    COUNT(CASE WHEN OwnerName IS NULL THEN 1 END) AS Null_OwnerName,
    COUNT(CASE WHEN ownerstate IS NULL THEN 1 END) AS Null_ownerstate
FROM Nashville;

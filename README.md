# 🏡 Nashville Housing Data Cleaning with SQL

![Built with SQL](https://img.shields.io/badge/Built%20with-TSQL-blue?logo=microsoftsqlserver)
![Focus: Data Cleaning](https://img.shields.io/badge/Project%20Type-Data%20Cleaning-brightgreen)
![Status](https://img.shields.io/badge/Status-Complete-blue)

## 📌 Project Overview

This project focuses on 
**cleaning and preparing housing data ** from Nashville, TN for future analysis. The dataset contains real estate records including sales, land use, and property characteristics.
Using **T-SQL**, I performed end-to-end cleaning operations: fixing nulls, restructuring fields, removing duplicates, and improving data integrity.

## 🛠️ Key Cleaning Steps

- **Date Conversion**: Converted `SaleDate` to proper DATE format for time-based analysis.
- **Address Standardization**:
  - Filled in missing `PropertyAddress` by joining on `ParcelID`
  - Split `PropertyAddress` and `OwnerAddress` into `StreetAddress`, `City`, and `State` using `SUBSTRING`, `CHARINDEX`, and `PARSENAME`
- **Column Additions**: Added new fields like `OwnerCity`, `OwnerState`, and `OwnerStreetAddress` for structured reporting
- **Data Standardization**:
  - Transformed `SoldAsVacant` values from `Y/N` to `Yes/No`
  - Replaced all NULLs using `ISNULL` and `COALESCE` to maintain completeness
- **Duplicate Handling**:
  - Used `ROW_NUMBER()` with `PARTITION BY` on `ParcelID`, `OwnerName`, and `TotalValue`
  - Removed redundant rows to preserve unique transaction records
- **Data Type Fixes & Cleanup**: Dropped obsolete columns post-cleaning for optimized output

## 🧠 Why This Matters
Clean datasets make or break any analysis. This project demonstrates how SQL can be used not just to query data, but to **prepare it responsibly for insights**. Whether it’s for dashboards or predictive modeling, high-quality data is the foundation.

## 📂 Files Included
| File                         | Description                                     |
|------------------------------|-------------------------------------------------|
| `Nashville_Housing_Cleaning.sql` | Full cleaning script with transformations     |
| `README.md`                  | Project overview and documentation              |


## ✅ Tools Used
- **SQL Server Management Studio (SSMS)**
- **T-SQL (Transact-SQL)**


## 🙋‍♀️ About Me
This project is part of my ongoing journey to master **SQL for real-world data cleaning and analysis**. Want to collaborate or leave feedback? Feel free to connect or open an issue.

📬 Author                         
**Salma Mohammed**  
[GitHub Profile](https://github.com/salmamohammed11111)  
[LinkedIn](https://www.linkedin.com/in/salma-mohammed-353919360/)


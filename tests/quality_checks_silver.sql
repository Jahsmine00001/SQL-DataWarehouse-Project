/*
=========================================================
Quality Checks
=========================================================

Script Purpose:
    This script performs various quality checks for data consistency, accuracy,
    and standardization across the 'silver' schemas. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.
=========================================================
*/

-- ============================================================
-- Checking 'silver.crm_cust_info'
-- ============================================================

-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Results
SELECT 
    cst_id,
    COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

-- Data Standardizations and Consistency
SELECT DISTINCT
	cst_gndr
FROM silver.crm_cust_info

-- Checking for White Spaces (Changing the Column names one after the other)
SELECT
*
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)


-- ============================================================
-- Checking 'silver.crm_prd_info'
-- ============================================================

-- Checking NULL and Duplicates in Primary Key
-- Expectation: No Results
SELECT 
prd_id,
COUNT(*) cnt 
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) != 1 OR prd_id IS NULL

-- checking for invalid date orders
-- Expectations: Dates with start dates higher than the end date
SELECT *
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt

-- checking the white spaces of columns (Changing the Columns one after another)
SELECT 
cat_id
FROM silver.crm_prd_info
WHERE cat_id != TRIM(cat_id)

-- data standardizations and consistency
SELECT DISTINCT
prd_line
FROM silver.crm_prd_info


-- ============================================================
-- Checking 'silver.crm_sales_details
-- ============================================================

-- Checking for white spaces in the primaary key
-- Expectations: No Result
SELECT 
sls_ord_num
FROM silver.crm_sales_details
WHERE sls_ord_num!= TRIM(sls_ord_num)

-- Finding the issues with the date FOR order_date, ship_date and due_date
SELECT
sls_due_dt
FROM silver.crm_sales_details
WHERE sls_due_dt <= 0
OR LEN(sls_due_dt) != 8
OR sls_due_dt > 20500101
OR sls_due_dt < 19900101

-- Checking for invalid date orders, the order date must be lesser than the due date or shipping date
SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt


-- checking for errors in the sls_sales sls_quantity and sls_price
-- This columns are not allowed to be negative, 0 or NULL
-- Business Rule: Sales = Quantity * Price

SELECT 
	sls_sales, 
	sls_quantity, 
	sls_price
FROM silver.crm_sales_details
WHERE sls_quantity * sls_price != sls_sales
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <=0 OR sls_quantity <=0 OR sls_price <=0
ORDER BY sls_sales, sls_quantity, sls_price


-- ============================================================
-- Checking 'silver.erp.cust_az12
-- ============================================================

-- checking data quality of silver layer
-- Expectation: Checking if the primary key can join  with the crm table

SELECT * FROM silver.erp_cust_az12 
WHERE cid NOT IN (SELECT cst_key FROM silver.crm_cust_info)

-- Checking the date column
-- Expectations: Dates Greater than the current dates

SELECT * FROM silver.erp_cust_az12 
WHERE bdate> GETDATE()

-- Data Standardizations and Consistency
SELECT DISTINCT
gen
FROM silver.erp_cust_az12


-- ============================================================
-- Checking 'silver.erp.loc_a101
-- ============================================================

-- checking data quality of silver layer
-- Expectation: Checking if the primary key can join  with the crm table
SELECT * 
FROM silver.erp_loc_a101
WHERE cid NOT IN (SELECT cst_key FROM silver.crm_cust_info)

-- Data Standardizations and consistency
SELECT DISTINCT
cntry
FROM silver.erp_loc_a101


-- ============================================================
-- Checking 'silver.erp.cat_g1v2
-- ============================================================

-- checking for unwanted spaces
SELECT
id,
cat,
subcat,
maintenance
FROM bronze.erp_px_cat_g1v2
WHERE subcat != TRIM(subcat)

-- checking if the join column works
SELECT
id,
cat,
subcat,
maintenance
FROM bronze.erp_px_cat_g1v2
WHERE id NOT IN (SELECT cat_id FROM silver.crm_prd_info)

-- Checking for Normalizations and standardizations
SELECT DISTINCT 
maintenance
FROM bronze.erp_px_cat_g1v2

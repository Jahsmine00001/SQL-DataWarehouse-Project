/*
=========================================================
Quality Checks
=========================================================

Script Purpose:
    This script performs various quality checks to validate the integrity, consistency
    and accuracy of the Gold Layer. These Checks ensure
    - Uniqueness of surrogate keys in dimension tables.
    - Referential integrity between facts and dimensions.
    - Validation of relationships in the data model for analytical purposes.

Usage Notes:
    - Run these checks after data loading Gold Layer.
    - Investigate and resolve any discrepancies found during the checks.
=========================================================
*/

-- ============================================================
-- Checking 'gold.dim_customers'
-- ============================================================

-- Checking for Duplicates
-- Expectations: None
SELECT 
    customer_key,
    COUNT(*) Duplicate_key
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1

-- Checking for Null Values and Unstandardized Gender Values
SELECT DISTINCT
gender
FROM gold.dim_customers

-- ============================================================
-- Checking 'gold.dim_products'
-- ============================================================
SELECT 
    product_id,
    COUNT(*) Duplicate_key
FROM gold.dim_products
GROUP BY product_id
HAVING COUNT(*) > 1

-- ============================================================
-- Checking 'gold.facts_sales'
-- ============================================================
SELECT * FROM gold.fact_sales s
JOIN gold.dim_customers c
ON s.customer_key = c.customer_key
WHERE c.customer_key IS NULL

SELECT * FROM gold.fact_sales s
JOIN gold.dim_products p
ON s.product_key = p.product_key
WHERE p.product_key IS NULL

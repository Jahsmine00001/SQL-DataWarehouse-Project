/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'Datawarehouse' after checking if it already exists 
    If the database already exists, it is dropped and recreated, to ensure a clean setup. 
	Additionally the script sets up three schemas within the database: 'bronze', 'silver', and 'gold'.
    

WARNING:
    Running this script will drop the entire 'Datawarehouse' database if it exists, 
    permanently deleting all data within it. Proceed with caution and ensure you 
    have proper backups before executing this script.
*/

USE master;
GO

-- Drop and recreate the 'Datawarehouse' database if it exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse'
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Creating the 'DataWarehouse' Database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Creating Schemas

CREATE SCHEMA broze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

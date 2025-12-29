# Data Warehouse and Analytics Project

Welcome to the Data Warehouse and Analytics Project repository.  
This project presents a complete data warehousing and analytics solution, from building a structured warehouse environment to generating meaningful insights.  
It is designed as a portfolio piece that demonstrates modern practices in data engineering and analytics.

---

## 🧱Project Overview

This project involves:

1. **Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture (Bronze, Silver, and Gold layers)
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries
4. **Analytics & Reporting**: Creating SQL-based reports and dashboards for actionable insights

This repository is an excellent resource for professionals and students looking to showcase expertise in:
- SQL Development
- Data Architecture
- Data Engineering
- ETL Pipeline Development
- Data Modeling
- Data Analytics

---

## 📌Project Requirements

### Building the Data Warehouse (Data Engineering)

**Objective**  
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

**Specifications**
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries
- **Scope**: Focus on the latest dataset only, historization of data is not required
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams

### BI: Analytics & Reporting (Data Analytics)

**Objective**  
Develop SQL-based analytics to deliver detailed insights into business performance metrics.

---

## Data Architecture

The data architecture for this project follows Medallion Architecture (Bronze, Silver, and Gold layers):

<img width="758" height="409" alt="Data Warehouse Architechture" src="https://github.com/user-attachments/assets/f8e85b41-82c7-421e-9d96-cc11bb56f6eb" />


1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
   - Raw Data
   - No Transformations
   - Data Model: None

2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
   - Cleaned & Standardized Data
   - Data Discovery
   - Data Deduplication
   - Data Quality Checks
   - Data Model: None

3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.
   - Business-Ready Data
   - Object Type: Views
   - Data Integration
   - Business Logic
   - Data Model: Star Schema

---

## Repository Structure

```
data-warehouse-project/
│
├── datasets/ # Raw datasets used for the project (ERP and CRM data)
│
├── docs/ # Project documentation and architecture details
│ ├── etl.drawio # Draw.io file showing ETL processes and methods
│ ├── data_architecture.drawio # Draw.io file showing the project's architecture
│ ├── data_catalog.md # Catalog of datasets, including field descriptions and metadata
│ ├── data_flow.drawio # Draw.io file for the data flow diagram
│ ├── data_models.drawio # Draw.io file for data models (star schema)
│ └── naming_conventions.md # Consistent naming guidelines for tables, columns, and files
│
├── scripts/ # SQL scripts for ETL and transformations
│ ├── bronze/ # Scripts for extracting and loading raw data
│ ├── silver/ # Scripts for cleaning and transforming data
│ └── gold/ # Scripts for creating analytical models
│
├── tests/ # Test scripts and validation files
│
├── README.md # Project overview and instructions (this file)
├── LICENSE # License information for the repository
├── .gitignore # Files and directories to be ignored by Git
└── requirements.txt # Dependencies and requirements for the project
```

---

## 📜 License
This project is made available under the MIT License.  
Feel free to use, modify, and redistribute it with proper credit.

## 👤 About Me
Hi. My name is Samuel Ayomide Makanjuola.  
I am a data enthusiast with growing expertise in Analytics Engineering, BI Analysis, Full Stack Data Analysis, data engineering, analytics, and data modelling.  
I enjoy building practical data solutions that transform raw information into insights that support real business decisions.

If you are interested in collaborating or exploring opportunities with me, feel free to reach out.  
I am open to roles, projects, and partnerships within the data space.


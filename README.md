# Farmer Cooperative Crop Supply System (FCCSS)

---

## Overview

The Farmer Cooperative Crop Supply System (FCCSS) is a PostgreSQL-based database management system designed to streamline the operations of agricultural cooperative societies. The system manages the complete crop supply chain, starting from farmer registration and crop procurement to inventory management, logistics, buyer orders, and subsidy disbursement.

## Features

- Farmer registration and profile management
- Cooperative society membership management
- Crop lot registration and procurement tracking
- Quality inspection and crop grading
- Farmer payment processing
- Warehouse and inventory management
- Buyer order management
- Transportation and logistics tracking
- Crop pricing management
- Government subsidy disbursement tracking

## Database Modules

- Farmer Management
- Cooperative Society Management
- Crop Procurement
- Quality Check and Grading
- Farmer Payments
- Warehouse Management
- Inventory Tracking
- Buyer Order Processing
- Transportation and Logistics
- Crop Pricing
- Subsidy Management

## Database Design

The system consists of **15+ interconnected entities** connected using primary and foreign key constraints to maintain data integrity and consistency across the agricultural supply chain.

Key entities include:

- Farmer
- Cooperative Society
- Farmer Membership
- Crop Lot
- Procurement
- Quality Check
- Farmer Payment
- Warehouse
- Inventory
- Logistics Partner
- Vehicle
- Buyer
- Order Header
- Order Item
- Transport Job
- Crop Price
- Subsidy Scheme
- Subsidy Disbursement

## Tech Stack

- PostgreSQL
- SQL
- Database Normalization
- Relational Database Design

## Repository Structure

```text
FarmerCooperative_CropSupply_ManagementSystem/
│
├── README.md
├── schema.sql
├── FCCSS_Insert_Script.sql
├── FCCSS_Queries.sql
└── database_design.pdf
```

## Setup Instructions

1. Clone the repository:

```bash
git clone https://github.com/DEVARSHIP1707/FarmerCooperative_CropSupply_ManagementSystem 
```

2. Open PostgreSQL and create the database:

```sql
CREATE DATABASE fccss;
```

3. Run the schema script:

```bash
psql -d fccss -f schema.sql
```

4. Insert sample data:

```bash
psql -d fccss -f FCCSS_Insert_Script.sql
```

5. Execute the query file to test the database functionality:

```bash
psql -d fccss -f FCCSS_Queries.sql
```

## Learning Outcomes

- Relational Database Design
- Database Normalization
- SQL Query Optimization
- Entity Relationship Modeling
- Constraint Management
- Supply Chain Data Modeling

## Contributors

- Devarshi

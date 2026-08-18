# Enterprise ERD

## 1. Purpose

The Enterprise ERD defines the logical structure of the analytical
data warehouse for the Enterprise Analytics & Decision Intelligence Platform.

The model is designed to support:

- Sales
- Customers
- Products
- Inventory
- Procurement
- Suppliers
- Stores
- Geography
- Finance
- Human Resources
- Marketing

---

# 2. Modeling Approach

The platform follows a dimensional data warehouse approach.

The model is organized around:

- Fact Tables
- Dimension Tables
- Reference Data
- Audit Tables

The primary analytical pattern is a Star Schema.

---

# 3. Enterprise Data Domains

```text
Sales
Customers
Products
Inventory
Procurement
Suppliers
Stores
Geography
Finance
HR
Marketing
4. Core Dimensions

Initial dimensions:

DimDate
DimCustomer
DimProduct
DimCategory
DimEmployee
DimDepartment
DimJob
DimSupplier
DimStore
DimWarehouse
DimCountry
DimRegion
DimCity
DimChannel
DimPromotion
DimAccount
5. Core Facts

Initial facts:

FactSales
FactReturns
FactPurchases
FactInventory
FactStockMovement
FactAttendance
FactPayroll
FactFinance
FactBudget
FactMarketing
FactTargets
FactSupplierPayment
6. High-Level Model
                         DimDate
                            │
                            │
DimCustomer ─────────── FactSales ─────────── DimProduct
                            │
                            │
                       DimStore
                            │
                            │
                       DimChannel
                            │
                            │
                       DimPromotion
                            │
                            │
                       Geography




DimSupplier ───────── FactPurchases ───────── DimProduct
      │                     │
      │                     │
      └────────────── DimWarehouse




DimProduct ───────── FactInventory ───────── DimWarehouse
                         │
                         │
                       DimDate




DimEmployee ───────── FactAttendance
      │
      ├────────────── FactPayroll
      │
      └────────────── DimDepartment




DimAccount ───────── FactFinance ───────── DimDate




DimPromotion ─────── FactMarketing
                         │
                         │
                    DimCustomer
7. Grain Principle

Every fact table must have a clearly defined grain.

Example:

FactSales
Grain = One row per sales order line

The grain must be documented before implementing the table.

8. Surrogate Keys

Warehouse dimensions will use surrogate keys where appropriate.

Example:

CustomerKey
ProductKey
EmployeeKey
StoreKey
SupplierKey
DateKey

Business keys from source systems will be preserved separately.

9. Historical Data

Dimensions requiring historical tracking may use Slowly Changing
Dimension techniques.

Primary strategy:

SCD Type 2

where historical changes must be preserved.

10. Auditability

Important warehouse entities should contain appropriate audit information,
such as:

Created Date
Modified Date
Load Date
Batch ID
Source System
11. Design Objective

The final ERD must provide:

Referential integrity
Analytical flexibility
Historical tracking
KPI consistency
Efficient BI querying
Reusable analytical datasets
Clear business meaning
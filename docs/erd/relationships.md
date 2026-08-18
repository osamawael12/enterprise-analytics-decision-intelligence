# Data Model Relationships

## 1. Relationship Principles

Relationships must preserve referential integrity and support analytical
navigation from dimensions to facts.

---

# 2. Sales Relationships

```text
DimDate       1 ──────── * FactSales
DimCustomer   1 ──────── * FactSales
DimProduct    1 ──────── * FactSales
DimStore      1 ──────── * FactSales
DimChannel    1 ──────── * FactSales
DimPromotion  1 ──────── * FactSales

---
# 3. Returns Relationships

DimDate       1 ──────── * FactReturns
DimCustomer   1 ──────── * FactReturns
DimProduct    1 ──────── * FactReturns
DimStore      1 ──────── * FactReturns
DimChannel    1 ──────── * FactReturns
5. Inventory Relationships
DimDate       1 ──────── * FactInventory
DimProduct    1 ──────── * FactInventory
DimWarehouse  1 ──────── * FactInventory
6. HR Relationships
DimDate        1 ──────── * FactAttendance
DimEmployee    1 ──────── * FactAttendance
DimDepartment  1 ──────── * FactAttendance


DimEmployee    1 ──────── * FactPayroll
DimDepartment  1 ──────── * FactPayroll
DimDate        1 ──────── * FactPayroll
7. Finance Relationships
DimDate        1 ──────── * FactFinance
DimAccount     1 ──────── * FactFinance
DimDepartment  1 ──────── * FactFinance


DimDate        1 ──────── * FactBudget
DimAccount     1 ──────── * FactBudget
DimDepartment  1 ──────── * FactBudget
8. Geography Relationships
DimCountry
    1
    │
    *
DimRegion
    │
    *
DimCity
    │
    *
DimStore

and:

DimCountry
    1
    │
    *
DimRegion
    │
    *
DimCity
    │
    *
DimWarehouse
9. Product Hierarchy
DimCategory
     1
     │
     *
DimProduct
10. Employee Hierarchy
DimDepartment
      1
      │
      *
DimEmployee
      │
      *
DimJob

The physical implementation of employee/job relationships will be finalized
during detailed database design.

11. Relationship Rules
Facts reference dimensions through surrogate keys.
Dimension primary keys must be unique.
Foreign keys must reference valid dimension records.
Unknown members should be handled explicitly.
Many-to-many relationships should not be introduced without a defined
bridge or fact structure.
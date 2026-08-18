
---

# 6. `naming-conventions.md`

```markdown
# Naming Conventions

## 1. General Principles

Names must be:

- Clear
- Consistent
- Descriptive
- Predictable
- SQL-friendly

Avoid:

- Spaces
- Special characters
- Ambiguous abbreviations
- Reserved SQL keywords

---

# 2. Database Objects

## Database

```text
EnterpriseAnalyticsDB
Schemas

Recommended schemas:

stg
dw
mart
audit
security
ref
3. Tables
Dimensions
DimCustomer
DimProduct
DimDate
Facts
FactSales
FactInventory
FactFinance
Staging
stg_Sales
stg_Customers
Audit
ETL_Run
ETL_Error
DataQuality_Result
4. Keys

Surrogate keys:

CustomerKey
ProductKey
DateKey

Business keys:

CustomerID
ProductID
StoreID
5. Foreign Keys

Foreign keys should use the referenced dimension name.

Examples:

CustomerKey
ProductKey
StoreKey
SupplierKey
DateKey
6. Measures

Measures should use descriptive names.

Examples:

Quantity
GrossSales
NetSales
GrossProfit
DiscountAmount
InventoryValue
BudgetAmount
7. Audit Columns

Recommended columns:

CreatedDate
ModifiedDate
LoadDate
BatchID
SourceSystem
8. Boolean Columns

Use clear names such as:

IsActive
IsDeleted
IsReturned
IsLate
IsAbsent
9. Date Columns

Use descriptive suffixes:

OrderDate
ShipDate
HireDate
StartDate
EndDate
CreatedDate
ModifiedDate
10. Naming Rule

The same business concept must have the same name throughout
the warehouse, analytical layer, API, and BI model whenever practical.
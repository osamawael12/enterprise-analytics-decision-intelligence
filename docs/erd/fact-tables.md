
---

# 2. `fact-tables.md`

```markdown
# Fact Tables

## 1. Fact Table Design Principles

Fact tables represent measurable business events or periodic snapshots.

Each fact table must define:

- Business process
- Grain
- Measures
- Foreign keys
- Date relationship
- Source
- Loading strategy

---

# 2. FactSales

## Business Process

Sales transactions.

## Grain

One row per sales order line.

## Main Dimensions

- Date
- Customer
- Product
- Store
- Channel
- Promotion

## Measures

- Quantity
- Unit Price
- Discount
- Gross Sales
- Net Sales
- Cost
- Gross Profit
- Margin

---

# 3. FactReturns

## Business Process

Customer product returns.

## Grain

One row per returned sales order line.

## Main Dimensions

- Date
- Customer
- Product
- Store
- Channel

## Measures

- Returned Quantity
- Return Amount
- Return Cost

---

# 4. FactPurchases

## Business Process

Supplier purchase orders.

## Grain

One row per purchase order line.

## Main Dimensions

- Date
- Supplier
- Product
- Warehouse

## Measures

- Ordered Quantity
- Received Quantity
- Unit Cost
- Purchase Amount

---

# 5. FactInventory

## Business Process

Inventory snapshot.

## Grain

One row per product, warehouse, and snapshot date.

## Main Dimensions

- Date
- Product
- Warehouse

## Measures

- On Hand Quantity
- Available Quantity
- Reserved Quantity
- Inventory Value

---

# 6. FactStockMovement

## Business Process

Inventory movements.

## Grain

One row per stock movement transaction.

## Main Dimensions

- Date
- Product
- Warehouse

## Measures

- Movement Quantity
- Movement Value

---

# 7. FactAttendance

## Business Process

Employee attendance.

## Grain

One row per employee per attendance date.

## Main Dimensions

- Date
- Employee
- Department

## Measures

- Worked Hours
- Overtime Hours
- Absence Flag
- Late Flag

---

# 8. FactPayroll

## Business Process

Employee payroll.

## Grain

One row per employee per payroll period.

## Main Dimensions

- Employee
- Department
- Date

## Measures

- Base Salary
- Allowances
- Deductions
- Net Salary

---

# 9. FactFinance

## Business Process

Financial transactions.

## Grain

One row per financial transaction.

## Main Dimensions

- Date
- Account
- Department

## Measures

- Debit
- Credit
- Amount

---

# 10. FactBudget

## Business Process

Budget planning.

## Grain

One row per account, department, and budget period.

## Measures

- Budget Amount

---

# 11. FactMarketing

## Business Process

Marketing and promotion activity.

## Grain

One row per marketing activity / campaign event at the defined analytical grain.

## Main Dimensions

- Date
- Customer
- Promotion

## Measures

- Marketing Spend
- Impressions
- Responses
- Conversions

---

# 12. FactTargets

## Business Process

Business target tracking.

## Grain

One row per target entity and target period.

## Measures

- Target Amount
- Target Quantity

---

# 13. FactSupplierPayment

## Business Process

Supplier payments.

## Grain

One row per supplier payment transaction.

## Main Dimensions

- Supplier
- Date
- Account

## Measures

- Payment Amount
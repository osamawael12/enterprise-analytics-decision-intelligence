# Dimension Tables

## 1. Dimension Design Principles

Dimensions provide descriptive business context for analytical facts.

Dimensions should contain:

- Surrogate Key
- Business Key
- Descriptive Attributes
- Audit Information
- Historical Tracking where required

---

# 2. DimDate

Provides calendar analysis.

### Key Attributes

- DateKey
- FullDate
- Day
- Month
- MonthName
- Quarter
- Year
- Week
- FiscalPeriod

---

# 3. DimCustomer

Provides customer context.

### Key Attributes

- CustomerKey
- CustomerID
- CustomerName
- CustomerSegment
- CustomerStatus
- CustomerType
- RegistrationDate

---

# 4. DimProduct

Provides product information.

### Key Attributes

- ProductKey
- ProductID
- ProductName
- CategoryKey
- SubCategory
- Brand
- UnitOfMeasure
- ProductStatus

---

# 5. DimCategory

Provides product category hierarchy.

### Key Attributes

- CategoryKey
- CategoryID
- CategoryName
- CategoryGroup

---

# 6. DimEmployee

Provides employee information.

### Key Attributes

- EmployeeKey
- EmployeeID
- EmployeeName
- DepartmentKey
- JobKey
- HireDate
- EmploymentStatus

---

# 7. DimDepartment

Provides organizational structure.

### Key Attributes

- DepartmentKey
- DepartmentID
- DepartmentName
- DepartmentGroup

---

# 8. DimJob

Provides job information.

### Key Attributes

- JobKey
- JobID
- JobTitle
- JobLevel

---

# 9. DimSupplier

Provides supplier information.

### Key Attributes

- SupplierKey
- SupplierID
- SupplierName
- SupplierType
- SupplierStatus

---

# 10. DimStore

Provides store information.

### Key Attributes

- StoreKey
- StoreID
- StoreName
- CityKey
- StoreType
- OpeningDate
- StoreStatus

---

# 11. DimWarehouse

Provides warehouse information.

### Key Attributes

- WarehouseKey
- WarehouseID
- WarehouseName
- CityKey
- WarehouseType
- WarehouseStatus

---

# 12. DimCountry

Provides country-level geography.

### Key Attributes

- CountryKey
- CountryCode
- CountryName

---

# 13. DimRegion

Provides regional geography.

### Key Attributes

- RegionKey
- RegionCode
- RegionName
- CountryKey

---

# 14. DimCity

Provides city-level geography.

### Key Attributes

- CityKey
- CityCode
- CityName
- RegionKey

---

# 15. DimChannel

Provides sales channel information.

### Key Attributes

- ChannelKey
- ChannelCode
- ChannelName
- ChannelType

---

# 16. DimPromotion

Provides promotion information.

### Key Attributes

- PromotionKey
- PromotionID
- PromotionName
- PromotionType
- DiscountPercentage
- StartDate
- EndDate

---

# 17. DimAccount

Provides financial account information.

### Key Attributes

- AccountKey
- AccountCode
- AccountName
- AccountType
- AccountCategory
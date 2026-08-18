
---

# 5. `data-dictionary.md`

```markdown
# Data Dictionary

## 1. Purpose

The Data Dictionary defines the meaning, structure, and ownership of
data elements used throughout the analytical platform.

---

# 2. Required Metadata

Every important table and column should document:

| Metadata | Description |
|---|---|
| Table Name | Physical table name |
| Column Name | Physical column name |
| Data Type | SQL data type |
| Nullable | Whether NULL is allowed |
| Key Type | PK / FK / Business Key |
| Business Definition | Meaning of the field |
| Source | Original source |
| Transformation | Transformation logic |
| Example | Example value |
| Sensitivity | Security classification |

---

# 3. Fact Table Metadata

Each fact table must document:

- Business Process
- Grain
- Measures
- Dimensions
- Source
- Load Strategy

---

# 4. Dimension Metadata

Each dimension must document:

- Business Purpose
- Business Key
- Surrogate Key
- Attributes
- Historical Tracking
- Source
- Owner

---

# 5. KPI Metadata

KPI definitions will be maintained separately in:

```text
docs/kpi-catalog/
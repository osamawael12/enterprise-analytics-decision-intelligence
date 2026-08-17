# Project Scope

## 1. Objective

The objective is to build an end-to-end enterprise analytics and decision
intelligence platform covering the full lifecycle from operational data
through automated business decisions.

---

# 2. In Scope

## Data Engineering

- Source ingestion
- CSV ingestion
- Excel ingestion
- API ingestion
- Data transformation
- Data validation
- Data loading
- Full loads
- Incremental loads
- Logging
- Error handling
- Retry logic

---

## Data Warehouse

- SQL Server
- Staging layer
- Warehouse layer
- Analytical marts
- Fact tables
- Dimension tables
- Audit layer
- Security layer
- Indexes
- Constraints

The target enterprise model is approximately 30–35 tables. :contentReference[oaicite:6]{index=6}

---

## Data Quality

- Completeness
- Uniqueness
- Validity
- Consistency
- Freshness
- Referential integrity
- Accuracy
- Data Quality Score
- Audit results
- Quality alerts

---

## Analytics

- Analytical SQL
- KPI datasets
- RFM
- Retention
- Cohort Analysis
- Profitability
- Inventory Turnover
- Supplier Performance
- Budget Variance
- HR Analytics

---

## Business Intelligence

### Excel

- Management reporting
- Power Query
- PivotTables
- What-If analysis

### Power BI

- Semantic model
- DAX
- Executive dashboard
- Sales
- Customers
- HR
- Finance
- Inventory
- Procurement
- Marketing
- Geography
- RLS

---

## Applications

- FastAPI
- Web landing page
- Authentication
- Authorization
- Streamlit Analytics
- Streamlit AI/ML

---

## Machine Learning

- Sales Forecasting
- Demand Forecasting
- Customer Churn
- Customer Segmentation
- Customer Lifetime Value
- Employee Attrition
- Profit Prediction
- Anomaly Detection
- Inventory Optimization

---

## AI

- AI Business Analyst
- KPI explanation
- Driver analysis
- Root-cause analysis
- Executive summaries
- Recommendations
- Expected business impact

---

## Decision Intelligence

- Decision Center
- KPI vs Target
- Variance
- Drivers
- Root Cause
- Business Impact
- Recommendation
- Next Action
- Recommendation prioritization

---

## Simulation

- Price scenarios
- Discount scenarios
- Marketing budget scenarios
- Inventory scenarios
- Baseline vs scenario

---

## Automation

- n8n workflows
- Data ingestion
- Data quality checks
- BI refresh
- ML inference
- AI insight generation
- Reports
- Alerts

---

## Production

- Testing
- Security
- Docker
- Monitoring
- Logging
- Backups
- HTTPS
- Cloud deployment

---

# 3. Out of Scope

The following are outside the initial project scope:

- Building a real ERP system
- Replacing operational transactional systems
- Real financial transactions
- Real customer payments
- Real employee payroll processing
- Production use of personal customer information
- Production use of confidential company data
- Fully autonomous business decisions without human oversight

---

# 4. Project Constraints

The project will use:

- Synthetic or controlled test data
- Secure configuration
- Reproducible data generation
- Documented assumptions
- Governed analytical definitions

---

# 5. Scope Philosophy

The project prioritizes:

1. Business correctness
2. Data quality
3. Analytical correctness
4. Security
5. Reusability
6. Explainability
7. Production readiness

The platform should not become a collection of disconnected dashboards
or notebooks.
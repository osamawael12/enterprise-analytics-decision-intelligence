# Data Flow

## 1. End-to-End Data Flow

```text
SOURCE
  ↓
EXTRACT
  ↓
RAW
  ↓
STAGING
  ↓
VALIDATE
  ↓
TRANSFORM
  ↓
WAREHOUSE
  ↓
ANALYTICAL DATASET
  ↓
BI / API / APPLICATIONS
  ↓
ML / AI
  ↓
DECISION
  ↓
AUTOMATION
2. Source to Warehouse
Step 1 — Source

Data originates from:

CSV
Excel
APIs
Generated data
Step 2 — Extraction

Python extracts source data.

Step 3 — Raw Storage

Original source information is preserved before transformation.

Step 4 — Staging

Data is loaded into SQL Server staging structures.

Step 5 — Validation

Data quality rules are executed.

Step 6 — Transformation

Business transformations are applied.

Step 7 — Warehouse Load

Validated data is loaded into dimensions and facts.

3. Warehouse to Analytics
Fact Tables
     +
Dimension Tables
     ↓
Analytical SQL
     ↓
KPI Datasets
     ↓
BI / Python / API
4. Analytics to ML
Warehouse
   ↓
Feature Engineering
   ↓
Training Dataset
   ↓
Model Training
   ↓
Model Evaluation
   ↓
Model Registry / Storage
   ↓
Inference
5. Analytics to AI
KPI
 ↓
Analytical Result
 ↓
Drivers
 ↓
Business Context
 ↓
AI Analysis
 ↓
Insight
 ↓
Recommendation
6. Decision to Automation
Decision
   ↓
Recommendation
   ↓
Business Rule
   ↓
n8n Workflow
   ↓
Alert / Report / Action

---

# 7. `deployment-architecture.md`

```markdown
# Deployment Architecture

## 1. Environments

The platform will use separate environments where practical:

```text
Development
     ↓
Testing
     ↓
Production
2. Development Environment

Primary development tools:

VS Code
Python Virtual Environment
Git
GitHub
SQL Server
Power BI
Excel
3. Application Deployment

Application services will be packaged using Docker where appropriate.

                 Docker Host
                     │
       ┌─────────────┼─────────────┐
       │             │             │
       ▼             ▼             ▼
    FastAPI      Streamlit      Other Services
4. Database

SQL Server will host the centralized analytical database.

The database should be protected through:

Authentication
Authorization
Network controls
Backups
Monitoring
5. Production Architecture
                     USERS
                       │
                       ▼
                    HTTPS
                       │
             ┌─────────┴─────────┐
             ▼                   ▼
          Web App            Streamlit
             │                   │
             └─────────┬─────────┘
                       ▼
                    FastAPI
                       │
             ┌─────────┴─────────┐
             ▼                   ▼
        SQL Server              ML/AI
             │
             ▼
         Data Warehouse
             │
             ▼
          Analytics
             │
             ▼
            n8n
6. Configuration

Environment-specific settings must be externalized.

Examples:

Database connection
API configuration
Authentication secrets
External services
Application settings
7. Backup

Production data should have a defined backup strategy.

Backup considerations:

Database backups
Configuration backups
Critical model artifacts
Workflow definitions
8. Monitoring

Production monitoring should cover:

Application health
API health
Database health
ETL execution
Data quality
Workflow execution
ML model performance
9. Deployment Goal

The final platform should be externally accessible through a secure
deployment with HTTPS, monitoring, logging, and controlled access.
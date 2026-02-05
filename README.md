# Disease Outbreak Data Warehouse & Analytics Dashboard

An end-to-end data analytics portfolio project that designs and implements a **dimensional data warehouse** for disease outbreak analysis and delivers **interactive visual insights** through a published Tableau dashboard.

This solution demonstrates professional skills across **data modeling, SQL development, ETL design, and dashboard visualization** with meaningful applications in public health intelligence.

---

## 🔍 Project Overview

Effective analysis of disease outbreaks requires structured data and intuitive insights. This project builds:

- A **star schema data warehouse** optimized for analytical queries
- SQL scripts for **table creation and data ingestion**
- A **Tableau Public dashboard** showcasing interactive insights
- Documentation and screenshots to support interpretation

This project exemplifies best practices in analytical architecture and storytelling.

---

## 🏗️ Data Warehouse Design

The warehouse follows **dimensional modeling principles**, separating fact and dimension tables for performance and clarity.

### 💡 Fact Tables
- Patient-Outbreak relationships  
- Appointment records

### 📌 Dimension Tables
- Patient
- Disease
- Location
- Healthcare Provider
- Symptoms
- Treatment
- Outbreak

This structure supports flexible reporting across time, geography, disease type, and treatment outcomes.

---

## ⚙️ Technologies Used

- **SQL** – schema creation and transformation logic  
- **PostgreSQL / Relational Database Systems**  
- **Dimensional Modeling (Star Schema)**  
- **Tableau** – interactive business intelligence  
- **GitHub** – version control and public project hosting

---

## 📁 Repository Structure

Disease-Outbreak-Data-Warehouse/
│
├── sql/
│ ├── Dimensional_Tables_Creation.sql
│ ├── Disease.sql
│ ├── Healthcare_Provider.sql
│ ├── HealthTableCreation.sql
│ ├── Loading_Data_Into_The_Model.sql
│ ├── Location.sql
│ ├── Outbreak.sql
│ ├── Patient.sql
│ ├── Patient_Appointment.sql
│ ├── Patient_Outbreak.sql
│ ├── Symptoms.sql
│ └── Treatment.sql
│
├── dashboards/
│ └── tableau/
│ ├── dashboard_overview.png
│ ├── trends_over_time.png
│ └── cases_by_location.png
│
└── README.md


---

## 📊 Interactive Tableau Dashboard

An interactive analytics dashboard is published on **Tableau Public** and showcases the analytical power of the data warehouse.

🔗 **Live Dashboard (Tableau Public):**  
https://public.tableau.com/app/profile/rodney.chiwanga/viz/DISEASEOUTBREAKMANAGEMENTPROJECT/DiseaseOutBreakDashboard

### 📌 Dashboard Highlights
- **Outbreak trends over time**
- **Case distribution across locations**
- **Comparison of diseases and treatment outcomes**
- **Visual filter controls for dynamic exploration**

This dashboard allows stakeholders to explore insights without manual queries.

---

## 🎯 Use Cases & Impact

This project supports scenarios including:

- Public health monitoring and response
- Healthcare resource allocation and planning
- Epidemiological trend analysis
- Executive dashboarding for non-technical stakeholders

The analytics layer turns raw data into actionable insights.

---

## 🚀 Skills Demonstrated

- Data warehouse architecture and modeling
- SQL scripting and ETL pipeline structure
- Interactive data visualization and dashboarding
- Version control and documentation
- Data storytelling for decision support

---

## 📌 Future Enhancements

Potential extensions could include:

- Automating ETL with Python or cloud services
- Integrating real-world public health datasets (CDC, WHO)
- Adding forecasting models for outbreak prediction
- Moving to hosted cloud infrastructure (AWS/GCP/Azure)

---

## 👤 About the Author

**Rodney Chiwanga**  
Graduate Student – Data Analytics & Visualization  
📍 New York, NY, USA  
GitHub: https://github.com/Rodney22  
Tableau Public: https://public.tableau.com/app/profile/rodney.chiwanga

---


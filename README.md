# Clinical-Readmitted-Risk-Analysis-Using-SQL-EHR-style-Data

Project Overview


This project analyze hospital readmitted data to identify clinical and operational risk factors associated with 30-day readmitted. The analysis simulates real-world EHR workflows by focusing on data quality validation, clinical condition indicator, discharge outcomes, and medication burden.
## 📊 Dataset Description
The dataset contains de-identified hospital encounter data, including:

- Patient demographics (age)
- Length of stay
- Discharge destination
- Medication count
- Chronic condition indicators (hypertension, diabetes, high cholesterol)
- 30-day readmission flag

The dataset includes real-world data challenges such as **NULL values, inconsistent fields, and clinical logic dependencies**, making it suitable for clinical informatics and health system analysis.

---

## 🧠 Skills Demonstrated
- SQL Server (CTEs, joins, aggregations, conditional logic)
- Clinical data quality assessment and validation
- Healthcare data analysis (readmissions, discharge outcomes)
- Risk stratification using clinical and utilization indicators
- Translating clinical workflows into analytical logic
- Preparing datasets for visualization in Power BI

---

## 🧪 Data Quality Assessment
Before performing analysis, data quality checks were conducted to ensure reliability and clinical validity of the dataset, including:

- Identification of missing values in critical clinical fields
- Detection of invalid or out-of-range values (e.g., age, length of stay)
- Review of inconsistent categorical values (e.g., discharge destination)
- Validation of chronic condition indicators
- Logical consistency checks across clinical and utilization data

These steps reflect real-world **clinical informatics and data governance practices**, where data validation is required prior to reporting or decision support.

---

## 🔍 Key Analytical Questions
- How does medication burden impact 30-day readmission rates?
- Do patients with multiple chronic conditions have higher readmission risk?
- How does discharge destination influence readmission outcomes?
- Can a rule-based risk score identify high-risk patients?
- What data quality issues could impact clinical reporting accuracy?

---

## ⚠️ Readmission Risk Scoring
A rule-based readmission risk score was developed using:

- Age
- Length of stay
- Medication count
- Chronic condition indicators
- Discharge destination

This approach mirrors **early clinical decision support and care management logic** used in population health analytics and utilization review.

---

## 🗂️ Project Structure
hospital-readmission-analysis
|

│├── sql
│├── data_quality_checks.sql
│├── readmission_analysis.sql
│└── risk_scoring.sql
├── powerbi
│└── readmission_dashboard.pbix
|├── documentation
│└── data_dictionary.md
|└── README.md
## 📈 Tools & Technologies
- SQL Server
- Power BI

---
## 🎯 Key Takeaways
- Data quality assessment is a critical first step in clinical analytics
- Medication burden, chronic conditions, and discharge outcomes are key drivers of readmission risk
- Rule-based risk scoring can support care management and population health initiatives
---
##  Name
**Selamawit Engeda**  
Healthcare Informatics | Clinical Data & Systems Analysis



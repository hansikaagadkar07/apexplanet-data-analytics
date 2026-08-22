# ApexPlanet Data Analytics

This project is part of the **ApexPlanet Data Analytics Internship** and contains work completed across Tasks 1, 2, and 3 using the Sample Superstore dataset.

---

# Task 1 - Exploratory Data Analysis

## 📌 Project Overview

The objective of Task 1 is to perform Exploratory Data Analysis (EDA) on the Sample Superstore dataset using Python.

## 🛠️ Tools Used

* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn
* Jupyter Notebook
* VS Code

## 📊 Tasks Performed

* Loaded the dataset
* Checked missing values
* Removed duplicates
* Converted date columns
* Performed Exploratory Data Analysis
* Created visualizations
* Saved the cleaned dataset

## 📁 Dataset

**Sample - Superstore Dataset**

---

# Task 2 - SQL & Database Integration

## 📌 Overview

In this task, the Sample Superstore dataset was integrated with SQLite using Python, Pandas, and SQLAlchemy.

## 🛠️ Technologies Used

* Python
* Pandas
* SQL
* SQLite
* SQLAlchemy
* Jupyter Notebook

## 📊 Work Completed

* Loaded the Superstore dataset into SQLite
* Created a `sales` database table
* Performed SQL queries for business analysis
* Analyzed sales by product, category, region, customer, and segment
* Calculated monthly sales trends
* Used advanced SQL concepts:

  * CTE
  * ROW_NUMBER()
  * RANK()
  * LAG()
  * LEAD()
* Created a SQL View for monthly sales
* Created reusable database utility functions using Python and SQLAlchemy

## 📂 Project Files

```text
data/
    cleaned_data.csv

notebooks/
    Task1_EDA.ipynb
    Task2_SQL_Integration.ipynb
    superstore.db

scripts/
    database_utils.py
    __init__.py

sql/
    task2_queries.sql
```

---

# Task 3 - Data Visualization & Dashboard

## 📌 Overview

The objective of Task 3 is to create meaningful visualizations and an interactive dashboard using the Sample Superstore dataset.

## 📊 Visualizations Created

* Monthly Sales Trend
* Sales by Category
* Sales by Region
* Profit Analysis
* Top Products Analysis

## 📈 Power BI Dashboard

Created a **Superstore Sales & Profit Dashboard** using Power BI.

The dashboard includes:

* Total Sales
* Total Profit
* Total Quantity
* Sales by Region
* Sales by Category
* Monthly Sales Trend
* Interactive filters/slicers

## 📂 Task 3 Files

* `notebooks/Task3_Visualization.ipynb`
* `reports/monthly_sales_trend.html`
* `reports/sales_by_category.png`
* `reports/task3_dashboard.png`
* `dashboards/Superstore_Task3_Dashboard.pbix`

## 🛠️ Tools Used

* Python
* Pandas
* Matplotlib
* Seaborn
* Jupyter Notebook
* Power BI
* VS Code
* Git & GitHub

---

## 👩‍💻 Author

**Hansika Agadkar**

ApexPlanet Data Analytics Internship


## Task 4 – Advanced Analytics

### Objective
Applied statistical analysis, time-series analysis, customer segmentation, and basic predictive modeling to the Sample Superstore dataset.

### Statistical Analysis
- Calculated mean, median, mode, standard deviation, and skewness.
- Performed an independent two-sample t-test comparing Consumer and Corporate segment profits.
- Calculated a 95% confidence interval for mean profit.

### Time Series Analysis
- Converted Order Date into datetime format.
- Resampled sales data on a monthly basis.
- Analyzed monthly sales trends.
- Calculated a 3-month moving average.

### Customer Segmentation
- Created RFM features:
  - Recency
  - Frequency
  - Monetary
- Standardized the features using StandardScaler.
- Applied K-Means clustering.
- Selected 4 customer segments using the Elbow Method.
- Used PCA to visualize the customer clusters.
- The first two principal components explained approximately 83.37% of the total variance.

### Predictive Modeling
- Built a Linear Regression model to predict Sales.
- Used an 80/20 train-test split.
- Used Quantity, Discount, and Profit as prediction features.
- Evaluated the model using:
  - R²
  - MAE
  - RMSE
- Analyzed feature coefficients to determine relative feature importance.

### Files
- `notebooks/Task4_Advanced_Analytics.ipynb`
- `data/customer_segments.csv`

### Tools Used
Python, Pandas, NumPy, Matplotlib, Seaborn, SciPy, Scikit-learn, Jupyter Notebook


## Task 5 – Automation & Reporting

### Objective

Developed an automated data processing and KPI reporting pipeline using Python to streamline data cleaning, analysis, and report generation.

### Tools & Technologies

* Python
* Pandas
* OpenPyXL
* Excel
* Git & GitHub

### Automation Pipeline

The automation pipeline performs the following steps:

1. Loads the raw Superstore dataset.
2. Cleans and preprocesses the data.
3. Calculates important business KPIs.
4. Generates an Excel KPI report automatically.
5. Saves the cleaned dataset and generated reports.

### Key Performance Indicators

| KPI                 |    Result |
| ------------------- | --------: |
| Total Sales         | 2,297,201 |
| Total Profit        |   286,397 |
| Total Orders        |     5,009 |
| Total Customers     |       793 |
| Total Quantity      |    37,873 |
| Average Order Value |    458.61 |

### Task 5 Files

```text
automation/
└── pipeline.py

reports/
├── task5_kpi_report.xlsx
└── Task5_Final_Project_Reports.pdf.pdf
```

### Outcome

Successfully implemented an automated reporting workflow that converts raw data into cleaned data and business KPI reports, reducing manual reporting effort and improving the efficiency of data analysis.

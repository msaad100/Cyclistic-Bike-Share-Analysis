# Cyclistic-Bike-Share-Analysis
Data analysis case study using SQL to compare annual members and casual riders.
This project analyzes 12 months of historical trip data from Cyclistic, a fictional bike-share company in Chicago. The goal is to identify trends in how annual members and casual riders use the service differently to help design marketing strategies for converting casual riders into members.

2. The Business Task

Primary Objective: How do annual members and casual riders use Cyclistic bikes differently?

Key Stakeholders: Cyclistic Executive Team and Director of Marketing (Lily Moreno).

3. Data Source & Structure
Content:

Dataset: Divvy Trip Data (December 2024 - November 2025).

Data Scale: 12 monthly CSV files merged into a single SQL database containing 5.6 million rows.

4. Technical Stack
Content:

SQL Server (SSMS): Data ingestion, cleaning, and transformation.

GitHub: Version control and project documentation.

Power BI / Tableau: (Add which one you choose later) for data visualization.

5. Data Processing & Cleaning

Step 1: Data Ingestion
Merged 12 individual monthly tables using UNION ALL into a master table Combined_Trip_Data. Used SELECT INTO for efficient bulk data movement.

Step 2: Data Quality Audit
Initial profiling revealed the following issues:

Negative/Zero Durations: 29 rows.

Short Trips (< 60s): 146,319 rows (Likely maintenance or false starts).

Missing Station Data: ~1.8M rows (Primarily electric bikes).

Step 3: Cleaning Actions
Removed trips less than 60 seconds and negative durations to prevent skewed averages.

Retained rows with missing station names for temporal (time-based) analysis as ride timestamps were 100% complete.

Step 4: Feature Engineering
Created new columns for analysis:

ride_length_min: Calculated duration in minutes.

day_of_week_name: Extracted day name (Monday-Sunday) for weekly patterns.

day_of_week_number: Extracted for logical sorting.

month_name: Extracted for seasonal analysis.

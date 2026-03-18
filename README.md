# Cyclistic-Bike-Share-Analysis
Data analysis case study using SQL to compare annual members and casual riders.
This project analyzes 12 months of historical trip data from Cyclistic, a fictional bike-share company in Chicago. The goal is to identify trends in how annual members and casual riders use the service differently to help design marketing strategies for converting casual riders into members.
## The Business Task

Primary Objective: How do annual members and casual riders use Cyclistic bikes differently?

Key Stakeholders: Cyclistic Executive Team and Director of Marketing (Lily Moreno).

## Data Source & Structure
Content:

Dataset: Divvy Trip Data (December 2024 - November 2025).

Data Scale: 12 monthly CSV files merged into a single SQL database containing 5.6 million rows.

## Technical Stack
Content:

SQL Server (SSMS): Data ingestion, cleaning, and transformation.

GitHub: Version control and project documentation.

Power BI / Tableau: (Add which one you choose later) for data visualization.

## Data Processing & Cleaning

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
## ANALYSIS 
Data Insights & Business Strategy
The Duration Gap: Casual riders average 23 minutes, while Members average 12 minutes. This result fostered an idea that adding a tiered Annual Membership might help because casual riders though tend to ride almost 2x more longer on average still do not want to buy member pass which concludes that they might be riding very infrequently so i decided to have a deeper insight of the ride durations categorized by casual and member and their ride interval (Short, Medium , Long) to verify that actually how many casual riders travel medium or more distance per ride.

The High-Value Segment: While most rides are short, 157,481 Casual trips exceeded 45 minutes (3x more than Members).

Strategic Recommendation: Target these "Extreme" duration casual riders with a Tiered Annual Membership (e.g., a "1,000-minute annual pass") to provide a cheaper alternative to single-ride passes. This can be a good stragetic alternative to convert those casual riders into annual members

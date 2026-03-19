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

Hourly analysis confirms a structural difference in usage: Members peak during 8 AM and 5 PM commute windows, while Casual ridership peaks gradually in the mid-afternoon (2 PM - 4 PM), supporting the transition to a leisure-focused membership tier.

### 📊 Data Visualization & Behavioral Analysis
![Cyclistic User Analysis Dashboard](images/cyclistic_analysis_dashboard.png)

Key Findings:

The Duration Gap: My analysis of trip categories shows that while Annual Members are frequent users, Casual riders dominate the 'Extreme' (>45 min) trip segment. This suggests Casuals use the service for long-duration leisure, while Members use it for utility.

The Commuter Profile: The hourly trend lines confirm this. Annual Members show sharp usage spikes at 8:00 AM and 5:00 PM (the classic 9-to-5 commute). Casual ridership builds slowly, peaking in the afternoon without a morning spike, confirming a leisure-heavy user base.

### 💡 Final Recommendations for the Marketing Team
Based on the 5.4 million rows analyzed, I recommend the following strategy to convert Casual riders to Annual Members:

Target the "Extreme" Riders: Create a marketing campaign specifically for users who take rides longer than 30 minutes. Highlight how much they would save in "overage fees" by switching to a flat annual membership.

Morning Commuter Trial: Since Casual riders are missing from the 8:00 AM peak, offer a "Commuter Starter Pack" (e.g., 5 free morning rides for new members) to build the habit of using bikes for work.

Afternoon Conversion Window: Digital ads and station kiosks should push membership offers between 3:00 PM and 5:00 PM, which is when Casual ridership is at its highest volume.

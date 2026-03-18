-- Check for data quality issues
SELECT 
    (SELECT COUNT(*) FROM Combined_Trip_Data WHERE started_at >= ended_at) AS negative_or_zero_duration,
    (SELECT COUNT(*) FROM Combined_Trip_Data WHERE DATEDIFF(SECOND, started_at, ended_at) < 60) AS less_than_one_minute,
    (SELECT COUNT(*) FROM Combined_Trip_Data WHERE start_station_name IS NULL OR end_station_name IS NULL) AS missing_stations;
-- 1. Add the new columns to the master table
ALTER TABLE Combined_Trip_Data
ADD ride_length_sec INT,
    day_of_week_name NVARCHAR(50),
    month_name NVARCHAR(50);

-- 2. Populate the columns with calculated data
UPDATE Combined_Trip_Data
SET ride_length_sec = DATEDIFF(SECOND, started_at, ended_at),
    day_of_week_name = DATENAME(WEEKDAY, started_at),
    month_name = DATENAME(MONTH, started_at);
-- Remove invalid data to ensure visualization accuracy
DELETE FROM Combined_Trip_Data
WHERE DATEDIFF(SECOND, started_at, ended_at) < 60 
   OR started_at >= ended_at;

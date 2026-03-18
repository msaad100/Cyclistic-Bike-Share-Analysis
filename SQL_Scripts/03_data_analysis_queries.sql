-- 1. Average Ride Length by User Type
SELECT 
    member_casual, 
    AVG(ride_length_min) AS avg_ride_duration
FROM Combined_Trip_Data
GROUP BY member_casual;

-- 2. Ride Category Distribution
SELECT 
    member_casual,
    CASE 
        WHEN ride_length_min <= 10 THEN '0-10 Min (Short)'
        WHEN ride_length_min > 10 AND ride_length_min <= 20 THEN '10-20 Min (Medium)'
        WHEN ride_length_min > 20 AND ride_length_min <= 45 THEN '20-45 Min (Long)'
        ELSE 'Over 45 Min (Extreme)'
    END AS ride_category,
    COUNT(*) AS trip_count
FROM Combined_Trip_Data
GROUP BY member_casual, 
    CASE 
        WHEN ride_length_min <= 10 THEN '0-10 Min (Short)'
        WHEN ride_length_min > 10 AND ride_length_min <= 20 THEN '10-20 Min (Medium)'
        WHEN ride_length_min > 20 AND ride_length_min <= 45 THEN '20-45 Min (Long)'
        ELSE 'Over 45 Min (Extreme)'
    END
ORDER BY member_casual, trip_count DESC;

-- 3. Hourly Trip Volume
SELECT 
    member_casual,
    DATEPART(HOUR, started_at) AS hour_of_day,
    COUNT(*) AS total_trips
FROM Combined_Trip_Data
GROUP BY member_casual, DATEPART(HOUR, started_at)
ORDER BY hour_of_day;

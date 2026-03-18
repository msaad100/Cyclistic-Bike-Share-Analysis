-- Create table for full year analysis
SELECT * INTO Combined_Trip_Data
FROM (
    SELECT * FROM dbo.Trip_Data_Apr
    UNION ALL
    SELECT * FROM dbo.Trip_Data_May
    UNION ALL
    SELECT * FROM dbo.Trip_Data_June
    UNION ALL
    SELECT * FROM dbo.Trip_Data_July
    UNION ALL
    SELECT * FROM dbo.Trip_Data_Aug
    UNION ALL
    SELECT * FROM dbo.Trip_Data_Sep
    UNION ALL
    SELECT * FROM dbo.Trip_Data_Oct
    UNION ALL
    SELECT * FROM dbo.Trip_Data_Nov
    UNION ALL
    SELECT * FROM dbo.Trip_Data_Dec
    UNION ALL
    SELECT * FROM dbo.Trip_Data_Jan
    UNION ALL
    SELECT * FROM dbo.Trip_Data_Feb
    UNION ALL
    SELECT * FROM dbo.Trip_Data_Mar
) AS full_year;

-- Verify total row count
SELECT COUNT(*) FROM Combined_Trip_Data

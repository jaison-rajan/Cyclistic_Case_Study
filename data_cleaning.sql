-- Analyze columns from left to right for cleaning--

--#1 ride_id
--Check that all Ride IDs are the same length:

SELECT
  LENGTH(ride_id) AS ride_id_length,
FROM 
  quick-discovery-402518.cyclistic_project.2022Q1Data
GROUP BY LENGTH(ride_id); -- same ride_id

--#2 rideable_type
--Check that the rideable_type column only contains three values:

SELECT 
  DISTINCT rideable_type AS types_of_rides
FROM
  quick-discovery-402518.cyclistic_project.2022Q1Data
 GROUP BY types_of_rides;

 --There are only three distinct values for Ride Type: classic bikes, electric bikes, and docked bikes. There are no typos or unqualifying values in this column that require cleaning.

 --#3 and #4: started_at and ended_at

 --Check the started_at and ended_at columns for null values:

SELECT
started_at,
ended_at
FROM 
  quick-discovery-402518.cyclistic_project.2022Q1Data
WHERE started_at IS NULL OR ended_at IS NULL;

--There are no null values in either column. No data cleaning is necessary.

--#5, #6, #7, #8: analyze start/end station names and ids for typos and inconsistencies:

SELECT
  DISTINCT(start_station_name) AS unique_start_station,
  COUNT(*) AS number_of_occurrences
FROM 
  quick-discovery-402518.cyclistic_project.2022Q1Data
GROUP BY 
  start_station_name
ORDER BY 
  start_station_name;

SELECT
  DISTINCT(end_station_name) AS unique_end_station,
  COUNT(*) AS number_of_occurrences
FROM 
  quick-discovery-402518.cyclistic_project.2022Q1Data
GROUP BY 
  end_station_name
ORDER BY 
  end_station_name;

SELECT
  DISTINCT(start_station_id) AS unique_start_station_id,
  COUNT(*) AS number_of_occurrences
FROM 
  quick-discovery-402518.cyclistic_project.2022Q1Data
GROUP BY
   start_station_id
ORDER BY 
  start_station_id;

SELECT
  DISTINCT(end_station_id) AS unique_end_station_id,
  count(*) AS number_of_occurrences
FROM 
  quick-discovery-402518.cyclistic_project.2022Q1Data
GROUP BY
  end_station_id
ORDER BY 
  end_station_id;

SELECT 
  COUNT(DISTINCT(start_station_name)) AS unqique_startname,
  COUNT(DISTINCT(end_station_name)) AS unique_endname,
  COUNT(DISTINCT(start_station_id)) AS unique_startid,
  COUNT(DISTINCT(end_station_id)) AS unique_endid
FROM quick-discovery-402518.cyclistic_project.2022Q1Data;

--Notes: Spacing and formatting is consistent for station names. No typos/extra spaces need to be corrected. There are a significant number of null values, but these will not be removed as it is possible for a docked bike to start and end its ride away from a station.

--#8, #9, #10, #11: Verify that start and ending latitude and longitudes are the correct format. Duplicates are allowed.

SELECT
  start_lat,
  start_lng,
  end_lat,
  end_lng
 FROM
  quick-discovery-402518.cyclistic_project.2022Q1Data
LIMIT 1000;

 --Check for null values in latitude or longitude fields:

SELECT
  COUNT(*)
FROM 
  quick-discovery-402518.cyclistic_project.2022Q1Data
WHERE
  start_lat IS NULL
  OR end_lat IS NULL
  OR start_lng IS NULL
  OR end_lng IS NULL;



--Remove any values of latitude that fall outside the range of -90 to 90. Remove any values of longitude that fall outside the range of -180 and 180.

 SELECT
  start_lat,
  end_lat,
  start_lng,
  end_lng
FROM 
  quick-discovery-402518.cyclistic_project.2022Q1Data
WHERE 
  start_lat < 90 AND start_lat > -90 AND start_lat IS NOT NULL
  AND end_lat < 90 AND end_lat > -90 AND end_lat IS NOT NULL
  AND start_lng < 180 AND start_lng > -180 AND start_lng IS NOT NULL
  AND end_lng < 180 AND end_lng > -180 AND end_lng IS NOT NULL;

--#12 member_casual
--Check member_casual column to ensure there are only two values: member or casual.

SELECT
  DISTINCT(member_casual)  AS unique_member_types
FROM 
  quick-discovery-402518.cyclistic_project.2022Q1Data
GROUP BY
  member_casual;

--Only two values appear in this column. No data cleaning necessary.
--Create a new column by calculating difference between start and end time, called ride_length (ride_length is calculated in seconds):

SELECT
  timestamp_diff (ended_at, started_at, SECOND) AS ride_length
FROM 
  quick-discovery-402518.cyclistic_project.2022Q1Data;
--Create new column for the day of the week on which the ride took place:
SELECT
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 1 THEN 'Sunday'
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 2 THEN 'Monday'
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 3 THEN 'Tuesday'
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 4 THEN 'Wednesday'
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 5 THEN 'Thursday'
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 6 THEN 'Friday'
    ELSE'Saturday'
    END AS day_of_week
FROM 
  quick-discovery-402518.cyclistic_project.2022Q1Data;

--Create a new column for the month in which the ride took place:
SELECT
  CASE
    WHEN EXTRACT(MONTH FROM started_at) = 1 THEN 'January'
    WHEN EXTRACT(MONTH FROM started_at) = 2 THEN 'February'
    WHEN EXTRACT(MONTH FROM started_at) = 3 THEN 'March'
    WHEN EXTRACT(MONTH FROM started_at) = 4 THEN 'April'
    WHEN EXTRACT(MONTH FROM started_at) = 5 THEN 'May'
    WHEN EXTRACT(MONTH FROM started_at) = 6 THEN 'June'
    WHEN EXTRACT(MONTH FROM started_at) = 7 THEN 'July'
    WHEN EXTRACT(MONTH FROM started_at) = 8 THEN 'August'
    WHEN EXTRACT(MONTH FROM started_at) = 9 THEN 'September'
    WHEN EXTRACT(MONTH FROM started_at) = 10 THEN 'October'
    WHEN EXTRACT(MONTH FROM started_at) = 11 THEN 'November'
    ELSE'December'
    END AS month
FROM
  quick-discovery-402518.cyclistic_project.2022Q1Data;

--Create a new column for the year in which the ride took place:
SELECT
  EXTRACT (YEAR FROM started_at) AS year
FROM 
  quick-discovery-402518.cyclistic_project.2022Q1Data;

--Create new table with the cleaned data, called Data_For_Analysis:

CREATE TABLE IF NOT EXISTS cyclistic_project.DataForAnalysis
AS
SELECT
  DISTINCT ride_id,
  rideable_type,
  started_at,
  ended_at,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  end_lat,
  start_lng,
  end_lng,
  member_casual,
  timestamp_diff (ended_at, started_at, SECOND) AS ride_length,
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 1 THEN 'Sunday'
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 2 THEN 'Monday'
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 3 THEN 'Tuesday'
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 4 THEN 'Wednesday'
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 5 THEN 'Thursday'
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 6 THEN 'Friday'
    ELSE'Saturday'
    END AS day_of_week,
  CASE
    WHEN EXTRACT(MONTH FROM started_at) = 1 THEN 'January'
    WHEN EXTRACT(MONTH FROM started_at) = 2 THEN 'February'
    WHEN EXTRACT(MONTH FROM started_at) = 3 THEN 'March'
    WHEN EXTRACT(MONTH FROM started_at) = 4 THEN 'April'
    WHEN EXTRACT(MONTH FROM started_at) = 5 THEN 'May'
    WHEN EXTRACT(MONTH FROM started_at) = 6 THEN 'June'
    WHEN EXTRACT(MONTH FROM started_at) = 7 THEN 'July'
    WHEN EXTRACT(MONTH FROM started_at) = 8 THEN 'August'
    WHEN EXTRACT(MONTH FROM started_at) = 9 THEN 'September'
    WHEN EXTRACT(MONTH FROM started_at) = 10 THEN 'October'
    WHEN EXTRACT(MONTH FROM started_at) = 11 THEN 'November'
    ELSE'December'
    END AS month,
    EXTRACT (YEAR FROM started_at) AS year
FROM 
  quick-discovery-402518.cyclistic_project.2022Q1Data
WHERE 
  LENGTH(ride_id) = 16 AND ride_id IS NOT NULL
  AND start_lat < 90 AND start_lat > -90 AND start_lat IS NOT NULL
  AND end_lat < 90 AND end_lat > -90 AND end_lat IS NOT NULL
  AND start_lng < 180 AND start_lng > -180 AND start_lng IS NOT NULL
  AND end_lng < 180 AND end_lng > -180 AND end_lng IS NOT NULL
  ORDER BY started_at
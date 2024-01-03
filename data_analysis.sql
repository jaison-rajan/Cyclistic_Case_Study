--Complete analysis from Data_For_Analysis table

--How many Cyclistic users are casual riders vs subscribers?

SELECT
  DISTINCT member_casual,
  COUNT (member_casual) AS numb_of_members,
FROM 
  quick-discovery-402518.cyclistic_project.DataForAnalysis
GROUP BY 
  member_casual;

-- Of the 873,924 rides, 255589 were casual users and 618335 pay for annual membership 

--What type of bikes do casual users prefer?

SELECT
  rideable_type,
  COUNT(rideable_type) AS numb_of_rides
FROM 
  quick-discovery-402518.cyclistic_project.DataForAnalysis
WHERE 
  member_casual = 'casual'
GROUP BY 
  rideable_type
ORDER BY 
  numb_of_rides DESC;

--Casual users most often use electric bikes.

--What type of bikes do annual subscribers prefer?
SELECT
  rideable_type,
  COUNT(rideable_type) AS numb_of_rides
FROM 
  quick-discovery-402518.cyclistic_project.DataForAnalysis
WHERE 
  member_casual = 'member'
GROUP BY 
  rideable_type
ORDER BY 
  numb_of_rides DESC;
--Annual subscribers most often use classic bikes. They do not use docked bikes.

--On what day of the week do casual riders most use Cyclistic?
SELECT
  day_of_week,
  COUNT (day_of_week) AS numb_of_rides,
  AVG(ride_length) AS avg_ride_length
FROM 
  quick-discovery-402518.cyclistic_project.DataForAnalysis
WHERE 
  member_casual = 'casual'
GROUP BY 
  day_of_week
ORDER BY 
  numb_of_rides DESC;

--Casual riders use Cyclistic most often on Saturdays, followed by Sunday and Monday. The least popular day is Friday

--On what day of the week do casual users have the longest ride times?

SELECT
  day_of_week,
  COUNT (day_of_week) AS numb_of_rides,
  AVG(ride_length) AS avg_ride_length
FROM 
  quick-discovery-402518.cyclistic_project.DataForAnalysis
WHERE 
  member_casual = 'casual'
GROUP BY 
  day_of_week
ORDER BY 
  avg_ride_length DESC;

--Casual riders have the longest average ride time on Saturday, followed by Sunday and Mondays. The shortest ride times take place on Friday.


--On what day of the week do annual subscribers most use Cyclistic?
SELECT
  day_of_week,
  COUNT (day_of_week) AS numb_of_rides,
  AVG(ride_length) AS avg_ride_length
FROM 
  quick-discovery-402518.cyclistic_project.DataForAnalysis
WHERE 
  member_casual = 'member'
GROUP BY 
  day_of_week
ORDER BY
   numb_of_rides DESC;

--Annual subscribers most often use Cyclistic on Tuesday, followed by thursday and Wednesday. The least popular day is Sunday.


--On what day of the week do annual subscribers have the longest ride times?
SELECT
  day_of_week,
  COUNT (day_of_week) AS numb_of_rides,
  AVG(ride_length) AS avg_ride_length
FROM 
  quick-discovery-402518.cyclistic_project.DataForAnalysis
WHERE 
  member_casual = 'member'
GROUP BY 
  day_of_week
ORDER BY 
  avg_ride_length DESC;

--Annual subscribers have the longest ride times on Saturday, followed by Sunday and Monday. The shortest rides take place on Tuesday

--What time of year is the most popular for all Cyclistic members?
SELECT
  month, 
  COUNT(month) AS numb_of_rides,
  AVG(ride_length) AS avg_ride_length
FROM 
  quick-discovery-402518.cyclistic_project.DataForAnalysis
GROUP BY 
  month
ORDER BY 
  numb_of_rides DESC;

--Across all member types, the most popular month is April. The least popular months is January

--Does this vary between casual users and annual subscribers?
SELECT
  month, 
  COUNT(month) AS numb_of_rides,
  AVG(ride_length) AS avg_ride_length
FROM 
  quick-discovery-402518.cyclistic_project.DataForAnalysis
WHERE 
  member_casual = 'casual'
GROUP BY 
  month
ORDER BY 
  numb_of_rides DESC;

SELECT
  month, 
  COUNT(month) AS numb_of_rides,
  AVG(ride_length) AS avg_ride_length
FROM 
  quick-discovery-402518.cyclistic_project.DataForAnalysis
WHERE 
  member_casual = 'member'
GROUP BY 
  month
ORDER BY 
  numb_of_rides DESC;

--Both prefer most in April and least in Janaury

--At what time of year do the longest rides take place?
SELECT
  month, 
  COUNT(month) AS numb_of_rides,
  AVG(ride_length) AS avg_ride_length
FROM 
  quick-discovery-402518.cyclistic_project.DataForAnalysis
GROUP BY 
  month
ORDER BY 
  avg_ride_length DESC;

--Across all member types, the longest rides take place in March. The shortest average rides take place in Feburuary 

--Does this vary between casual members and annual subscribers?
--At what time of year do the longest rides take place?
SELECT
  month, 
  COUNT(month) AS numb_of_rides,
  AVG(ride_length) AS avg_ride_length
FROM 
  quick-discovery-402518.cyclistic_project.DataForAnalysis
WHERE 
  member_casual = 'casual'
GROUP BY
   month
ORDER BY 
  avg_ride_length DESC;

--Casual members have the longest rides in March. They have the shortest rides in February

SELECT
  month, 
  COUNT(month) AS numb_of_rides,
  AVG(ride_length) AS avg_ride_length
FROM 
  quick-discovery-402518.cyclistic_project.DataForAnalysis
WHERE 
  member_casual = 'member'
GROUP BY 
  month
ORDER BY 
  avg_ride_length DESC

--Annual subscribers have the longest ride length in March. They have the shortest rides in  February.
--Complete analysis from Data_For_Analysis table

--How many Cyclistic users are casual riders vs subscribers?

SELECT
  DISTINCT member_casual,
  COUNT (member_casual) AS numb_of_members,
FROM 
  quick-discovery-402518.cyclistic_project.DataForAnalysis
GROUP BY 
  member_casual;

-- Of the 5.38 million rides, 62 %  were annual subscribers and 38 % were casual riders

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

--Casual users most often use docked bikes.

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

--Casual riders use Cyclistic most often on Saturdays, followed by Sunday. The least popular day is Monday.


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

--Annual subscribers most often use Cyclistic on Wednesday, Thursday and Tuesday.. The least popular day is Sunday.


--What time of year is the most popular for casual users and annual subscribers?
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

--Both prefer most in July. But when it comes to leat popularity, its January for Casual Riders and December for Annual Subscribers.

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

--Across all member types, the longest rides take place in July. 

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

--Casual members have the longest rides in July. They have the shortest rides in December.

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

--Annual subscribers have the longest ride length in July. They have the shortest rides in  March and January.

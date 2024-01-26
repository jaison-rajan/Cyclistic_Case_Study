--Create 2022Q1Data Table by combining data from July 2022 to June 2023

CREATE TABLE IF NOT EXISTS cyclistic_project.2022_2023Data 
AS
SELECT * FROM quick-discovery-402518.cyclistic_project.Jul2022
UNION ALL
SELECT * FROM quick-discovery-402518.cyclistic_project.Aug2022
UNION ALL
SELECT * FROM quick-discovery-402518.cyclistic_project.Sep2022
UNION ALL
SELECT * FROM quick-discovery-402518.cyclistic_project.Oct2022
UNION ALL
SELECT * FROM quick-discovery-402518.cyclistic_project.Nov2022
UNION ALL
SELECT * FROM quick-discovery-402518.cyclistic_project.Dec2022
UNION ALL
SELECT * FROM quick-discovery-402518.cyclistic_project.Jan2023
UNION ALL
SELECT * FROM quick-discovery-402518.cyclistic_project.Feb2023
UNION ALL
SELECT * FROM quick-discovery-402518.cyclistic_project.Mar2023
UNION ALL
SELECT * FROM quick-discovery-402518.cyclistic_project.Apr2023
UNION ALL
SELECT * FROM quick-discovery-402518.cyclistic_project.May2023
UNION ALL
SELECT * FROM quick-discovery-402518.cyclistic_project.Jun2023


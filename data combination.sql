--Create 2022Q1Data Table by combining data from January to April

CREATE TABLE IF NOT EXISTS cyclistic_project.2022Q1Data 
AS
SELECT * FROM quick-discovery-402518.cyclistic_project.JanData
UNION ALL
SELECT * FROM quick-discovery-402518.cyclistic_project.FebData
UNION ALL
SELECT * FROM quick-discovery-402518.cyclistic_project.MarData
UNION ALL
SELECT * FROM quick-discovery-402518.cyclistic_project.AprData
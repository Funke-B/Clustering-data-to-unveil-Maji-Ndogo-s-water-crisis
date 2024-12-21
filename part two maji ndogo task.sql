SELECT * FROM md_water_services.data_dictionary;
-- Cleaning our data
SELECT *
FROM employee;
-- Replace the space with a full stop, lowercase letters to get email address
SELECT
LOWER(REPLACE(employee_name, ' ','.'))
FROM
employee;
-- We then use CONCAT() to add the rest of the email address:
SELECT
CONCAT(LOWER(REPLACE(employee_name, ' ','.')),'@ndogowater.gov') AS New_email
FROM
employee;

-- Update the email column with the newly formed email address 
UPDATE Employee
SET email = CONCAT(LOWER(REPLACE(employee_name, ' ','.')),'@ndogowater.gov');
SET sql_safe_updates = 0;

SELECT 
length(phone_number)
FROM employee;

-- To trim down the number of strings in the phone no. column and update 

SELECT 
TRIM(phone_number)
FROM employee;

SELECT 
Length (TRIM(phone_number))
FROM employee;

UPDATE employee
SET phone_number = TRIM(phone_number);

-- Honouring the workers
SELECT * 
from employee;

SELECT town_name,
COUNT(town_name) AS no_of_employee
FROM employee
GROUP BY town_name;

-- To get employee who visited the most location and the top 3
SELECT *
FROM visits;

SELECT assigned_employee_id,
COUNT(visit_count) AS no_of_visit
FROM visits
GROUP BY assigned_employee_id
ORDER BY no_of_visit DESC
LIMIT 3;

-- Checking for the details of the employees with the IDs
SELECT *
FROM employee
WHERE assigned_employee_id IN (1, 30, 34); 

-- Analysing locations. grouping per something

SELECT *
FROM location;

SELECT town_name, COUNT(town_name) AS record_per_town
FROM location
GROUP BY town_name
ORDER BY record_per_town DESC;

SELECT province_name, COUNT(province_name) AS province_per_town
FROM location
GROUP BY province_name
ORDER BY province_per_town DESC;

-- province per town

SELECT province_name, Town_name,COUNT(town_name) AS record_per_town
FROM location
GROUP BY province_name, town_name
ORDER BY province_name, record_per_town DESC;

SELECT location_type, COUNT(location_type) AS record_per_time
FROM location
GROUP BY location_type;

SELECT ROUND(23740 / (15910 + 23740) * 100) AS percentage;

-- Diving into the sources

SELECT * 
FROM water_source;

-- How many people did we survey in total?

SELECT SUM(number_of_people_served) AS No_of_people_surveyed
FROM water_source;

-- How many wells, taps and rivers are there?
SELECT type_of_water_source, COUNT(source_id) AS no_of_sources
FROM water_source
GROUP BY type_of_water_source
ORDER BY no_of_sources desc ;

-- How many people share particular types of water sources on average?

SELECT type_of_water_source, ROUND(AVG(number_of_people_served)) AS average_people
FROM water_source
GROUP BY type_of_water_source
ORDER BY average_people DESC;

-- How many people are getting water from each type of source?
SELECT type_of_water_source, SUM(number_of_people_served) AS total_people_served
FROM water_source
GROUP BY type_of_water_source
ORDER BY total_people_served DESC;

SELECT type_of_water_source, ROUND((SUM(number_of_people_served)/27628140 )* 100 )AS pct_people_served
FROM water_source
GROUP BY type_of_water_source
ORDER BY pct_people_served DESC;

-- Start of a solution

SELECT type_of_water_source, 
SUM(number_of_people_served) AS total_people_served,
RANK() OVER ( ORDER BY SUM(number_of_people_served)DESC) AS RANKA
FROM water_source
GROUP BY type_of_water_source
ORDER BY total_people_served;

SELECT source_id,type_of_water_source,
SUM(number_of_people_served) AS total_people_served,
RANK() OVER ( ORDER BY SUM(number_of_people_served)DESC) AS RANKA
FROM water_source
WHERE type_of_water_source <> "tap_in_home"
GROUP BY source_id 
ORDER BY total_people_served DESC ;











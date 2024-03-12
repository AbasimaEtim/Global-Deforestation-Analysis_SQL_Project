--Created a database named SQL_PROJECT
CREATE DATABASE SQL_PROJECT;
--used the database
USE SQL_PROJECT;

--Retrive data from all the tables in the database
SELECT * FROM [dbo].[Forest_Area];
SELECT * FROM [dbo].[Land_Area];
SELECT * FROM [dbo].[Region];

----Retrive data from all the columns in forest_area to know if there are Null values
SELECT *FROM [dbo].[Forest_Area]
WHERE FOREST_AREA_SQKM IS  NULL;

SELECT *FROM [dbo].[Forest_Area]
WHERE country_code  IS  NULL;

SELECT *FROM [dbo].[Forest_Area]
WHERE country_code IS  NULL;

---Found Nulls In FOREST_AREA_SQKM. Replaced the Null values with average(In the forest_area_sqkm)
SELECT AVG(FOREST_AREA_SQKM FROM FOREST_AREA;

UPDATE FOREST_AREA SET FOREST_AREA_SQKM =
CASE  WHEN FOREST_AREA_SQKM  IS NULL THEN 391051.83952495
ELSE FOREST_AREA_SQKM
END;

----Retrive data from all the columns in land_area to know if there are Null values
SELECT * FROM [dbo].[Land_Area]
WHERE country_code IS NULL;

--Found Null values in total_area_sq column
SELECT * FROM [dbo].[Land_Area]
WHERE total_area_sq_mi IS NULL;

--Checked the AVG of total_area_sq_mi
SELECT AVG(total_area_sq_mi) FROM [dbo].[Land_Area];

--Replaced Null values with AVG
UPDATE Land_Area SET total_area_sq_mi =
CASE  WHEN total_area_sq_mi  IS NULL THEN 457095.353337975
ELSE total_area_sq_mi
END;

SELECT * FROM [dbo].[Land_Area]
WHERE total_area_sq_mi = 457095.353337975;



--Found Null in income_group in Region table
SELECT * FROM [dbo].[Region]
WHERE income_group = 'Null';

--Replaced the Null with Unknown
UPDATE Region SET income_group =
CASE  WHEN income_group = 'NULL' THEN 'Unknown'
ELSE income_group
END;

SELECT * FROM [dbo].[Region]
WHERE income_group = 'unknown';

--Joined all the tables
SELECT * FROM Land_Area JOIN FOREST_AREA ON Land_Area.COUNTRY_CODE = Forest_Area.country_code
JOIN Region ON Land_Area.country_code = Region.country_code;



--Question 1: What are the total number of countries involved in deforestation? 
SELECT DISTINCT COUNT(COUNTRY_NAME) no_of_countries 
FROM Region;
SELECT DISTINCT country_name 
FROM Region

-- Question 2: Show the income groups of countries having total area ranging from 75,000 to 150,000 square meter?
SELECT income_group, Region.country_name, ROUND(total_area_sq_mi, 0) 
	FROM Land_Area 
	JOIN Region ON Land_Area.country_code = Region.country_code
	WHERE total_area_sq_mi BETWEEN 75000 AND 150000;



/*Question 3: Calculate average area in square miles for countries in the 'upper middle income region'. 
Compare the result with the rest of the income categories.*/ 

SELECT income_group, ROUND(AVG(total_area_sq_mi), 0) AS AVG_total 
FROM Land_Area
JOIN  Region ON Land_Area.country_code = Region.country_code
GROUP BY  income_group
HAVING income_group IN ('Upper middle income','High income', 'Low income', 'Lower middle income')
ORDER BY AVG_total DESC;

/* Question 4: Determine the total forest area in square km for countries in the 'high income' group.
Compare result with the rest of the income categories.*/
SELECT income_group , ROUND(SUM(FOREST_AREA_SQKM),0) total_forest_area_sqkm FROM Forest_Area 
JOIN Region ON Forest_Area.country_code = Region.country_code
GROUP BY income_group 
HAVING income_group  IN ('Upper middle income','High income', 'Low income', 'Lower middle income');

-- Question 5: Show countries from each region(continent) having the highest total forest areas
SELECT *
FROM 
	(
	SELECT Region.country_name, REGION, ROUND(SUM(forest_area_sqkm), 0) AS total_forest_area_sqkm ,
	DENSE_RANK () OVER (PARTITION BY REGION ORDER BY SUM(forest_area_sqkm)DESC) AS HIGHEST_FOREST_RANK
	FROM Forest_Area JOIN Region ON forest_area.country_code = Region.country_code
	GROUP BY region, Region.country_name
	) RANKED_FOREST	
WHERE HIGHEST_FOREST_RANK = 1
ORDER BY total_forest_area_sqkm DESC



-- ADDITIONAL ANALYSIS 1: Show countries from each region(continent) having the lowest total forest areas. USING CTE
WITH FOREST_RANK AS (SELECT Region.country_name, region, ROUND(SUM(forest_area_sqkm), 0) AS TOTAL_FOREST_AREA, 
	DENSE_RANK() OVER(PARTITION BY region ORDER BY SUM(forest_area_sqkm)) AS LOWEST_FOREST_RANK
    FROM forest_area 
	JOIN Region ON Forest_Area.country_name = Region.country_name 
    GROUP BY Region.country_name, region)
	SELECT *
FROM FOREST_RANK
WHERE LOWEST_FOREST_RANK = 1
ORDER BY TOTAL_FOREST_AREA ;



--2: What are the top 5 countries with the largest forest areas IN 2016?
SELECT TOP 5 Region.country_name, SUM(forest_area_sqkm) largest_forest_areas, FROM Forest_Area
JOIN Region ON Forest_Area.country_code = Region.country_code
GROUP BY  Region.country_name ,
--HAVING YEAR = '2016'
ORDER BY largest_forest_areas DESC








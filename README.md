# Global Deforestation Analysis

![](forest.jpg)

## Introduction 
This SQL project tackles global deforestation trends and aims to uncover valuable environmental insights using advanced SQL techniques.
I will be working with three separate CSV datasets: Forest_Area, Land_Area, and Regions, each containing three relevant columns. By analyzing these datasets through SQL queries, I will be identifying critical patterns and geographical trends in deforestation.
This information will be instrumental in making informed decisions for sustainable forestry practices and overall environmental management.

## Problem Questions: 
![](problemStatment.png) 
----

## Skills  and Concepts Demonstrated
#### Demonstrated skills by utilizing the following SQL syntax and functions
- CREATE, and USE DATABASE
- SELECT, FROM, WHERE
- UPDATE, ROUND, SET
- GROUP BY, HAVING, ORDER BY
- AVG, COUNT, DISTINCT, SUM
- NULL, IS NULL, ON
- AS, JOIN
- DENSE RANK, OVER, PARTITION BY
- COMMON TABLES EXPRESSION (CTE), SUBQUERIES

## Data Wangling Procedure
1. ### Creating the Project's Database
- I created the project's database and named it 'SQL_PROJECT' and ensured the database was selected.

*CODE USED:*
```
CREATE DATABASE SQL_PROJECT;
USE SQL_PROJECT;
```

![](Created_database.png)
----

2. ### Imported Dataset
- Three different .csv files named "Forest_Area", "Land_Area", and "Regions" were imported.
![](importing_files.png)
-----
3. ### Retrive Data from the Datasets
*CODE USED:*
   ```
SELECT * FROM [dbo].[Forest_Area];
SELECT * FROM [dbo].[Land_Area];
SELECT * FROM [dbo].[Region];
```
![](view_the_files.png)

4. ### CHECKING FOR NULL VALUES
- Checking for NULL values in the forest_area and land_area tables, specifically the numerical columns. 
- In Forest_Area, null values were found in "FOREST_AREA_SQKM"
- In Land_Area, null values were found in "total_area_sq_mi"
*CODE USED:*
```
SELECT *FROM [dbo].[Forest_Area]
WHERE FOREST_AREA_SQKM IS  NULL;
```
![](nulls.png)

*CODE USED:*
```
SELECT * FROM [dbo].[Land_Area]
WHERE total_area_sq_mi IS NULL;
```
![](land_area_nulls.png)

5. ### REPLACING NULL VALUES
-  I calculated the average forest and land areas and used the average value to replace the NULL values in the columns. I ensured that the code has executed correctly by checking the columns again
-  

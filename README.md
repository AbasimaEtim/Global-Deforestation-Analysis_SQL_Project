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
- Checking for NULL values in the forest_area and land_area tables
- In Forest_Area, null values were found in "FOREST_AREA_SQKM"
- In Land_Area, null values were found in "total_area_sq_mi"
- IN Region, null values were found in income_group and was replaced with 'Unknown'

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

*CODE USED:*
```
SELECT * FROM [dbo].[Region]
WHERE income_group = 'Null';

UPDATE Region SET income_group =
CASE  WHEN income_group = 'NULL' THEN 'Unknown'
ELSE income_group
END;

SELECT * FROM [dbo].[Region]
WHERE income_group = 'unknown';

```
![](Region_Nulls.png)

5. ### REPLACING NULL VALUES
- I calculated the average FOREST_AREA_SQKM for FOREST_AREA and used the average value to replace the NULL values in the column
- I calculated the average total_area_sq_mi for LAND_AREA and used the average value to replace the NULL values in the column
- - IN Region, null values were found in income_group and was replaced with 'Unknown' (This is show in no. 4)
- I ensured that the code has executed correctly by checking the columns again

*CODE USED:*
```
UPDATE FOREST_AREA SET FOREST_AREA_SQKM =
CASE  WHEN FOREST_AREA_SQKM  IS NULL THEN 391051.83952495
ELSE FOREST_AREA_SQKM
END;
```

![](Replaced_Nulls_forest.png)

*CODE USED:*
```
UPDATE Land_Area SET total_area_sq_mi =
CASE  WHEN total_area_sq_mi  IS NULL THEN 457095.353337975
ELSE total_area_sq_mi
END;
```

![](Nulls_from_land_replaced.png)

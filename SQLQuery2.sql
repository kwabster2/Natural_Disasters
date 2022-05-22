----List of Natural Disasters-------

Select * from NaturalDisasters 

----Decade mostly affected by natural disasters---

Select Year, Number_of_affected FROM NaturalDisasters WHERE Year= 
(Select NULLIF(MAX(Number_of_affected),0) FROM NaturalDisasters)

---List the Year that was mostly affected by natural Disasters----
 
 Select Year, SUM(Total_affected) AS total_Affected FROM NaturalDisasters GROUP BY Year
ORDER BY total_Affected DESC

----List of Countries Mostly affect by natural disaster-----

SELECT Entity, SUM(Total_affected) AS Sum_of_affected FROM NaturalDisasters
WHERE Entity NOT LIKE '%Asia%' AND Entity NOT LIKE '%income%' 
AND Entity NOT LIKE '%Africa%' 
AND Entity NOT LIKE '%America%'
AND Entity NOT LIKE '%Europe%'
AND Entity NOT LIKE '%World%'
GROUP BY Entity
ORDER BY Sum_of_affected DESC

-------List of countries affected from maximum number of injuries to the Least---
Select Entity, SUM(Number_of_Injured) AS Sum_of_injuries FROM NaturalDisasters 
WHERE Entity NOT LIKE '%Asia%' AND Entity NOT LIKE '%income%' 
AND Entity NOT LIKE '%Africa%' 
AND Entity NOT LIKE '%America%'
AND Entity NOT LIKE '%Europe%'
AND Entity NOT LIKE '%World%'
GROUP BY Entity 
ORDER BY Sum_of_injuries desc

-----Top 10 Countries affected the most by injuries as a percentage ---

Select DISTINCT(Entity), Number_of_injured, SUM([Number_of_Injured ])/NULLIF(SUM(Total_affected),0)
from NaturalDisasters AS percentage    
WHERE Entity NOT LIKE '%Asia%' AND Entity NOT LIKE '%income%' 
AND Entity NOT LIKE '%Africa%' 
AND Entity NOT LIKE '%America%'
AND Entity NOT LIKE '%Europe%'
AND Entity NOT LIKE '%World%'
GROUP BY Entity, Number_of_injured 
ORDER BY Number_of_injured DESC

-----The decade affected the most by natural disasters------

With MaximumNumber AS (SELECT Year, Total_affected, MAX(Total_affected) FROM NaturalDisasters)

SELECT Max(Sum_Affected) From MaximumNumber
 

 ----the total number affected by natural disasters for each coressonding decade---
 
 SELECT DISTINCT Year AS decade, SUM(Total_affected) OVER (Partition BY YEAR) 
 FROM NaturalDisasters 

---Find each decade affected by Earthquakes as a Percentage-----------------

SELECT Total_affected, SUM(Number_injured_from_earthquakes)/NULLIF(SUM(Total_affected),0) 
FROM NaturalDisasters JOIN Types_of_NaturalDisasters ON NaturalDisasters.year = Types_of_NaturalDisasters.year 











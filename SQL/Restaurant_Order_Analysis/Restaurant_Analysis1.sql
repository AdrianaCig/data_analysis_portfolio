# Getting familiar with tables Orders and Restaurants

SELECT *
FROM `shaped-pride-383416.Restaurant_orders.Orders`


SELECT *
FROM `shaped-pride-383416.Restaurant_orders.Restaurants`

# 1. What restaurant received the most orders?

SELECT count(Order_ID), RestaurantName
FROM `shaped-pride-383416.Restaurant_orders.Orders` AS ord
JOIN `shaped-pride-383416.Restaurant_orders.Restaurants` AS rest
  ON ord.Restaurant_ID = rest.RestaurantID
GROUP BY RestaurantName
ORDER BY count(Order_ID) DESC

# Answer: Both Ellora and The Cave Hotel (32)

# 2. What restaurant saw most sales?

SELECT sum(Order_Amount), RestaurantName
FROM `shaped-pride-383416.Restaurant_orders.Orders` AS ord
JOIN `shaped-pride-383416.Restaurant_orders.Restaurants` AS rest
  ON ord.Restaurant_ID = rest.RestaurantID
GROUP BY RestaurantName
ORDER BY sum(Order_Amount) DESC

# Answer: Veer Restaurant

# 3. What customer ordered the most?

SELECT count(Order_ID), Customer_Name
FROM `shaped-pride-383416.Restaurant_orders.Orders` AS ord
JOIN `shaped-pride-383416.Restaurant_orders.Restaurants` AS rest
  ON ord.Restaurant_ID = rest.RestaurantID
GROUP BY Customer_Name
ORDER BY count(Order_ID) DESC

# Answer: Srini

# 4. What is the most popular cuisine?

SELECT count(Order_ID), Cuisine
FROM `shaped-pride-383416.Restaurant_orders.Orders` AS ord
JOIN `shaped-pride-383416.Restaurant_orders.Restaurants` AS rest
  ON ord.Restaurant_ID = rest.RestaurantID
GROUP BY Cuisine
ORDER BY count(Order_ID) DESC

# Answer: Both Chinese and North Indian

# 5. What zone has the most sales?

SELECT sum(Order_Amount), Zone
FROM `shaped-pride-383416.Restaurant_orders.Orders` AS ord
JOIN `shaped-pride-383416.Restaurant_orders.Restaurants` AS rest
  ON ord.Restaurant_ID = rest.RestaurantID
GROUP BY Zone
ORDER BY sum(Order_Amount) DESC

# Answer: Zone D

# 6. At what time during the day do customers order the most?

SELECT Period, COUNT(*) AS Count
FROM (
  SELECT SUBSTR(Order_Date, 10, 5) AS Time,
    CASE
      WHEN SUBSTR(Order_Date, 10, 5) < '10:01' THEN 'Morning'
      WHEN SUBSTR(Order_Date, 10, 5) < '15:01' THEN 'Lunchtime'
      WHEN SUBSTR(Order_Date, 10, 5) < '19:01' THEN 'Afternoon'
      ELSE 'Night'
    END AS Period
  FROM `shaped-pride-383416.Restaurant_orders.Orders`
) AS subquery
GROUP BY Period

# Answer: Customers order mostly during the lunchtime - from 10:00 to 15:00.
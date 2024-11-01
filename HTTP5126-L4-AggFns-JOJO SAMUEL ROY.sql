-- SAMUEL ROY JOJO	LAB 4 AGGREGATE FUNCTIONS
-- Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 5; your query for question 1B should go on line 7...
-- 1 
-- A
6
-- B
123
-- C
71.8500
-- D
684

-- 2
-- A
SELECT role, COUNT(*) AS Employee_Count FROM employees GROUP BY role;
-- B
SELECT 'Mammals' AS Category, COUNT(*) AS Item_Count FROM stock_items WHERE category <> 'Piscine';
-- C
SELECT category, AVG(price) AS Average_Price FROM stock_items WHERE inventory > 0 GROUP BY category;

-- 3
-- A
SELECT category AS Species, SUM(inventory) AS In_Stock FROM stock_items GROUP BY category ORDER BY In_Stock ASC;
-- B
SELECT category AS Species, SUM(inventory) AS Inventory_Total, AVG(price) AS Average_Price FROM stock_items GROUP BY category HAVING Inventory_Total < 100 AND Average_Price < 100;

-- 4
SELECT item AS Product,   CONCAT('$', price) AS Price, inventory AS Stock_Remaining, category AS Species, (price * inventory) AS Potential_Earnings FROM stock_items ORDER BY Potential_Earnings DESC;
-- Samuel Roy Jojo LAB 5 MULTIPLE TABLES
--  Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 5; your query for question 1B should go on line 7...
--  1 
-- A 
SELECT * FROM sales WHERE item = 1014;
-- B 
SELECT s.date, si.item FROM sales s JOIN stock_items si ON s.item = si.id WHERE si.id = 1014;

--  2
-- A 
SELECT * FROM sales WHERE employee = 111;
-- B
SELECT s.date, e.first_name, e.last_name, s.item FROM sales s JOIN employees e ON s.employee = e.id WHERE e.id = 111;

--  3
-- A
SELECT s.date, s.item, e.first_name FROM sales s JOIN employees e ON s.employee = e.id WHERE s.date BETWEEN '2024-09-12' AND '2024-09-18';
-- B
SELECT e.first_name, e.last_name, COUNT(s.id) AS sales_count FROM sales s JOIN employees e ON s.employee = e.id GROUP BY e.first_name, e.last_name ORDER BY sales_count DESC;

--  4
-- A
WITH MostSales AS (SELECT employee, COUNT(id) AS total_sales FROM sales GROUP BY employee ORDER BY total_sales DESC LIMIT 1)
SELECT s.date, si.item, si.price, si.category, e.first_name FROM sales s LEFT JOIN stock_items si ON s.item = si.id LEFT JOIN employees e ON s.employee = e.id WHERE s.employee IN (SELECT employee FROM MostSales);
-- B
SELECT si.id AS item_id, si.item, si.price, si.category, COUNT(s.id) AS times_sold FROM stock_items si LEFT JOIN sales s ON si.id = s.item GROUP BY si.id ORDER BY si.id;

--  5
-- A Show each sale with the employee's name, including sales that do not have employee information.
-- B
SELECT s.date, e.first_name, e.last_name, si.item FROM sales s RIGHT JOIN employees e ON s.employee = e.id RIGHT JOIN stock_items si ON s.item = si.id ORDER BY s.date;
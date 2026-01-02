DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto(
	sku_id SERIAL PRIMARY KEY,
	category VARCHAR(120),
	name VARCHAR(150) NOT NULL,
	mrp NUMERIC(8,2),
	discountPercent NUMERIC(5,2),
	vailableQuantity INTEGER,
	discountedSellingPrice NUMERIC(8,2),
	waightInGms INTEGER,
	outOfStock BOOLEAN,
	quantity INTEGER
);

COPY zepto(category, name, mrp, discountPercent, vailableQuantity, discountedSellingPrice
			,waightInGms,outOfStock, quantity)
FROM 'D:\SQL Practice_Databases\zepto_analytics_project\zepto_v2.csv'
DELIMITER ',' 
CSV HEADER;

SELECT * FROM zepto ORDER BY waightingms DESC LIMIT 10;
--Count Of Rows
SELECT COUNT(*) FROM zepto;

-- Checking Null Values
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
vailableQuantity IS NULL
OR
discountedSellingPrice IS NULL
OR
waightInGms IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

--different product categories
SELECT DISTINCT category
FROM zepto ORDER BY category;

--products instock and outofstock
SELECT outofstock, COUNT(sku_id)
FROM zepto GROUP BY outofstock;

-- PRODUCT names present multiple times
SELECT name, COUNT(sku_id) AS total_count 
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY total_count DESC;

-- Category names present multiple times
SELECT category, COUNT(sku_id) AS total_category_count
FROM zepto
GROUP BY category
HAVING COUNT(sku_id) > 1
ORDER BY total_category_count DESC;

--DATA CLEANING
SELECT * FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;

-- if find then delete that rows
DELETE FROM zepto
WHERE sku_id = 3607;

-- Convert paise to rupees
UPDATE zepto
SET mrp = mrp/100.00 
, discountedSellingPrice = discountedSellingPrice / 100.00;

-- change column name vailableQuantity to availableQuantity
ALTER TABLE zepto
RENAME COLUMN vailableQuantity TO availableQuantity;

--Q.1 Find the 10 best-value products based on the discount percentage
SELECT sku_id, category, name, discountpercent
FROM zepto 
ORDER BY discountpercent DESC LIMIT 10;

--Q.2 what are the products with high mrp but Out of Stock
SELECT category, name, mrp, outofstock
FROM zepto
WHERE outofstock = 'TRUE' AND mrp >= 300
ORDER BY mrp DESC;

--Q.3 calculate the estimated revenue for each category
SELECT category, 
SUM(discountedSellingPrice * availablequantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

--Q.4 Find all products where MRP is greater than 500 and discount 
-- is less than 10%
SELECT category, name, mrp, discountpercent 
FROM zepto
WHERE mrp > 500 AND discountpercent < 10;

--Q.5 Identify  the top 5 categories offering the highest average 
-- discount percentage
SELECT category,
ROUND(AVG(discountpercent),2) AS average_count
FROM zepto 
GROUP BY category
ORDER BY average_count DESC LIMIT 5;

--Q.6 Find the price per gram for products above 100g and sort by 
-- best value
SELECT DISTINCT name, waightingms, discountedsellingprice,
ROUND(discountedsellingprice / waightingms, 2) AS price_per_gram
FROM zepto
WHERE waightingms >= 100
ORDER BY price_per_gram;

--Q.7 Group the products into categories like Low, Medium, Bulk
SELECT DISTINCT name, waightingms,
CASE 
WHEN waightingms > 10000 THEN 'Bulk'
WHEN waightingms IN(1000,5000) THEN 'Medium'
ELSE 'Low' 
END AS quantity_category
FROM zepto
ORDER BY quantity_category DESC;

-- select max(waightingms) from zepto

-- Q.8 What is the total inventory weight per category
SELECT category,
SUM(waightingms * availablequantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;
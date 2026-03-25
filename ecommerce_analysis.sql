-- Use Database
USE ecommerce_project;

-- Create Table
CREATE TABLE ecommerce (
Order_ID INT,
Order_Date DATE,
Customer_ID INT,
Customer_Name VARCHAR(100),
Region VARCHAR(50),
City VARCHAR(100),
Category VARCHAR(50),
Sub_Category VARCHAR(50),
Product_Name VARCHAR(100),
Quantity INT,
Price FLOAT,
Discount FLOAT,
Payment_Mode VARCHAR(50),
Shipping_Cost FLOAT,
Cost_Price FLOAT
);

-- Total Revenue
SELECT SUM(Quantity * Price * (1 - Discount/100)) AS Total_Revenue
FROM ecommerce;

-- Top 5 products
SELECT Product_Name,
SUM(Quantity * Price * (1 - Discount/100)) AS Revenue
FROM ecommerce
GROUP BY Product_Name
ORDER BY Revenue DESC
LIMIT 5;


-- Region wise sales
SELECT Region,
SUM(Quantity * Price * (1 - Discount/100)) AS Revenue
FROM ecommerce
GROUP BY Region;

-- Repeat Customers
SELECT Customer_ID, COUNT(Order_ID) as Orders
FROM ecommerce
GROUP BY Customer_ID
HAVING COUNT(Order_ID) > 1;

-- Branch performance
SELECT branch, SUM(amount) as transaction_amt 
FROM financial_data 
GROUP BY branch 
ORDER BY transaction_amt DESC;

-- 
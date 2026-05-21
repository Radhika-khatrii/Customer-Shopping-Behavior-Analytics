-- ========================================================
-- Project: Customer Shopping Behavior Analytics
-- Author: Data Analyst Portfolio
-- Description: Core SQL queries for data aggregation and business insights.
-- ========================================================

-- 1. Database Setup
CREATE DATABASE IF NOT EXISTS shopping_analytics;
USE shopping_analytics;

-- 2. Category Performance Analysis
-- Purpose: To identify which product categories generate the highest revenue and order volume.
SELECT 
    Category, 
    COUNT(*) AS Total_Orders, 
    SUM(`Purchase Amount (USD)`) AS Total_Revenue,
    AVG(`Purchase Amount (USD)`) AS Average_Order_Value
FROM `shopping_trends_updated`
GROUP BY Category
ORDER BY Total_Revenue DESC;

-- 3. Customer Segment Analysis (Subscription Status)
-- Purpose: To evaluate the spending behavior of subscribed vs non-subscribed customers.
SELECT 
    `Subscription Status`, 
    COUNT(*) AS Total_Customers,
    AVG(`Previous Purchases`) AS Avg_Previous_Orders,
    SUM(`Purchase Amount (USD)`) AS Total_Spent
FROM `shopping_trends_updated`
GROUP BY `Subscription Status`;

-- 4. Top 10 Popular Items by Gender
-- Purpose: To find the most frequently purchased items partitioned by Gender for targeted marketing.
SELECT 
    Gender, 
    `Item Purchased`, 
    COUNT(*) AS Popularity_Count
FROM `shopping_trends_updated`
GROUP BY Gender, `Item Purchased`
ORDER BY Popularity_Count DESC
LIMIT 10;
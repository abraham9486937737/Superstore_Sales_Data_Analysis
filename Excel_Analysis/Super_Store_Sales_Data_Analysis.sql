use super_store_sales_data;
/* Super Store Sales Data Analysis*/
/*
ALTER TABLE `super_store_sales_data`.`superstores_sales_dataset_orginal_file` 
CHANGE COLUMN `Row ID` `Row_ID` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Order ID` `Order_ID` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Ship Date` `Ship_Date` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Ship Mode` `Ship_Mode` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Customer ID` `Customer_ID` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Customer Name` `Customer_Name` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Product ID` `Product_ID` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Product Name` `Product_Name` TEXT NULL DEFAULT NULL , RENAME TO  `super_store_sales_data`.`sales_data` ;
*/
/*Verify Table Structure*/
describe sales_data;

# Check the number of records in the super store table
select count(*) as Total_Records from sales_data; #9694 records

# Check for duplicates
select order_id, count(*) from sales_data group by order_id having count(*) > 1;

# Check for Missing Values
select
	sum(case when Sales is null then 1 else 0 end) as Missing_Sales,
    sum(case when Discount is null then 1 else 0 end) as Missing_Discount,
    sum(case when Profit is null then 1 else 0 end) as Missing_Profit
from sales_data;

# Create a Computed Column (Adjusted Sales)
select
	Order_ID,
    Sales,
    Discount,
    Round(Sales * (1 - Discount), 2) as Adjusted_Sales
from
	sales_data;

# Analyze Sales Performance
# Total Revenue, Average Order Value, Total Discounts
select
	round(sum(Sales),2) as Total_Sales,
    round(avg(Sales),2) as Avg_Sales_Per_Order,
    round(sum(Sales * Discount), 2) as Total_Discount
from
	sales_data;

# Category & Segment Analysis
select
	Category,
	round(sum(Sales), 2) as Total_Sales,
    round(sum(Profit), 2) as Total_Profit,
    round(sum(Sales * (1 - Discount)), 2) as Adjusted_Sales
from
	sales_data
group by Category
	order by Total_Sales DESC;
    
# Ship Mode and Region Analysis
select
	Ship_Mode,
    Region,
    round(sum(Sales), 2) as Total_Sales,
    round(sum(Profit), 2) as Total_Profit
from
	sales_data
group by Ship_Mode, Region
order by Ship_Mode, Total_Sales DESC;

# Time-Based Analysis
select
	YEAR(STR_TO_DATE(`Order_Date`, '%d-%m-%Y')) AS Order_Year,
	MONTH(STR_TO_DATE(`Order_Date`, '%d-%m-%Y')) AS Order_Month,
	ROUND(SUM(Sales), 2) AS Total_Sales
from 
	sales_data
group by Order_Year, Order_Month
order by Order_Year, Order_Month;

# Top-Performing Products
select
	Product_Name,
	round(sum(Sales), 2) as Total_Sales,
	round(sum(Profit), 2) as Total_Profit
from
	sales_data
group by Product_Name
order by Total_Sales DESC
limit 10;

# Profitability by Region and Category
Select
	Region,
    Category,
    round(sum(Profit), 2) as Total_Profit,
    round(sum(Sales), 2) as Total_Sales,
    round(sum(Profit)/sum(Sales) * 100, 2) as Profit_Margin_Percentage
from 
	sales_data
group by Region, Category
order by Region, Profit_Margin_Percentage DESC;

# Discount Vs Profit Correlation
select
	Category,
	round(avg(Discount), 2) as Avg_Discount,
    round(avg(Profit), 2) as Avg_Profit
from
	sales_data
group by Category;

# Customer Loyality Analysis
# Top 10 repeat customers 
select
	Customer_ID,
    Customer_Name,
    Count(Distinct Order_ID) as Orders_Count,
    round(sum(Sales), 2) as Total_Sales,
    round(sum(Profit), 2) as Total_Profit
from
	sales_data
group by Customer_ID, Customer_Name
having Orders_Count > 3
order by Total_Sales DESC
LIMIT 10;

# Analyze delivery speed and its impact on satisfaction or cost
select
	Ship_Mode,
    round(AVG(DATEDIFF(STR_TO_DATE(`Ship_Date`, '%d-%m-%Y'), STR_TO_DATE(`Order_Date`, '%d-%m-%Y')))) AS Avg_Delivery_Days,
    round(sum(Sales), 2) as Total_Sales
from
	sales_data
group by Ship_Mode
order by Avg_Delivery_Days DESC;

# Category Growth Over Years
select
	YEAR(STR_TO_DATE(`Order_Date`, '%d-%m-%Y')) AS Year,
	Category,
    round(sum(Sales), 2) as Total_Sales
from
	sales_data
group by Year, Category
order by Year, Category;

# Profit Margin Categorization
# Find Profit Range
select
	min(Profit) as Min_Profit,
    max(Profit) as Max_Profit,
    avg(Profit) as Average_Profit
from
	sales_data;

# check profit spread
select
	round(Profit, -2) as Profit_Bucket,
    count(*) as Order_Count
from
	sales_data
group by Profit_Bucket
order by Profit_Bucket;

SELECT 
  `Order_ID`,
  Category,
  Profit,
  CASE 
    WHEN Profit > 100 THEN 'High'
    WHEN Profit BETWEEN 0 AND 100 THEN 'Medium'
    ELSE 'Low'
  END AS Profit_Level
FROM sales_data;

# Identify top 5 products per category using SQL ranking.
SELECT *
FROM (
  SELECT 
    Category,
    Product_Name,
    SUM(Sales) AS Total_Sales,
    RANK() OVER (PARTITION BY Category ORDER BY SUM(Sales) DESC) AS Rank_in_Category
  FROM sales_data
  GROUP BY Category, Product_Name
) ranked_data
WHERE Rank_in_Category <= 5;

# Cumulative Sales Trend
SELECT 
  YEAR(STR_TO_DATE(`Order_Date`, '%d-%m-%Y')) AS Year,
  MONTH(STR_TO_DATE(`Order_Date`, '%d-%m-%Y')) AS Month,
  round(SUM(Sales), 2) AS Monthly_Sales,
  round(SUM(SUM(Sales)) OVER (ORDER BY YEAR(STR_TO_DATE(`Order_Date`, '%d-%m-%Y')), MONTH(STR_TO_DATE(`Order_Date`, '%d-%m-%Y'))), 2) AS Cumulative_Sales
FROM sales_data
GROUP BY Year, Month;

# RFM Analysis (Recency, Frequency, Monetary)
# Customer segmentation for marketing
/*
Recency: Last order date
Frequency: Number of orders
Monetary: Total amount spent
*/
select
	Customer_ID,
    MAX(STR_TO_DATE(`Order_Date`, '%d-%m-%Y')) AS Last_Purchase,
    count(distinct Order_ID) as Frequency,
    round(sum(Sales), 2) as Monetary_Sales
from sales_data
group by Customer_ID
order by Customer_ID, Frequency DESC;

# Forcast Preparation
select
	date_format(str_to_date(`Order_Date`, '%d-%m-%Y'), '%Y-%m') as Order_Month,
    round(sum(Sales), 2) as Total_Sales
from
	sales_data
group by Order_Month
order by Order_Month;
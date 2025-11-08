Sales Data Analysis – Tableau Dashboard
Project Overview

This project analyzes a Superstore Sales dataset to uncover key insights on sales performance, profit trends, regional contributions, and customer behavior.
The objective is to build an interactive Tableau Dashboard showcasing KPIs, trends, and visual storytelling for business decision-making.

🧰 Tools & Technologies

Tableau Desktop / Tableau Public – Data visualization & dashboard creation

Excel – Data cleaning and preprocessing

SQL – Data extraction and transformation

Power BI – Comparative visualization for BI validation

Python (Upcoming) – Predictive and exploratory analysis

📂 Dataset Description

The dataset includes fields such as:

Order ID, Order Date, Ship Date

Customer Name, Segment, Region

Product Category, Sub-Category, Quantity

Sales, Profit, Discount, Ship Mode

📈 Key KPIs Created
Measure	Formula	Description
Total Revenue	SUM([Sales])	Total sales amount
Total Profit	SUM([Profit])	Net profit earned
Total Orders	COUNTD([Order ID])	Number of unique orders
Total Units Sold	SUM([Quantity])	Total products sold
Average Order Value (AOV)	SUM([Sales])/COUNTD([Order ID])	Avg. revenue per order
Average Discount	AVG([Discount])	Avg. discount applied

📊 Dashboard Visuals and Insights
🧩 Page 1: Sales Overview

KPI Summary Cards (Revenue, Profit, Orders, AOV, Quantity)

Monthly Sales Trend – Reveals seasonality & growth patterns

Sales by Region (Map) – Shows highest performing regions

Sales by Category (Bar Chart) – Identifies top-selling categories

💹 Page 2: Profit Analysis

Sales vs Profit Trend (Dual-axis Line Chart) – Relationship between sales & profit

Profit by Sub-Category (Bar Chart) – Highlights most and least profitable items

Profit Margin by Segment – Compares B2B, Consumer, Corporate segments

👥 Page 3: Customer Insights

Top 10 Customers by Sales

Sales vs Profit (Scatter Plot) – Identifies high-sales low-profit customers

Pareto Chart (80/20 Analysis) – Shows how top 20% of customers drive revenue

📦 Page 4: Product & Discount Impact

Tree Map – Product contribution to sales and profit

Discount vs Profit Scatter Plot – Correlation between discounts and profitability

📅 Page 5: Forecast & Trends

Sales Forecasting (Built-in Tableau Forecast Model)

Region-wise Comparison (Highlight Table)

💡 Key Insights

West region drives the highest sales and profit.

Technology category has the highest profit margin.

Discount-heavy orders in Furniture segment reduce profitability.

Top 20% customers contribute ~80% of total revenue.

Clear upward trend in sales across 2017–2019 period.

🧭 How to View / Run

Open Sales_Analysis_Tableau.twb or .twbx file in Tableau Desktop or Tableau Public.

Navigate through dashboards using tabs.

Use filters (Region, Category, Year) for interactive exploration.

Press F7 for full-screen dashboard view.

📌 Next Steps

Implement predictive sales analysis using Python (Linear Regression / ARIMA).

Integrate Tableau Public link in README for online visualization preview.

Compare Tableau and Power BI dashboards for performance benchmarking.




🧠 Power BI Analysis — Superstore Sales Performance Dashboard
📊 Project Overview

The Superstore Sales Performance Dashboard in Power BI provides an interactive and visual representation of key business metrics such as total sales, profit, orders, and customer performance.
It helps stakeholders monitor sales trends, identify profitable segments, and make data-driven business decisions.

🧾 Dataset Used

Dataset Name: Superstore_Sales_Dataset.xlsx
Data Source: Global Superstore Sample Data
Records: ~10,000 rows
Fields Include:

Order ID, Order Date, Ship Mode, Segment

Country, Region, State, City

Category, Sub-Category, Product Name

Sales, Quantity, Discount, Profit, Customer Name

⚙️ Data Modeling

Imported dataset: Excel file loaded into Power BI.

Created Calendar Table using DAX:

Calendar = CALENDAR(MIN(Superstore[Order_Date]), MAX(Superstore[Order_Date]))


Established Relationship:

Calendar[Date] → Superstore[Order_Date]

Created Separate Measures Table: _All_Measures for all DAX calculations.

⚙️ Data Modeling

Imported dataset: Excel file loaded into Power BI.

Created Calendar Table using DAX:

Calendar = CALENDAR(MIN(Superstore[Order_Date]), MAX(Superstore[Order_Date]))


Established Relationship:

Calendar[Date] → Superstore[Order_Date]

Created Separate Measures Table: _All_Measures for all DAX calculations.

🖼️ Dashboard Layout

Header KPIs (Cards):

💰 Total Sales

📦 Total Units Sold

💹 Net Profit

🧾 Total Orders

💳 Average Order Value (AOV)

💸 Average Discount

📈 Profit Margin %

Visuals Used:

Visual	Purpose
Bar Chart	Sales by Category
Line Chart	Sales Over Time (trend by Year)
Donut Chart	Sales by Segment
Map	Sales by State (geo analysis)
Bar Chart	Profit by Sub-Category
Horizontal Bar Chart	Top 10 Customers
Slicers	Year, Region, Category, Segment, Ship Mode

🎨 Design Highlights

Consistent color theme (light teal + gold accents).

Dashboard title and icons for a professional appearance.

Left panel slicers for easy interactivity.

Rounded panels and shadows for modern UI feel.

Interactive cross-filtering across visuals.

💡 Insights & Findings

Technology category contributes the highest revenue (~$0.84M).

Corporate and Consumer segments dominate total sales.

Profit varies widely across sub-categories — Tables and Bookcases show negative margins.

Sales show a steady upward trend from 2015 to 2017.

A few top customers (like Sean M. and Tamara M.) account for a large share of revenue.

Western region leads in overall sales volume.

🧩 Interactivity & Features

Dynamic slicers (Year, Region, Segment, Category).

Drill-through functionality on customer and product details.

Tooltip pages for deeper insights on hover.

Responsive layout for better visibility on various screen sizes.

All visuals update instantly based on selected filters.

🚀 Tools & Technologies Used

Power BI Desktop

DAX (Data Analysis Expressions)

Power Query (ETL and data cleaning)

Excel (source data)

SQL (exploratory queries before import)


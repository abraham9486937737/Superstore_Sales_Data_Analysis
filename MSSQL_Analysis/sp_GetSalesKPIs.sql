CREATE PROCEDURE sp_GetSalesKPIs
AS
/*****************************************************************************************
    Stored Procedure Name : sp_GetSalesKPIs
    Created By            : Abraham
    Created On            : 2025-10-27
    Purpose               : To retrieve core sales KPIs for executive summary and dashboard reporting
    Description           : Returns total sales, average order value, total discount, total profit,
                            top category, top product, and customer count
    Change History        :
        Date        Author				Description
        ----------  ----------			----------------------------------------------------------
        2025-10-27  Abraham				Initial creation for consolidated KPI reporting
****************************************************************************************
*/
BEGIN
	SELECT
		--Total Sales
		round(sum(Sales), 2) as Total_Sales,
		--Average Order Value (AOV)
		round(avg(Sales), 2) as Avg_Order_Value,
		--Total Discount
		round(sum(Sales * Discount), 2) as Total_Discount,
		--Total_Profit
		round(sum(Profit), 2) as Total_Profit,
		--Number of unique customers
		count(distinct(Customer_ID)) as Unique_Customers,
		--Top Category by Sales
		(select top 1 Category
		 from sales_data
		 group by Category 
		 order by Sum(Sales) DESC) as Top_Category,
		--Top Product by Sales
		(select top 1 Product_Name
		 from sales_data 
		 group by Product_Name
		 order by sum(Sales) DESC) as Top_Product
	FROM
		sales_data
END
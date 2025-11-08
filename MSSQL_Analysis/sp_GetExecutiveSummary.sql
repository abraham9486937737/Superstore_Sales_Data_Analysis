CREATE PROCEDURE sp_GetExecutiveSummary
AS
/*****************************************************************************************
    Stored Procedure Name : sp_GetExecutiveSummary
    Created By            : Abraham
    Created On            : 2025-10-27
    Purpose               : Provide a high-level summary of sales performance
    Description           : Returns total sales, profit, discount, customer count, top category,
                           top product, and average delivery time
    Change History        :
        Date        Author      Description
        ----------  ----------  ----------------------------------------------------------
        2025-10-27  Abraham     Initial creation for executive dashboard summary
*****************************************************************************************/
BEGIN
    SELECT
        ROUND(SUM(Sales), 2) AS Total_Sales,
        ROUND(SUM(Profit), 2) AS Total_Profit,
        ROUND(SUM(Sales * Discount), 2) AS Total_Discount,
        COUNT(DISTINCT Customer_ID) AS Unique_Customers,
        ROUND(AVG(DATEDIFF(DAY, Order_Date, Ship_Date)), 1) AS Avg_Delivery_Days,
        (SELECT TOP 1 Category FROM sales_data GROUP BY Category ORDER BY SUM(Sales) DESC) AS Top_Category,
        (SELECT TOP 1 Product_Name FROM sales_data GROUP BY Product_Name ORDER BY SUM(Sales) DESC) AS Top_Product
	FROM
		sales_data
	
END

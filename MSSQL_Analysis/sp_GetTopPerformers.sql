CREATE PROCEDURE sp_GetTopPerformers 
    @TopN INT = 10
AS
/*****************************************************************************************
    Stored Procedure Name : sp_GetTopPerformers
    Created By            : Abraham
    Created On            : 2025-10-27
    Purpose               : Identify top-performing customers and products
    Description           : Returns top N customers by sales and top N products by profit
    Change History        :
        Date        Author      Description
        ----------  ----------  ----------------------------------------------------------
        2025-10-27  Abraham     Initial creation for top performer insights
*****************************************************************************************/
BEGIN
    -- Top Customers
    SELECT TOP (@TopN)
        Customer_ID,
        Customer_Name,
        ROUND(SUM(Sales), 2) AS Total_Sales,
        ROUND(SUM(Profit), 2) AS Total_Profit
    FROM sales_data
    GROUP BY Customer_ID, Customer_Name
    ORDER BY Total_Sales DESC

    -- Top Products
    SELECT TOP (@TopN)
        Product_Name,
        ROUND(SUM(Profit), 2) AS Total_Profit,
        ROUND(SUM(Sales), 2) AS Total_Sales
    FROM sales_data
    GROUP BY Product_Name
    ORDER BY Total_Profit DESC
END

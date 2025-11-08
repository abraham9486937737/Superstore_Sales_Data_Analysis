CREATE PROCEDURE sp_ForecastPrepMonthlySales
AS
/*****************************************************************************************
    Stored Procedure Name : sp_ForecastPrepMonthlySales
    Created By            : Abraham
    Created On            : 2025-10-27
    Purpose               : Prepare monthly sales data for forecasting models
    Description           : Aggregates sales by month and formats date for time series modeling
    Change History        :
        Date        Author      Description
        ----------  ----------  ----------------------------------------------------------
        2025-10-27  Abraham     Initial creation for forecast-ready data
*****************************************************************************************/
BEGIN
    SELECT
        FORMAT(Order_Date, 'yyyy-MM') AS Order_Month,
        ROUND(SUM(Sales), 2) AS Total_Sales
    FROM sales_data
    GROUP BY FORMAT(Order_Date, 'yyyy-MM')
    ORDER BY Order_Month
END
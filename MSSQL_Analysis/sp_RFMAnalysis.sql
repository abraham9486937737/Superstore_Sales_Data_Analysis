CREATE PROCEDURE sp_RFMAnalysis
AS
/*****************************************************************************************
    Stored Procedure Name : sp_RFMAnalysis
    Created By            : Abraham
    Created On            : 2025-10-27
    Purpose               : Perform Recency, Frequency, Monetary analysis for customer segmentation
    Description           : Returns last purchase date, number of orders, and total spend per customer
    Change History        :
        Date        Author      Description
        ----------  ----------  ----------------------------------------------------------
        2025-10-27  Abraham     Initial creation for RFM segmentation
*****************************************************************************************/
BEGIN
    SELECT
        Customer_ID,
        MAX(Order_Date) AS Last_Purchase,
        COUNT(DISTINCT Order_ID) AS Frequency,
        ROUND(SUM(Sales), 2) AS Monetary_Sales
    FROM sales_data
    GROUP BY Customer_ID
    ORDER BY Customer_ID, Frequency DESC;
END;
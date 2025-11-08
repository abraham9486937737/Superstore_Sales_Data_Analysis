CREATE PROCEDURE sp_GetColumnStats
AS
/*****************************************************************************************
    Stored Procedure Name : sp_GetColumnStats
    Created By            : Abraham
    Created On            : 2025-10-27
    Purpose               : Summarize numeric column distributions
    Description           : Returns min, max, avg, and standard deviation for Sales, Discount, and Profit
    Change History        :
        Date        Author      Description
        ----------  ----------  ----------------------------------------------------------
        2025-10-27  Abraham     Initial creation for column-level statistics
*****************************************************************************************/
BEGIN
	SELECT
		'Sales' as Metric,
		ROUND(MIN(Sales),2) as Min_Sales_Value,
		ROUND(MAX(Sales),2) as Max_Sales_Value,
		ROUND(AVG(Sales), 2) as Avg_Sales_Value,
		ROUND(STDEV(Sales), 2) as Std_Dev
	FROM
		sales_data
	UNION ALL
	SELECT
		'Discount',
		ROUND(MIN(Discount), 2),
		ROUND(MAX(Discount), 2),
		ROUND(Avg(Discount), 2),
		ROUND(STDEV(Discount), 2)
	FROM
		sales_data
	UNION ALL
	SELECT
		'Profit',
		ROUND(MIN(Profit), 2),
		ROUND(MAX(Profit), 2),
		ROUND(AVG(Profit), 2),
		ROUND(STDEV(Profit), 2)
	FROM
		sales_data

END
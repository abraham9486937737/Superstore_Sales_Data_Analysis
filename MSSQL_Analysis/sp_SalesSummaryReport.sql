CREATE PROCEDURE sp_SalesSummaryReport
@Category VARCHAR(255) = NULL,
@Sub_Category VARCHAR(255) = NULL,
@Segment VARCHAR(255) = NULL,
@Region VARCHAR(255) = NULL,
@Year INT = NULL,
@Page INT = 1,
@PageSize INT = 50

AS
/*
=========================================================================================================================================
Stored Procedure Name	: sp_SalesSummaryReport
Create By				: Abraham P
Created On				: 2025-10-27
Purpose					: Generate a paginated Sales Report with optional filters (parameters)
Description				: Filters sales_data by Category, Sub-Category, Segment, Region and Year.
						  Returns paginated records and summary KPIs for dashboard reporting.
Change History			:
Date		|	Author					|	Description
------------ --------------------------- --------------------------------------------------------------------------------
2025-10-27		Abraham P					Initial creation with filters, KPIs, and pagination
=========================================================================================================================================
*/
BEGIN
	-- Summary KPIs
	SELECT
		ROUND(SUM(Sales), 2) AS Total_Sales,
		ROUND(SUM(Profit), 2) AS Total_Profit,
		ROUND(SUM(Sales * Discount), 2) AS Total_Discount,
		COUNT(*) AS Total_Records
	FROM
		sales_data
	WHERE
		(@Category IS NULL OR Category = @Category) AND
		(@Sub_Category IS NULL or [Sub-Category] = @Sub_Category) AND
		(@Segment IS NULL OR Segment = @Segment) AND
		(@Region IS NULL OR Region = @Region) AND
		(@Year IS NULL OR YEAR(Order_Date) = @Year)

	-- Paginated Detail Records
	SELECT
		Order_ID,
		FORMAT(Order_Date, 'yyyy-MM-dd') as Order_Date,
		FORMAT(Ship_Date, 'yyyy-MM-dd') as Ship_Date,
		Ship_Mode,
		Customer_ID,
		Customer_Name,
		Segment,
		Region,
		Category,
		[Sub-Category],
		Product_Name,
		Sales,
		Quantity,
		Discount,
		Profit
	FROM
		sales_data
	WHERE
		(@Category IS NULL OR Category = @Category) AND
		(@Sub_Category IS NULL OR [Sub-Category] = @Sub_Category) AND
		(@Segment IS NULL OR Segment = @Segment) AND
		(@Region IS NULL OR Region = @Region) AND
		(@Year IS NULL OR YEAR(Order_Date) = @Year)
	ORDER BY Order_Date
	OFFSET (@Page - 1) * @PageSize ROWS
	FETCH NEXT @PageSize ROWS ONLY

END

/*
To execute the sp
-- All records, first page
EXEC sp_SalesSummaryReport

-- Filter by Region and Year, page 2
EXEC sp_SalesSummaryReport @Region = 'East', @Year = 2017, @Page = 2, @PageSize = 25

-- Filter by Category and Segment
EXEC sp_SalesSummaryReport @Category = 'Technology', @Segment = 'Consumer'
*/
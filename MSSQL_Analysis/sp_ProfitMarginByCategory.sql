CREATE PROCEDURE sp_ProfitMarginByCategory
AS
/*****************************************************************************************
    Stored Procedure Name : sp_ProfitMarginByCategory
    Created By            : Abraham
    Created On            : 2025-10-27
    Purpose               : Evaluate profitability across regions and categories
    Description           : Returns total profit, total sales, and profit margin percentage
    Change History        :
        Date        Author      Description
        ----------  ----------  ----------------------------------------------------------
        2025-10-27  Abraham     Initial creation for margin analysis
*****************************************************************************************/
BEGIN
	select
		Region,
		Category,
		round(sum(Profit), 2) as Total_Profit,
		round(sum(Sales), 2) as Total_Sales,
		round(sum(Profit) * 100.0 / NULLIF(sum(Sales), 0), 2) as Profit_Margin_Percentage
	from
		sales_data
	group by Region, Category
	order by Region, Profit_Margin_Percentage DESC
END
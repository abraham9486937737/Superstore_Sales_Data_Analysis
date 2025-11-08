CREATE PROCEDURE sp_CategorySegmentAnalysis

AS
	/*
	Change History
	Data		|	Author						|	Description
	-----------------------------------------------------------------------------------------------------------------------------------------
	2025-10-27		Abraham P						To get the sales details like total sales, total profit and the adjusted sales by category
	-----------------------------------------------------------------------------------------------------------------------------------------
	*/
BEGIN
	select
		Category,
		round(sum(Sales), 2) as Total_Sales,
		round(avg(Profit), 2) as Total_Profit,
		round(sum(Sales * (1 - Discount)) , 2) as Adjusted_Sales
	from
		sales_data
	group by Category
	order by Total_Sales DESC
END
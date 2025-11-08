CREATE PROCEDURE sp_MonthlySalesTrend

AS
	/*
	Change History
	Data		|	Author						|	Description
	-----------------------------------------------------------------------------------------------------------------------------------------
	2025-10-27		Abraham P						To get the monthly sales trend details
	-----------------------------------------------------------------------------------------------------------------------------------------
	*/
BEGIN
	select
		FORMAT(Order_Date, 'yyyy-MM') as Order_Month,
		round(sum(Sales), 2) as Total_Sales
	from
		sales_data
	group by FORMAT(Order_Date, 'yyyy-MM')
	order by Order_Month
END
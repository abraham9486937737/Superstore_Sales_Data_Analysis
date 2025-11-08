CREATE PROCEDURE sp_CumulativeSalesTrend

AS
	/*
	Change History
	Data		|	Author						|	Description
	-----------------------------------------------------------------------------------------------------------------------------------------
	2025-10-27		Abraham P						To view the cumulative sales trend over the year and month
	-----------------------------------------------------------------------------------------------------------------------------------------
	*/
BEGIN
	select
		YEAR(Order_Date) as Order_Year,
		MONTH(Order_Date) as Order_Month,
		round(sum(Sales), 2) as Monthly_Sales,
		round(sum(sum(sales)) over (order by YEAR(Order_Date), MONTH(Order_Date)), 2) as Cumulative_Sales
	from
		sales_data
	group by YEAR(Order_Date), MONTH(Order_Date)
	order by YEAR(Order_Date), MONTH(Order_Date)
END
CREATE PROCEDURE sp_SalesPerformance

AS
	/*
	Change History
	Data		|	Author						|	Description
	-----------------------------------------------------------------------------------------------------------------------------------------
	2025-10-27		Abraham P						To get the sales performance details like total sales, average sales per order and total discount
	-----------------------------------------------------------------------------------------------------------------------------------------
	*/
BEGIN
	select
		round(sum(Sales), 2) as Total_Sales,
		round(avg(Sales), 2) as Avg_Sales_per_Order,
		round(sum(Sales * Discount) , 2) as Total_Discount
	from
		sales_data
END
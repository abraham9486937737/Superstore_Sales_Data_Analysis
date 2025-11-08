CREATE PROCEDURE sp_DiscountVsProfit

AS
	/*
	Change History
	Data		|	Author						|	Description
	-----------------------------------------------------------------------------------------------------------------------------------------
	2025-10-27		Abraham P						Category wise prifit and discount details
	-----------------------------------------------------------------------------------------------------------------------------------------
	*/
BEGIN
	select
		Category,
		round(avg(Discount), 2) as Avg_Discount,
		round(avg(Profit), 2) as Avg_Profit
	from
		sales_data
	group by Category
END
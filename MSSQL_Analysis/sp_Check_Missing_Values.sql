CREATE PROCEDURE sp_Check_Missing_Values

AS
	/*
	Change History
	Data		|	Author						|	Description
	-----------------------------------------------------------------------------------------------------------------------------------------
	2025-10-27		Abraham P						To check the missing values in key columns.
	-----------------------------------------------------------------------------------------------------------------------------------------
	*/
BEGIN
	select
		sum(case when Sales is null then 1 else 0 end) as Missing_Sales,
		sum(case when Discount is null then 1 else 0 end) as Missing_Discount,
		sum(case when Profit is null then 1 else 0 end) as Missing_Profit
	from
		sales_data
END
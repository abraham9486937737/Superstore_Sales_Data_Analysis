CREATE PROCEDURE sp_Check_Duplicates

AS
	/*
	Change History
	Data		|	Author						|	Description
	-----------------------------------------------------------------------------------------------------------------------------------------
	2025-10-27		Abraham P						To check duplicates
	-----------------------------------------------------------------------------------------------------------------------------------------
	*/
BEGIN
	select
		Order_ID,
		count(*) as Duplicate_Count
	from
		sales_data
	group by Order_ID
	having count(*) > 1;
END
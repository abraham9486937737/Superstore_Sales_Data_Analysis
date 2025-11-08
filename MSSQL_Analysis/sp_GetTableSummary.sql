CREATE PROCEDURE sp_GetTableSummary

AS
	/*
	Change History
	Data		|	Author						|	Description
	-----------------------------------------------------------------------------------------------------------------------------------------
	2025-10-27		Abraham P						To get the table summary
	-----------------------------------------------------------------------------------------------------------------------------------------
	*/
BEGIN
	select
		count(*) as Total_Records
	from
		sales_data
END
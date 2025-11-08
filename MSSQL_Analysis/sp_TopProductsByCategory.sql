CREATE PROCEDURE sp_TopProductsByCategory --'Technology', 5
@Category varchar(255),
@TopN INT
AS
	/*
	Change History
	Data		|	Author						|	Description
	-----------------------------------------------------------------------------------------------------------------------------------------
	2025-10-27		Abraham P						To get the top sales by given input value
	-----------------------------------------------------------------------------------------------------------------------------------------
	*/
BEGIN
	select top(@TopN)
		Product_Name,
		Round(sum(Sales), 2) as Total_Sales,
		Round(sum(Profit), 2) as Total_Profit
	from
		sales_data
	where 
		Category = @Category
	Group BY Product_Name
	Order By Total_Sales DESC
END
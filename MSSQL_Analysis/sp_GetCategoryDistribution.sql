CREATE PROCEDURE sp_GetCategoryDistribution
AS
/*****************************************************************************************
    Stored Procedure Name : sp_GetCategoryDistribution
    Created By            : Abraham
    Created On            : 2025-10-27
    Purpose               : Analyze distribution of records across product categories
    Description           : Returns count of orders and total sales per category
    Change History        :
        Date        Author      Description
        ----------  ----------  ----------------------------------------------------------
        2025-10-27  Abraham     Initial creation for category-level EDA
*****************************************************************************************/
BEGIN
	select
		Category,
		count(*) as Order_Count,
		Round(Sum(Sales), 2) as Total_Sales
	from
		sales_data
	group by Category
	order by Total_Sales DESC
END
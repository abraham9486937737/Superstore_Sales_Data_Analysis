CREATE PROCEDURE sp_MonthlySalesTrendByRegion --'South'
    @Region VARCHAR(255)
AS
/*****************************************************************************************
    Stored Procedure Name : sp_MonthlySalesTrendByRegion
    Created By            : Abraham
    Created On            : 2025-10-27
    Purpose               : Analyze monthly sales trends for a specific region
    Description           : Filters sales data by region and returns monthly totals
    Change History        :
        Date        Author      Description
        ----------  ----------  ----------------------------------------------------------
        2025-10-27  Abraham     Initial creation with region parameter
*****************************************************************************************/
BEGIN
	select 
		YEAR(Order_Date) as Order_Year,
		MONTH(Order_Date) as Order_Month,
		Round(sum(Sales), 2) Total_Sales
	from
		sales_data
	where
		Region = @Region
	group by YEAR(Order_Date), MONTH(Order_Date)
	order by Order_Year, Order_Month
END
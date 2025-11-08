CREATE PROCEDURE sp_CustomerLoyaltyMetrics
AS
/*****************************************************************************************
    Stored Procedure Name : sp_CustomerLoyaltyMetrics
    Created By            : Abraham
    Created On            : 2025-10-27
    Purpose               : Identify repeat customers and their contribution
    Description           : Returns top 10 customers with more than 3 orders, sorted by total sales
    Change History        :
        Date        Author      Description
        ----------  ----------  ----------------------------------------------------------
        2025-10-27  Abraham     Initial creation for loyalty analysis
*****************************************************************************************/
BEGIN
	select top 10
		Customer_ID,
		Customer_Name,
		count(Distinct Order_ID) as Orders_Count,
		round(sum(Sales), 2) as Total_Sales,
		round(sum(Profit), 2) as Total_Profit
	from
		sales_data
	group by Customer_ID, Customer_Name
	having count(Distinct Order_ID) > 3
	order by Total_Sales DESC
END
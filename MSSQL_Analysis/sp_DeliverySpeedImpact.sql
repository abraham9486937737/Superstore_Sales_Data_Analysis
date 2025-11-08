CREATE PROCEDURE sp_DeliverySpeedImpact
AS
/*****************************************************************************************
    Stored Procedure Name : sp_DeliverySpeedImpact
    Created By            : Abraham
    Created On            : 2025-10-27
    Purpose               : Analyze delivery speed and its impact on sales
    Description           : Calculates average delivery time and total sales per ship mode
    Change History        :
        Date        Author      Description
        ----------  ----------  ----------------------------------------------------------
        2025-10-27  Abraham     Initial creation for delivery performance analysis
*****************************************************************************************/
BEGIN
	select 
		Ship_Mode,
		Round(Avg(DATEDIFF(DAY, Order_Date, Ship_Date)), 1) as Avg_Delivery_Days,
		Round(sum(Sales), 2) Total_Sales
	from
		sales_data
	group by Ship_Mode
	order by Avg_Delivery_Days DESC
END
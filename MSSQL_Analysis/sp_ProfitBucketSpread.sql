CREATE PROCEDURE sp_ProfitBucketSpread
AS
/*****************************************************************************************
    Stored Procedure Name : sp_ProfitBucketSpread
    Created By            : Abraham
    Created On            : 2025-10-27
    Purpose               : Analyze distribution of profit values
    Description           : Buckets profit into rounded ranges and counts orders per bucket
    Change History        :
        Date        Author      Description
        ----------  ----------  ----------------------------------------------------------
        2025-10-27  Abraham     Initial creation for profit spread analysis
*****************************************************************************************/
BEGIN
	select
		round(Profit, -2) as Profit_Bucket,
		count(*) as Order_Count
	from
		sales_data
	group by round(Profit, -2)
	order by Profit_Bucket
END
CREATE PROCEDURE sp_FilterSalesByRegionSegment --'West', 'Corporate'
@Region varchar(255),
@Segment varchar(255)
AS
	/*
	Change History
	Data		|	Author						|	Description
	-----------------------------------------------------------------------------------------------------------------------------------------
	2025-10-27		Abraham P						To get the sales by reagion and segment.
	-----------------------------------------------------------------------------------------------------------------------------------------
	*/
BEGIN
	select
		*
	from
		sales_data
	where 
		Region = @Region and Segment = @Segment
END
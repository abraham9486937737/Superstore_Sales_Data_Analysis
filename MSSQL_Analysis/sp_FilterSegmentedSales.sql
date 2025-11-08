CREATE PROCEDURE sp_FilterSegmentedSales
    @Segment VARCHAR(255) = NULL,
    @Category VARCHAR(255) = NULL,
    @Region VARCHAR(255) = NULL
AS
/*****************************************************************************************
    Stored Procedure Name : sp_FilterSegmentedSales
    Created By            : Abraham
    Created On            : 2025-10-27
    Purpose               : Filter sales data by segment, category, and region
    Description           : Returns sales records based on optional segmentation filters
    Change History        :
        Date        Author      Description
        ----------  ----------  ----------------------------------------------------------
        2025-10-27  Abraham     Initial creation for flexible segmentation filtering
*****************************************************************************************/
BEGIN
    SELECT
        Order_ID,
        Order_Date,
        Segment,
        Category,
        Region,
        Sales,
        Profit
    FROM sales_data
    WHERE
        (@Segment IS NULL OR Segment = @Segment) AND
        (@Category IS NULL OR Category = @Category) AND
        (@Region IS NULL OR Region = @Region);
END;

CREATE FUNCTION dbo.udf_GetSKUPrices(@ID_SKU BIGINT)
RETURNS decimal(18,2)
AS
BEGIN 
	DECLARE @Price decimal(18,2)
	SET @Price = 
	(SELECT SUM(Value) from dbo.Basket where ID_SKU = @ID_SKU) 
	/ 
	(SELECT SUM(Quantity) from dbo.Basket where ID_SKU = @ID_SKU) 
	RETURN @Price
END;
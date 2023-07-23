CREATE VIEW dbo.vw_SKUPrice
AS 
SELECT *, dbo.udf_GetSKUPrice(u.ID_identity) AS [DumbFunction]
FROM dbo.SKU as u
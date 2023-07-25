USE test
Go
CREATE OR ALTER TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket 
AFTER INSERT AS
 
UPDATE dbo.Basket
SET dbo.Basket.DiscountValue = dbo.Basket.Value * 0.05
FROM dbo.Basket join inserted on dbo.Basket.ID_identity = inserted.ID_identity
WHERE EXISTS(
	SELECT ID_SKU
	from inserted
	where inserted.ID_SKU = dbo.Basket.ID_SKU
	group by ID_SKU
	HAVING COUNT(ID_SKU) >= 2
)
UPDATE dbo.Basket
SET dbo.Basket.DiscountValue = 0
FROM dbo.Basket join inserted on dbo.Basket.ID_identity = inserted.ID_identity
WHERE EXISTS(
	SELECT ID_SKU
	from inserted
	where inserted.ID_SKU = dbo.Basket.ID_SKU
	group by ID_SKU
	HAVING COUNT(ID_SKU) < 2
)


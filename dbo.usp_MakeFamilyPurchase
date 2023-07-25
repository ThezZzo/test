
CREATE OR ALTER PROCEDURE dbo.usp_MakeFamilyPurchase @FamilySurName VARCHAR(255)
AS
IF (EXISTS(SELECT dbo.Family.SurName from dbo.Family where dbo.Family.SurName = @FamilySurName)) 
	BEGIN
		UPDATE dbo.Family
		SET BudgetValue = BudgetValue - (SELECT SUM(dbo.Basket.Value) from dbo.Basket)
		WHERE dbo.Family.SurName = @FamilySurName
	END
ELSE 
	BEGIN
		SELECT 'Family  ' + @FamilySurName + ' is not exist'
	END

CREATE TABLE dbo.SKU (
	ID_identity BIGINT PRIMARY KEY NOT NULL,
	Code AS 's' + ID_identity UNIQUE,
	Name VARCHAR(255) NOT NULL
);

CREATE TABLE dbo.Family (
	ID_identity BIGINT PRIMARY KEY NOT NULL,
	SurName VARCHAR(255) NOT NULL,
	BudgetValue VARCHAR(255) NOT NULL
);

CREATE TABLE dbo.Basket (
	ID_identity BIGINT PRIMARY KEY NOT NULL, 
	ID_SKU BIGINT NOT NULL FOREIGN KEY REFERENCES dbo.SKU(ID_identity),
	ID_Family BIGINT NOT NULL FOREIGN KEY REFERENCES dbo.Family(ID_identity),
	Quantity int NOT NULL CHECK (Quantity > 0),
	Value decimal NOT NULL CHECK (Value > 0),
	PurchaseDate DATETIME,
	DiscountValue decimal
	)




CREATE TABLE dbo.SKU (
	ID_identity BIGINT NOT NULL,
	Code AS 's' + ID_identity NOT NULL,
	Name VARCHAR(255) NOT NULL
)

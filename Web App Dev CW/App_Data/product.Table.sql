CREATE TABLE [dbo].[Table]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [product_name] VARCHAR(50) NULL, 
    [product_desc] VARCHAR(MAX) NULL, 
    [product_price] INT NULL, 
    [product_qty] INT NULL, 
    [product_images] VARCHAR(MAX) NULL
)

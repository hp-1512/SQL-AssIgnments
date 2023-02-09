ALTER PROCEDURE Sales_for_Specified_Category 
@categoryid INT
AS  
BEGIN  
   SELECT Categories.CategoryID,Categories.CategoryName,   
    SUM([Order Details].Quantity * [Order Details].UnitPrice) AS [Total Sale]
	FROM Products
	INNER JOIN [Order Details] ON [Order Details].ProductID = Products.ProductID
	INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
	WHERE Categories.CategoryID = @categoryid
	GROUP BY Categories.CategoryID,Categories.CategoryName
END
Sales_for_Specified_Category 1


--for all categories
ALTER PROCEDURE Sales_by_Category  
AS  
BEGIN  
   SELECT Categories.CategoryID,Categories.CategoryName,   
    SUM([Order Details].Quantity * [Order Details].UnitPrice) AS [Total Sale]
	FROM Products
	INNER JOIN [Order Details] ON [Order Details].ProductID = Products.ProductID
	INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
	GROUP BY Categories.CategoryID,Categories.CategoryName
END

Sales_by_Category 

--for a specific year
ALTER PROCEDURE Sales_For_Specified_Year  
@Year INT 
AS  
BEGIN  
   SELECT YEAR(Orders.ShippedDate) AS [YEAR],   
    SUM([Order Details].Quantity * [Order Details].UnitPrice) AS [Total Sale]
	FROM Orders
	INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
	WHERE YEAR(ShippedDate) = @Year
	GROUP BY YEAR(ShippedDate)
END
Sales_For_Specified_Year 1997


--for all years

CREATE PROCEDURE Sales_by_Year  
AS  
BEGIN  
   SELECT YEAR(Orders.ShippedDate) AS [YEAR],   
    SUM([Order Details].Quantity * [Order Details].UnitPrice) AS [Total Sale]
	FROM Orders
	INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
	GROUP BY YEAR(ShippedDate)
END
Sales_by_Year


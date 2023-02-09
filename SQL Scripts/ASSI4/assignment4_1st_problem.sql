ALTER PROC smInsertUpdateOrders(@OrderID  INT, @CustomerID NCHAR(5), @EmployeeID INT, @OrderDate DATETIME, @RequiredDate DATETIME, @ShippedDate DATETIME,
@ShipVia INT, @Freight MONEY, @ShipName NVARCHAR(40), @ShipAddress NVARCHAR(60), @ShipCity NVARCHAR(15), @ShipRegion NVARCHAR(15), @ShipPostalCode NVARCHAR(10),
@ShipCountry NVARCHAR(15),@type NVARCHAR(7)

AS
BEGIN
	DECLARE @AvgFreight MONEY 
	
	SELECT @AvgFreight = AVG(Freight) FROM Orders
	WHERE CustomerID = @CustomerID 
	GROUP BY CustomerID

	IF(@AvgFreight < @Freight)
		BEGIN
			RAISERROR('Operation denied due to Average Freight Condition.',10,1)
		END
	ELSE
		BEGIN
			IF(@type = 'INSERT')
				BEGIN
					INSERT INTO Orders(OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
					VALUES (@OrderID, @CustomerID, @EmployeeID, @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @Freight, @ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry)
				END
			ELSE
				BEGIN
					UPDATE Orders SET
					  CustomerID = @CustomerID, EmployeeID = @EmployeeID, 
					  OrderDate = @OrderDate, RequiredDate = @RequiredDate, ShippedDate = @ShippedDate, 
					  ShipVia = @ShipVia, Freight = @Freight, ShipName = @ShipName, 
					  ShipAddress = @ShipAddress, ShipCity = @ShipCity, ShipRegion = @ShipRegion, 
					  ShipPostalCode = @ShipPostalCode, ShipCountry = @ShipCountry
					WHERE OrderID = @OrderID
				END
		END
END
SET IDENTITY_INSERT Orders ON
smInsertUpdateOrders 10248, 'CHOPS', 4, '1996-07-03 00:00:00.000', '1996-07-15 00:00:00.000', '1996-07-10 00:00:00.000', 1, 30.00, 'Vins et alcools Chevalier', '59 rue de lAbbaye', 'Charleroi', NULL, 5022, 'BRAZIL', 'UPDATE';
ALTER PROCEDURE spInsertOrderDetails
(
@OrderID INT,
@ProductID INT ,
@UnitPrice MONEY,
@Quantity SMALLINT,
@Discount REAL
)
AS
BEGIN
		INSERT INTO [Order Details](OrderID,ProductID,UnitPrice,Quantity,Discount)
		VALUES (@OrderID,@ProductID,@UnitPrice,@Quantity,@Discount)

END
spInsertOrderDetails  10249,11,21.0,50,0

CREATE PROCEDURE spUpdateOrderDetails
(
@OrderID INT,
@ProductID INT ,
@UnitPrice MONEY,
@Quantity SMALLINT,
@Discount REAL
)
AS
BEGIN
		UPDATE [Order Details] 
		SET UnitPrice = @UnitPrice, Quantity = @Quantity, Discount = @Discount
		WHERE OrderID = @OrderID AND ProductID = @ProductID
END

spUpdateOrderDetails  10249,1,100,13,0.20

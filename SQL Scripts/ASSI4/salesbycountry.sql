ALTER PROCEDURE spSalesbyCountry
@StartingDate Date,
@EndingDate Date
AS
BEGIN 
SELECT Employees.Country, SUM([Order Details].Quantity * [Order Details].UnitPrice) AS [Total Sale]
FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
WHERE Orders.OrderDate BETWEEN @StartingDate AND @EndingDate
GROUP BY Employees.Country
END
spSalesbyCountry '1996-06-01','1996-08-01'
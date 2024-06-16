CREATE VIEW AllOrders AS
SELECT o.OrderID, o.OrderDate, c.FirstName, c.LastName, od.ProductID, p.ProductName, od.Quantity, od.UnitPrice
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;

CREATE VIEW AvailableProducts AS
SELECT ProductID, ProductName, Stock
FROM Products
WHERE Stock > 0;

CREATE VIEW CustomerAddresses AS
SELECT c.CustomerID, c.FirstName, c.LastName, cd.Address
FROM Customers c
JOIN CustomerDetails cd ON c.CustomerID = cd.CustomerID;


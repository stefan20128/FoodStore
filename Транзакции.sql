START TRANSACTION;

INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber)
VALUES ('Иван', ' Иванов', 'ivan@example.com', '1234567890');

INSERT INTO Products (ProductName, Price)
VALUES ('Протеинов шейкър', 19.99);

COMMIT;
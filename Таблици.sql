create database foodstore;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber) VALUES
('John', 'Doe', 'john.doe@example.com', '123456789'),
('Jane', 'Smith', 'jane.smith@example.com', '987654321'),
('Jim', 'Beam', 'jim.beam@example.com', '555666777');


CREATE TABLE CustomerDetails (
    CustomerDetailID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    Address VARCHAR(255),
    DateOfBirth DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO CustomerDetails (CustomerID, Address, DateOfBirth) VALUES
(1, '123 Main St', '1980-01-01'),
(2, '456 Elm St', '1990-02-02'),
(3, '789 Oak St', '1985-03-03');


CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    Stock INT
);

INSERT INTO Products (ProductName, Description, Price, Stock) VALUES
('Protein Powder', 'High-quality whey protein powder.', 29.99, 50),
('Vitamin D', 'Vitamin D3 supplement.', 19.99, 100),
('Omega-3', 'Fish oil capsules.', 24.99, 75);

CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactName VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

INSERT INTO Suppliers (SupplierName, ContactName, Phone, Address) VALUES
('Supplier1', 'Alice', '111222333', '101 First St'),
('Supplier2', 'Bob', '444555666', '202 Second St'),
('Supplier3', 'Charlie', '777888999', '303 Third St');

CREATE TABLE ProductSuppliers (
    ProductID INT,
    SupplierID INT,
    PRIMARY KEY (ProductID, SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO ProductSuppliers (ProductID, SupplierID) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3);


CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2023-06-15', 49.98),
(2, '2023-06-16', 29.99),
(3, '2023-06-17', 24.99);

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 29.99),
(1, 2, 1, 19.99),
(2, 1, 1, 29.99),
(3, 3, 1, 24.99);

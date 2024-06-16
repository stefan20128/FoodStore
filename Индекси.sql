CREATE INDEX idx_product_name ON Products(ProductName);

CREATE INDEX idx_customer_name ON Customers(FirstName, LastName);

CREATE INDEX idx_supplier_name_prefix ON Suppliers(SupplierName(5));




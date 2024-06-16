CREATE ROLE db_admin;
CREATE ROLE product_manager;
CREATE ROLE order_manager;

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'password';
GRANT db_admin TO 'admin_user'@'localhost';

CREATE USER 'product_user'@'localhost' IDENTIFIED BY 'password';
GRANT product_manager TO 'product_user'@'localhost';

CREATE USER 'order_user'@'localhost' IDENTIFIED BY 'password';
GRANT order_manager TO 'order_user'@'localhost';

GRANT ALL PRIVILEGES ON foodstore.* TO 'admin_user'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE ON foodstore.Products TO 'product_user'@'localhost';

GRANT SELECT (OrderID, CustomerID, OrderDate, TotalAmount) ON foodstore.Orders TO 'order_user'@'localhost';


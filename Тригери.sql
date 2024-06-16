-- Before и After Insert Тригери
DELIMITER //
CREATE TRIGGER BeforeOrderDetailsInsert
BEFORE INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    IF NEW.Quantity <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quantity must be positive';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER AfterOrderDetailsInsert
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Products
    SET Stock = Stock - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END;
//
DELIMITER ;


-- Before и After Update Тригери
DELIMITER //
CREATE TRIGGER BeforeProductUpdate
BEFORE UPDATE ON Products
FOR EACH ROW
BEGIN
    IF NEW.Price <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Price must be positive';
    END IF;
END;
//
DELIMITER ;

DELIMITER //


DELIMITER //

CREATE TRIGGER AfterProductUpdate
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    UPDATE OrderDetails 
    SET UnitPrice = NEW.Price
    WHERE ProductID = NEW.ProductID;

    UPDATE ProductSuppliers 
    SET UnitPrice = NEW.Price
    WHERE ProductID = NEW.ProductID;
END;
//
DELIMITER ;


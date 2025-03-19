-- Create a View for orders with quantity greater than 2
CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, Bill_Amount
FROM Orders
WHERE Quantity > 2;

-- Get order details for orders with total cost greater than 150
SELECT
    c.CustomerID,
    c.FullName,
    o.OrderID,
    o.TotalCost,
    m.Cuisine,
    mi.CourseName
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Menus m ON o.MenuID = m.MenuID
INNER JOIN MenuItems mi ON m.MenuItemsID = mi.MenuItemsID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost;

-- Stored procedure to get the order with the maximum quantity
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS "Max Quantity in Order"
    FROM Orders;
END;

CALL GetMaxQuantity();

-- Prepared statement to get order details using user input order ID
PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost FROM Orders WHERE OrderID = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Stored procedure to cancel a booking
DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER //
CREATE PROCEDURE CancelBooking(IN CancelID INT)
BEGIN
    DELETE FROM Bookings WHERE BookingID = CancelID;
    SELECT CONCAT("Order ", CancelID, " is cancelled.") AS Confirmation;
END;
DELIMITER ;

CALL CancelBooking(5);

-- Stored procedure to update a booking's table number
CREATE PROCEDURE UpdateBooking(IN UpdateID INT, IN TableNo INT)
BEGIN
    UPDATE Bookings
    SET TableNumber = TableNo
    WHERE BookingID = UpdateID;
END;

CALL UpdateBooking(6, 1);

-- Check the bookings table after update
SELECT * FROM Bookings;

-- Drop old procedure and create a new procedure to add a booking
DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER //
CREATE PROCEDURE AddBooking (IN AddBookingID INT, IN AddBookingDate DATE, IN AddTableNo INT, IN AddCustomerID INT, IN AddEmployeeNum INT)
BEGIN
    INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID, EmployeeID)
    VALUES (AddBookingID, AddBookingDate, AddTableNo, AddCustomerID, AddEmployeeNum);
    SELECT CONCAT("New Booking ID ", AddBookingID, " Added.") AS Confirmation;
END;
DELIMITER ;

-- Call the procedure to add a booking
CALL AddBooking(5, '2022-12-30', 4, 3, 1);

-- Create a stored procedure to make a booking
DELIMITER //
CREATE PROCEDURE MakeBooking (IN booking_id INT, IN customer_id INT, IN table_no INT, IN booking_date DATE)
BEGIN
    INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID)
    VALUES (booking_id, booking_date, table_no, customer_id);
    SELECT "New booking added" AS Confirmation;
END;
DELIMITER ;

CALL MakeBooking(5, '2022-12-30', 4, 3);

-- Check the bookings table
SELECT * FROM Bookings;

-- Stored procedure to check whether a table is already booked
DROP PROCEDURE IF EXISTS CheckBooking;

DELIMITER //
CREATE PROCEDURE CheckBooking (IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE bookedTable INT DEFAULT 0;
    SELECT COUNT(*) INTO bookedTable
    FROM Bookings
    WHERE BookingDate = booking_date AND TableNumber = table_number;
    
    IF bookedTable > 0 THEN
        SELECT CONCAT("Table ", table_number, " is already booked.") AS "Booking status";
    ELSE
        SELECT CONCAT("Table ", table_number, " is not booked.") AS "Booking status";
    END IF;
END;
DELIMITER ;

-- Call the procedure to check if a table is booked
CALL CheckBooking('2022-12-30', 5);

-- Check the bookings table
SELECT * FROM Bookings;


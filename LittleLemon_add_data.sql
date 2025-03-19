-- Create the Menus table
CREATE TABLE Menus (
    MenuID INT,
    ItemID INT,
    Cuisine VARCHAR(100),
    PRIMARY KEY (MenuID)
);

-- Insert values into the Menus table
INSERT INTO Menus (MenuID, ItemID, Cuisine)
VALUES
    (1, 1, 'Greek'),
    (1, 7, 'Greek'),
    (1, 10, 'Greek'),
    (1, 13, 'Greek'),
    (2, 3, 'Italian'),
    (2, 9, 'Italian'),
    (2, 12, 'Italian'),
    (2, 15, 'Italian'),
    (3, 5, 'Turkish'),
    (3, 17, 'Turkish'),
    (3, 11, 'Turkish'),
    (3, 16, 'Turkish');

-- Create the MenuItems table
CREATE TABLE MenuItems (
    ItemID INT AUTO_INCREMENT,
    Name VARCHAR(200),
    Type VARCHAR(100),
    Price INT,
    PRIMARY KEY (ItemID)
);

-- Insert values into the MenuItems table
INSERT INTO MenuItems (ItemID, Name, Type, Price)
VALUES
    (1, 'Olives', 'Starters', 5),
    (2, 'Flatbread', 'Starters', 5),
    (3, 'Minestrone', 'Starters', 8),
    (4, 'Tomato bread', 'Starters', 8),
    (5, 'Falafel', 'Starters', 7),
    (6, 'Hummus', 'Starters', 5),
    (7, 'Greek salad', 'Main Courses', 15),
    (8, 'Bean soup', 'Main Courses', 12),
    (9, 'Pizza', 'Main Courses', 15),
    (10, 'Greek yoghurt', 'Desserts', 7),
    (11, 'Ice cream', 'Desserts', 6),
    (12, 'Cheesecake', 'Desserts', 4),
    (13, 'Athens White wine', 'Drinks', 25),
    (14, 'Corfu Red Wine', 'Drinks', 30),
    (15, 'Turkish Coffee', 'Drinks', 10),
    (16, 'Turkish Coffee', 'Drinks', 10),
    (17, 'Kabasa', 'Main Courses', 17);

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT,
    GuestFirstName VARCHAR(100) NOT NULL,
    GuestLastName VARCHAR(100) NOT NULL,
    ContactNumber INT,
    PRIMARY KEY (CustomerID)
);

-- Insert values into the Customers table
INSERT INTO Customers (CustomerID, GuestFirstName, GuestLastName, ContactNumber)
VALUES
    (1, 'Vanessa', 'McCarthy', 111111),
    (2, 'Marcos', 'Romero', 222222),
    (3, 'Anna', 'Iversen', 333333),
    (4, 'Joakim', 'Iversen', 444444),
    (5, 'Diana', 'Pinto', 555555),
    (6, 'Hiroki', 'Yamane', 666666);

-- Create the Bookings table
CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT,
    TableNo INT,
    CustomerID INT,
    BookingSlot TIME NOT NULL,
    EmployeeID INT,
    PRIMARY KEY (BookingID)
);

-- Insert values into the Bookings table
INSERT INTO Bookings (BookingID, TableNo, CustomerID, BookingSlot, EmployeeID)
VALUES
    (1, 12, 3, '19:00:00', 1),
    (2, 12, 4, '19:00:00', 1),
    (3, 19, 1, '15:00:00', 3),
    (4, 15, 2, '17:30:00', 4),
    (5, 5, 6, '18:30:00', 2),
    (6, 8, 5, '20:00:00', 5);

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT,
    TableNo INT,
    MenuID INT,
    BookingID INT,
    Quantity INT,
    Bill_Amount INT,
    PRIMARY KEY (OrderID)
);

-- Insert values into the Orders table
INSERT INTO Orders (OrderID, TableNo, MenuID, BookingID, Quantity, BillAmount)
VALUES
    (1, 12, 1, 1, 2, 86),
    (2, 19, 2, 2, 1, 37),
    (3, 15, 2, 3, 1, 37),
    (4, 5, 3, 4, 1, 40),
    (5, 8, 1, 5, 1, 43);

-- Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT,
    Name VARCHAR(200),
    Role VARCHAR(100),
    Address VARCHAR(200),
    Contact_Number INT,
    Email VARCHAR(100),
    Annual_Salary INT,
    PRIMARY KEY (EmployeeID)
);

-- Insert values into the Employees table
INSERT INTO Employees (EmployeeID, Name, Role, Address, Contact_Number, Email, Annual_Salary)
VALUES
    (1, 'Mario Gollini', 'Manager', '724, Parsley Lane, Old Town, Chicago, IL', 351258074, 'Mario.g@littlelemon.com', 70000),
    (2, 'Adrian Gollini', 'Assistant Manager', '334, Dill Square, Lincoln Park, Chicago, IL', 351474048, 'Adrian.g@littlelemon.com', 65000),
    (3, 'Giorgos Dioudis', 'Head Chef', '879 Sage Street, West Loop, Chicago, IL', 351970582, 'Giorgos.d@littlelemon.com', 50000),
    (4, 'Fatma Kaya', 'Assistant Chef', '132 Bay Lane, Chicago, IL', 351963569, 'Fatma.k@littlelemon.com', 45000),
    (5, 'Elena Salvai', 'Head Waiter', '989 Thyme Square, EdgeWater, Chicago, IL', 351074198, 'Elena.s@littlelemon.com', 40000),
    (6, 'John Millar', 'Receptionist', '245 Dill Square, Lincoln Park, Chicago, IL', 351584508, 'John.m@littlelemon.com', 35000);

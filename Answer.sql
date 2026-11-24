-- Week 7 Assignment: Database Design and Normalization


-- ==========================================
-- Question 1: Achieving First Normal Form (1NF)
-- ==========================================

-- Create a new table where each row contains only one product.
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    PRIMARY KEY (OrderID, Product)
);

-- Insert each product separately instead of storing multiple
-- products in one column.

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


-- ==========================================
-- Question 2: Achieving Second Normal Form (2NF)
-- ==========================================

-- The original composite primary key is (OrderID, Product).
-- CustomerName depends only on OrderID, creating a partial dependency.
-- To fix this, customer information is moved into a separate Orders table.


-- Create the Orders table to store order and customer information.
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);


-- Create the OrderItems table to store products and quantities.
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


-- Insert each order and its customer information.
INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');


-- Insert the products and quantities for each order.
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

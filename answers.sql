-- Question 1: Achieving 1NF
-- ProductDetail table
CREATE TABLE ProductDetail (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    Products VARCHAR(255)
)

-- Insert sample data into ProductDetail table
INSERT INTO ProductDetail VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');

-- New table in 1NF
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

-- Insert sample data into ProductDetail_1NF table
INSERT INTO ProductDetail_1NF VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');



-- Question 2: Achieving 2NF
-- Original 1NF table
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255),
    Quantity INT
);

-- Insert sample data into ProductDetail_1NF table
INSERT INTO ProductDetail_1NF VALUES
(101, 'John Doe', 'Laptop', 1),
(101, 'John Doe', 'Mouse', 2),
(102, 'Jane Smith', 'Tablet', 1),
(102, 'Jane Smith', 'Keyboard', 1),
(102, 'Jane Smith', 'Mouse', 3),
(103, 'Emily Clark', 'Phone', 1);

-- Create Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Insert sample data into Customer table
INSERT INTO Customer VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Create  new OrderDetail table
CREATE TABLE OrderDetail_2NF (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (CustomerID) REFERENCES Customer(OrderID)
);

-- Insert sample data into OrderDetail_2NF table
INSERT INTO OrderDetail_2NF VALUES
(101, 'Laptop', 1),
(101, 'Mouse', 2),
(102, 'Tablet', 1),
(102, 'Keyboard', 1),
(102, 'Mouse', 3),
(103, 'Phone', 1);

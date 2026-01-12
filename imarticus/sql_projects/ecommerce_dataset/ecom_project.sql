CREATE DATABASE e_commerce_order_trends;

USE e_commerce_order_trends;

CREATE TABLE Users (
UserID INT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100) UNIQUE,
PasswordHash VARCHAR(255),
Role ENUM('Admin', 'Customer'),
CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Customers (
CustomerID INT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100),
Phone VARCHAR(15),
Address TEXT,
CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE Products (
ProductID INT AUTO_INCREMENT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(50),
Price DECIMAL(10, 2),
Stock INT,
Description TEXT,
ImageURL VARCHAR(255),
CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE Orders (
OrderID INT AUTO_INCREMENT PRIMARY KEY,
CustomerID INT,
OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
TotalAmount DECIMAL(10, 2),
Status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled'),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);



CREATE TABLE OrderDetails (
OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
Price DECIMAL(10, 2),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


CREATE TABLE Coupons (
CouponID INT AUTO_INCREMENT PRIMARY KEY,
Code VARCHAR(50),
DiscountPercentage DECIMAL(5, 2),
ExpiryDate DATE,
UsageLimit INT,
CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE OrderCoupons (
OrderCouponID INT AUTO_INCREMENT PRIMARY KEY,
OrderID INT,
CouponID INT,
DiscountAmount DECIMAL(10, 2),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (CouponID) REFERENCES Coupons(CouponID)
);


CREATE TABLE ProductReviews (
ReviewID INT AUTO_INCREMENT PRIMARY KEY,
ProductID INT,
CustomerID INT,
Rating INT CHECK (Rating BETWEEN 1 AND 5),
ReviewText TEXT,
ReviewDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE Shipments (
ShipmentID INT AUTO_INCREMENT PRIMARY KEY,
OrderID INT,
Carrier VARCHAR(100),
TrackingNumber VARCHAR(100),
ShippedDate TIMESTAMP,
EstimatedDeliveryDate TIMESTAMP,
DeliveredDate TIMESTAMP,
Status ENUM('Shipped', 'In Transit', 'Delivered', 'Failed'),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


CREATE TABLE Cart (
CartID INT AUTO_INCREMENT PRIMARY KEY,
CustomerID INT,
ProductID INT,
Quantity INT,
AddedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- INSERT VALUES INTO THE TABLE 

INSERT INTO Users (Name, Email, PasswordHash, Role)
VALUES
('Admin User', 'admin@example.com', 'hashedpassword1', 'Admin'),
('John Doe', 'john.doe@example.com', 'hashedpassword2', 'Customer'),
('Jane Smith', 'jane.smith@example.com', 'hashedpassword3', 'Customer'),
('Alice Brown', 'alice.brown@example.com', 'hashedpassword4', 'Customer'),
('Bob White', 'bob.white@example.com', 'hashedpassword5', 'Customer'),
('Michael Brown', 'michael.brown@example.com', 'hashedpassword4', 'Customer'),
('Sarah Johnson', 'sarah.johnson@example.com', 'hashedpassword5', 'Customer');

INSERT INTO Customers (Name, Email, Phone, Address)
VALUES
('John Doe', 'john.doe@example.com', '1234567890', '123 Elm St, New York'),
('Jane Smith', 'jane.smith@example.com', '0987654321', '456 Oak St, California'),
('Alice Brown', 'alice.brown@example.com', '1122334455', '789 Pine St, Texas'),
('Bob White', 'bob.white@example.com', '5566778899', '159 Maple St, Florida'),
('Michael Brown', 'michael.brown@example.com', '1122334455', '789 Pine St, Texas'),
('Sarah Johnson', 'sarah.johnson@example.com', '6677889900', '321 Birch St, Florida');


INSERT INTO Products (ProductName, Category, Price, Stock, Description, ImageURL)
VALUES
('Laptop', 'Electronics', 1000.00, 20, 'High-performance laptop', 'http://example.com/laptop.jpg'),
('Headphones', 'Accessories', 50.00, 100, 'Noise-cancelling headphones', 'http://example.com/headphones.jpg'),
('Smartphone', 'Electronics', 800.00, 30, 'Latest smartphone model', 'http://example.com/smartphone.jpg'),
('Backpack', 'Accessories', 40.00, 50, 'Stylish and durable backpack', 'http://example.com/backpack.jpg'),
('Gaming Console', 'Electronics', 500.00, 15, 'Next-gen gaming console', 'http://example.com/console.jpg'),
('Wireless Mouse', 'Accessories', 25.00, 200, 'Ergonomic wireless mouse', 'http://example.com/mouse.jpg'),
('Smartwatch', 'Electronics', 300.00, 40, 'Feature-packed smartwatch', 'http://example.com/smartwatch.jpg');


INSERT INTO Orders (CustomerID, TotalAmount, Status, OrderDate)
VALUES
(1, 1050.00, 'Shipped', '2024-12-01'),
(2, 850.00, 'Delivered', '2024-11-28'),
(3, 525.00, 'Delivered', '2024-11-30'),
(4, 325.00, 'Shipped', '2024-12-05');


INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES
(1, 1, 1, 1000.00),
(1, 2, 1, 50.00),
(2, 3, 1, 800.00),
(2, 4, 1, 40.00),
(3, 5, 1, 500.00),
(3, 6, 1, 25.00),
(4, 7, 1, 300.00);


INSERT INTO Coupons (Code, DiscountPercentage, ExpiryDate, UsageLimit)
VALUES
('WELCOME10', 10.00, '2024-12-31', 100),
('FESTIVE20', 20.00, '2024-12-25', 50),
('HOLIDAY15', 15.00, '2024-12-31', 75);



INSERT INTO OrderCoupons (OrderID, CouponID, DiscountAmount)
VALUES
(1, 1, 100.00),
(2, 2, 170.00),
(3, 3, 78.75);



INSERT INTO ProductReviews (ProductID, CustomerID, Rating, ReviewText)
VALUES
(1, 1, 5, 'Excellent laptop! Highly recommend.'),
(2, 2, 4, 'Great headphones, but a bit pricey.'),
(5, 3, 5, 'Amazing gaming experience!'),
(6, 4, 4, 'Great wireless mouse, very responsive.');



INSERT INTO Shipments (OrderID, Carrier, TrackingNumber, ShippedDate, EstimatedDeliveryDate, DeliveredDate, Status)
VALUES
(1, 'FedEx', 'TRACK123', '2024-12-02', '2024-12-05', NULL, 'In Transit'),
(2, 'UPS', 'TRACK456', '2024-11-29', '2024-12-03', '2024-12-03', 'Delivered'),
(3, 'DHL', 'TRACK789', '2024-12-01', '2024-12-06', '2024-12-06', 'Delivered'),
(4, 'FedEx', 'TRACK101', '2024-12-06', '2024-12-10', NULL, 'In Transit');



INSERT INTO Cart (CustomerID, ProductID, Quantity, AddedDate)
VALUES
(1, 4, 1, '2024-12-10'),
(2, 2, 2, '2024-12-09'),
(3, 7, 1, '2024-12-08'),
(4, 5, 1, '2024-12-09');


select * from cart;

select * from coupons;

select * from customers;

select * from ordercoupons;

select * from orderdetails;

select * from orders;

select * from productreviews;

select * from products;

select * from shipments;
 
select * from users;


-- Questions to the Database


-- Q.1 What are the average prices of products by category, filtered to only show categories with an average price greater than $100?

SELECT Category, AVG(Price) AS AVG_PRODUCT_PRICE 
FROM Products 
GROUP BY Category 
HAVING AVG_PRODUCT_PRICE > 100;


-- Q.2 What are the top 5 best-selling products?

SELECT p.ProductName, SUM(od.Quantity) AS TOTAL_QUANTITY_SOLD
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TOTAL_QUANTITY_SOLD DESC
LIMIT 5;


-- Q3. Write a trigger that automatically updates the stock of a product when an order is placed.

DELIMITER //
CREATE TRIGGER UpdateStockAfterOrder
AFTER INSERT ON orderdetails
FOR EACH ROW
BEGIN
    UPDATE products 
    SET Stock = Stock - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END //
DELIMITER ;

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES
(1, 1, 1, 1000.00);

SELECT * FROM orderdetails;

SELECT * FROM products;


-- Q.4 Which products have received 5-star reviews?

SELECT DISTINCT p.ProductName, pr.Rating
FROM Products p
JOIN ProductReviews pr ON p.ProductID = pr.ProductID
WHERE pr.Rating = 5;


-- Q.5 How much discount has been applied to each order?

SELECT orders.OrderID, OrderCoupons.DiscountAmount
FROM Orders 
JOIN OrderCoupons OrderCoupons ON orders.OrderID = OrderCoupons.OrderID;


-- Q.6 How many orders were placed each month?

SELECT MONTH(OrderDate) AS Month, COUNT(*) AS Totalorders
FROM Orders
GROUP BY MONTH(OrderDate); 

-- SELECT MONTHNAME(OrderDate) AS MONTH, COUNT(OrderID) AS ORDER_COUNT
-- FROM Orders
-- GROUP BY MONTH
-- ORDER BY MONTH(OrderDate);


-- Q.7 Create a view that shows all orders along with customer names and order statuses, and how can you query this view to get all 'Shipped' orders?

CREATE VIEW OrderSummary AS
SELECT o.OrderID, c.Name AS CUSTOMER_NAME, o.Status, o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

SELECT * FROM OrderSummary WHERE Status = 'Shipped';


-- Q.8 Which customers have spent the most?

SELECT c.Name, SUM(o.TotalAmount) AS TOTAL_SPENT
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Name
ORDER BY TOTAL_SPENT DESC;


-- Q.9 What is the average rating and total reviews for each product? 	

SELECT p.ProductName, AVG(pr.Rating) AS AVERAGE_RATING, COUNT(pr.ReviewID) AS TOTAL_REVIEWS
FROM Products p
LEFT JOIN ProductReviews pr ON p.ProductID = pr.ProductID
GROUP BY p.ProductName;


-- Q.10 How many shipments were handled by each carrier? 

SELECT Carrier, COUNT(ShipmentID) AS TOTAL_SHIPMENTS
FROM Shipments
GROUP BY Carrier;


-- Q.11 Which orders were placed in the year 2024?

SELECT * FROM Orders WHERE YEAR(OrderDate) = 2024;


-- Q.12 How can you rank customers based on their total spending using a window function?

SELECT Name, TOTAL_SPEND,
RANK() OVER (ORDER BY TOTAL_SPEND DESC) AS SPENDING_RANK
FROM (
    SELECT c.Name, SUM(o.TotalAmount) AS TOTAL_SPEND
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.Name
) AS CUSTOMER_TOTALS;


-- Q.13  What is the delivery time for each completed order?

SELECT OrderID, ShippedDate, DeliveredDate,
DATEDIFF(DeliveredDate, ShippedDate) AS DAYS_TO_DELIVER
FROM Shipments
WHERE Status = 'Delivered';


-- Q14. How can products be categorized by price range?

SELECT ProductName, Price,
CASE 
    WHEN Price < 50 THEN 'Budget'
    WHEN Price BETWEEN 50 AND 500 THEN 'Mid-Range'
    ELSE 'Premium'
END AS PRICE_CATEGORY
FROM Products;


-- Q.15 How many unique delivered orders were made by each customer?

SELECT c.Name, COUNT(DISTINCT o.OrderID) AS DELIVERED_ORDER_COUNT
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.Status = 'Delivered'
GROUP BY c.Name;

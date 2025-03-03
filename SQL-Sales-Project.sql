CREATE DATABASE Stores;

USE Stores;


CREATE TABLE sales_data (
    sales_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity_sold INT,
    total_sales DECIMAL(10,2),
    sales_date DATE
);

INSERT INTO sales_data (customer_id, product_id, quantity_sold, total_sales, sales_date)
VALUES 
(1, 101, 2, 50.00, '2024-01-10'),
(2, 102, 1, 30.00, '2024-01-11'),
(3, 103, 4, 120.00, '2024-01-12'),
(4, 101, 3, 75.00, '2024-01-13'),
(5, 104, 2, 40.00, '2024-01-14');


CREATE TABLE customer_data (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    location VARCHAR(255)
);

INSERT INTO customer_data (first_name, last_name, email, location)
VALUES 
('Alice', 'Johnson', 'alice@email.com', 'New York'),
('Bob', 'Williams', 'bob@email.com', 'California'),
('Charlie', 'Miller', 'charlie@email.com', 'Texas'),
('David', 'Anderson', 'david@email.com', 'Florida'),
('Eve', 'Martinez', 'eve@email.com', 'Illinois');

CREATE TABLE product_data (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255),
    category VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INT
);

INSERT INTO product_data (product_name, category, price, stock_quantity)
VALUES 
('Laptop', 'Electronics', 1000.00, 10),
('Smartphone', 'Electronics', 800.00, 20),
('Headphones', 'Accessories', 150.00, 30),
('Monitor', 'Electronics', 300.00, 15),
('Keyboard', 'Accessories', 50.00, 50);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    total_price DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customer_data(customer_id),
    FOREIGN KEY (product_id) REFERENCES product_data(product_id)
);

INSERT INTO orders (customer_id, product_id, order_date, quantity, total_price)
VALUES 
(1, 1, '2024-02-01', 1, 1000.00),
(2, 2, '2024-02-02', 2, 1600.00),
(3, 3, '2024-02-03', 3, 450.00),
(4, 4, '2024-02-04', 1, 300.00),
(5, 5, '2024-02-05', 4, 200.00);


-- List all sales data
-- Query: Write a query to retrieve all columns from the sales_data table.

SELECT * FROM sales_data;

SELECT * FROM customer_data;

-- Find total sales by customer
-- Query: Write a query to find the total sales amount (total_sales) 
-- made by each customer. Group the results by customer_id.

SELECT customer_id, SUM(Total_sales) AS Amount
FROM Sales_data
GROUP BY customer_id;


-- Get the product with the highest price
-- Query: Write a query to find the product with 
-- the highest price from the product_data table.

SELECT * FROM product_data;

SELECT product_name
FROM product_data
WHERE price > 800;


-- Count the number of products in stock
-- Query: Write a query to get the total stock quantity (stock_quantity)
-- of all products from the product_data table.
SELECT 
SUM(stock_quantity) AS total_stock_quantity 
FROM product_data;


-- Find all orders made in February 2024
-- Query: Write a query to retrieve all orders 
-- (order_id, customer_id, product_id, order_date, quantity, and total_price) made in February 2024 from the orders table.
SELECT * FROM orders
WHERE order_date >= '2024-2-1';

-- Join sales_data and customer_data
-- Query: Write a query to join the sales_data table with the customer_data 
-- table based on the customer_id and display the customer’s first_name, last_name, sales_date, and total_sales.

SELECT cus.customer_id, first_name, last_name, total_sales, sales_date
FROM sales_data AS sal
INNER JOIN customer_data AS cus
		ON cus.customer_id = sal.customer_id;


-- Find the total number of sales for each product
-- Query: Write a query to find the total number of products sold (quantity_sold) 
-- for each product_id from the sales_data table. 
-- Group the results by product_id.

SELECT product_id, SUM(quantity_sold) AS total_quantity_sold FROM sales_data
GROUP BY product_id;


-- Check product stock levels and sales quantity
-- Query: Write a query to list the product_name, stock_quantity (from product_data), 
-- and total quantity sold (from sales_data), showing the products with sales.

SELECT pro.product_id, pro.product_name, pro.stock_quantity, 
SUM(sal.quantity_sold) AS total_quantity_sold 
FROM product_data AS pro
INNER JOIN sales_data AS sal
	ON sal.sales_id = pro.product_id
GROUP BY pro.product_id, pro.product_name, pro.stock_quantity;
	
-- List customers from specific locations
-- Query: Write a query to find all customers who are from California or Texas in the customer_data table.   

SELECT * FROM customer_data
WHERE location IN ('California' ,'Texas');

-- Show the most recent order for each customer
-- Query: Write a query to display the most recent order (order_id, order_date, total_price) 
-- for each customer. Group the results by customer_id.

SELECT order_id, order_date, total_price 
FROM orders 
WHERE order_date = (SELECT MAX(order_date) FROM orders
 WHERE orders.customer_id = orders.customer_id);

;
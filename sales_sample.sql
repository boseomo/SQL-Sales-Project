CREATE DATABASE Sales_Trend;

USE Sales_Trend;

CREATE TABLE sales(
sales_id INTEGER PRIMARY KEY AUTO_INCREMENT,
product_id INTEGER,
quantity_sold INT,
sale_date DATE,
total_price DECIMAL(10,2)

);

INSERT INTO sales(salesquantity_sold, sale_date, total_price)
VALUES(101, 5, '2024-01-01', 2500.00),
	(102, 3, '2024-01.02', 900.00),
    (103, 2, '2024-01-02', 60.00),
    (104, 4, '2024-01-03', 80.00),
    (105, 6, '2024-01-03', 90.00);
    
SELECT * FROM sales;

drop database Sales_Trend;
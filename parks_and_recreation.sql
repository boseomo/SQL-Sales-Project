CREATE DATABASE parks_and_recreation;

USE parks_and_recreation;

CREATE TABLE employee_demographics (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    gender VARCHAR(50),
    age INT
);


INSERT INTO employee_demographics (first_name, last_name, gender, age)
VALUES 
('John', 'Doe', 'Male', 30),
('Jane', 'Smith', 'Female', 28),
('Michael', 'Brown', 'Male', 35),
('Emily', 'Davis', 'Female', 40),
('Chris', 'Wilson', 'Male', 45);
	
    
CREATE TABLE employee_salary (
    employee_id INT PRIMARY KEY,
    job_title VARCHAR(255),
    salary DECIMAL(10,2),
    FOREIGN KEY (employee_id) REFERENCES employee_demographics(employee_id)
);

 INSERT INTO employee_salary (employee_id, job_title, salary)
VALUES 
(1, 'Data Analyst', 70000.00),
(2, 'Software Engineer', 90000.00),
(3, 'Project Manager', 85000.00),
(4, 'HR Specialist', 65000.00),
(5, 'Business Analyst', 72000.00);

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

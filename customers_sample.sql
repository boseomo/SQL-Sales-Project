CREATE DATABASE Tref_Smart;
USE Tref_Smart;

CREATE TABLE customers(customer_id INTEGER PRIMARY KEY AUTO_INCREMENT,
Name TEXT,
Address TEXT,
Email TEXT,
Phone TEXT);

INSERT INTO customers (Name, Address, Email, Phone)VALUES("Ganiu", "slughter", "ganiu@gmail.com", "7182920132");
INSERT INTO customers (Name, Address, Email, Phone)VALUES("Azzies", "slughter", "azzies@gmail.com", "7182920132");
INSERT INTO customers (Name, Address, Email, Phone)VALUES("Kingsley", "Ibadan", "kingsley@gmail.come", "8329320393");
INSERT INTO customers (Name, Address, Email, Phone)VALUES("ojo Ganiu", "slughter", "ojoganiu@gmail.com", "7182920132");
INSERT INTO customers (Name, Address, Email, Phone)VALUES("Nene Edwin", "slughter", "neneedwinu@gmail.com", "7182920132");
INSERT INTO customers (Name, Address, Email, Phone)VALUES("Emmanuel James", "slughter", "Emmanuel@gmail.com", "7182920132");
INSERT INTO customers (Name, Address, Email, Phone)VALUES("Dolapo", "slughter", "dolapo@gmail.com", "7182920132");
INSERT INTO customers (Name, Address, Email, Phone)VALUES("Hakeem Alaro", "slughter", "alaro@gmail.com", "7182920132");
INSERT INTO customers (Name, Address, Email, Phone)VALUES("Ayomide", "slughter", "Ayomide@gmail.com", "7182920132");
INSERT INTO customers (Name, Address, Email, Phone)VALUES("Ola Ijoba", "slughter", "olau@gmail.com", "7182920132");
INSERT INTO customers (Name, Address, Email, Phone)VALUES("Sarah", "slughter", "sarah@gmail.com", "7182920132");

CREATE TABLE accounts (customer_id INTEGER PRIMARY KEY AUTO_INCREMENT,
customers_id integer,
deposit integer,
withdraw integer,
balance integer);

INSERT INTO accounts(id, deposit, withdraw, balance)VALUES(1, 2000, 1000, 10000);

SELECT * FROM customers;

/* cross join */
SELECT * FROM accounts, customers;

DROP TABLE accounts;
drop database tref_smarts;
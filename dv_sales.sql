CREATE DATABASE sales;
CREATE TABLE Hub_Employees (
    employee_id INT PRIMARY KEY,
);
CREATE TABLE Hub_Customers (
    customer_id INT PRIMARY KEY,
);
CREATE TABLE Hub_Products (
    product_id INT PRIMARY KEY,
);
CREATE TABLE Lnk_Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES Hub_Customers(customer_id),
    employee_id INT NOT NULL REFERENCES Hub_Employees(employee_id),
    order_date DATE
);

CREATE TABLE Lnk_OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL REFERENCES Lnk_Orders(order_id),
    product_id INT NOT NULL REFERENCES Hub_Products(product_id)
);
CREATE TABLE Sat_Employees (
    employee_id INT NOT NULL REFERENCES Hub_Employees(employee_id),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20)
);
CREATE TABLE Sat_Customers (
    customer_id INT NOT NULL REFERENCES Hub_Customers(customer_id),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(200)
);
CREATE TABLE Sat_Products (
    product_id INT NOT NULL REFERENCES Hub_Products(product_id),
    product_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2)
);
CREATE TABLE Sat_Orders (
    order_id INT NOT NULL REFERENCES Lnk_Orders(order_id),
    total_amount DECIMAL(10, 2)
);
CREATE TABLE Sat_OrderItems (
    order_item_id INT NOT NULL REFERENCES Lnk_OrderItems(order_item_id),
    quantity INT,
    unit_price DECIMAL(10, 2)
);

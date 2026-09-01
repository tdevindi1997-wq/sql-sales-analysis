-- SQL Sales Analysis
-- Creating the database tables

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- Insert customer data

INSERT INTO customers (customer_id, customer_name, city)
VALUES
(1, 'Kasun Perera', 'Colombo'),
(2, 'Nimali Silva', 'Kandy'),
(3, 'Amal Fernando', 'Galle'),
(4, 'Tharushi Jayasuriya', 'Negombo'),
(5, 'Dilan Peris', 'Colombo'),
(6, 'Sachini Wijesinghe', 'Kurunegala'),
(7, 'Ruwan Bandara', 'Matara'),
(8, 'Hiruni Senanayake', 'Kandy'),
(9, 'Nuwan Dias', 'Colombo'),
(10, 'Piumi Karunaratne', 'Gampaha');


-- Insert product data

INSERT INTO products (product_id, product_name, category, price)
VALUES
(1, 'Laptop', 'Electronics', 850.00),
(2, 'Smartphone', 'Electronics', 650.00),
(3, 'Headphones', 'Electronics', 120.00),
(4, 'Keyboard', 'Accessories', 45.00),
(5, 'Mouse', 'Accessories', 25.00),
(6, 'Monitor', 'Electronics', 300.00),
(7, 'USB Cable', 'Accessories', 15.00),
(8, 'Webcam', 'Electronics', 90.00),
(9, 'Printer', 'Electronics', 220.00),
(10, 'Laptop Bag', 'Accessories', 60.00);

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


-- Insert sales data

INSERT INTO sales (sale_id, customer_id, product_id, quantity, sale_date)
VALUES
(1, 1, 1, 1, '2026-01-05'),
(2, 2, 2, 2, '2026-01-08'),
(3, 3, 3, 1, '2026-01-12'),
(4, 4, 4, 3, '2026-01-15'),
(5, 5, 5, 2, '2026-01-18'),
(6, 1, 6, 1, '2026-02-02'),
(7, 6, 7, 5, '2026-02-07'),
(8, 7, 8, 2, '2026-02-10'),
(9, 8, 9, 1, '2026-02-14'),
(10, 9, 10, 2, '2026-02-20'),
(11, 10, 1, 1, '2026-03-03'),
(12, 2, 3, 2, '2026-03-08'),
(13, 3, 5, 4, '2026-03-12'),
(14, 4, 2, 1, '2026-03-18'),
(15, 5, 6, 2, '2026-03-22'),
(16, 6, 4, 3, '2026-04-01'),
(17, 7, 1, 2, '2026-04-05'),
(18, 8, 8, 1, '2026-04-10'),
(19, 9, 2, 3, '2026-04-15'),
(20, 10, 7, 6, '2026-04-20');

-- ============================================
-- SALES ANALYSIS QUERIES
-- ============================================

-- 1. Electronics products

SELECT product_name
FROM products
WHERE category = 'Electronics';


-- 2. Products priced above $100

SELECT product_name, price
FROM products
WHERE price > 100;


-- 3. Products sorted by price (highest to lowest)

SELECT product_name, price
FROM products
ORDER BY price DESC;


-- 4. Number of products in each category

SELECT category,
       COUNT(product_id) AS product_count
FROM products
GROUP BY category;


-- 5. Total revenue by product

SELECT product_name,
       SUM(quantity * price) AS total_revenue
FROM products P
JOIN sales S
USING (product_id)
GROUP BY product_name
ORDER BY total_revenue DESC;

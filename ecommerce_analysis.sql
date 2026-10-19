-- 1. Create and select Database
CREATE DATABASE IF NOT EXISTS ecommerce_analytics;
USE ecommerce_analytics;

-- 2. Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50),
    signup_date DATE
);

-- 3. Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10, 2)
);

-- 4. Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    shipping_days INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Sample Customers
INSERT INTO customers VALUES
(101, 'Sophia Martinez', 'USA', '2025-01-15'),
(102, 'Liam Smith', 'UK', '2025-02-10'),
(103, 'Aarav Patel', 'India', '2025-03-05'),
(104, 'Emma Wilson', 'Canada', '2025-03-20'),
(105, 'Lucas Brown', 'Germany', '2025-04-12');

-- Insert Sample Products
INSERT INTO products VALUES
(201, 'Wireless Mouse', 'Electronics', 25.00),
(202, 'Mechanical Keyboard', 'Electronics', 85.00),
(203, 'Ergonomic Chair', 'Furniture', 250.00),
(204, 'Desk Lamp', 'Furniture', 45.00),
(205, 'USB-C Cable', 'Electronics', 15.00);

-- Insert Sample Orders
INSERT INTO orders VALUES
(1001, 101, 203, '2025-05-01', 1, 3),
(1002, 102, 201, '2025-05-03', 2, 5),
(1003, 101, 202, '2025-05-10', 1, 2),
(1004, 103, 205, '2025-05-12', 4, 7),
(1005, 104, 203, '2025-06-01', 2, 4),
(1006, 105, 204, '2025-06-15', 3, 2),
(1007, 102, 202, '2025-06-18', 1, 6),
(1008, 101, 205, '2025-07-02', 2, 1);

-- Query 1: Total Revenue and Average Order Value (AOV)
SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(o.quantity * p.unit_price) AS total_revenue,
    ROUND(AVG(o.quantity * p.unit_price), 2) AS avg_order_value
FROM orders o
JOIN products p ON o.product_id = p.product_id;

-- Query 2: Product Category Performance
SELECT 
    p.category,
    SUM(o.quantity) AS total_units_sold,
    SUM(o.quantity * p.unit_price) AS category_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

-- Query 3: Customer Value Segmentation
SELECT 
    c.customer_name,
    c.country,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity * p.unit_price) AS total_spent,
    CASE 
        WHEN SUM(o.quantity * p.unit_price) >= 300 THEN 'High Value'
        WHEN SUM(o.quantity * p.unit_price) BETWEEN 100 AND 299 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name, c.country
ORDER BY total_spent DESC;
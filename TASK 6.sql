CREATE DATABASE sales;
USE sales;
CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    amount INT  NOT NULL,
    product_id INT NOT NULL
);
INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 100.00, 101),
(2, TO_DATE('2024-01-20', 'YYYY-MM-DD'), 150.00, 102),
(3, TO_DATE('2024-02-05', 'YYYY-MM-DD'), 200.00, 103),
(4, TO_DATE('2024-02-28', 'YYYY-MM-DD'), 300.00, 104),
(5, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 120.00, 101),
(6, TO_DATE('2024-03-18', 'YYYY-MM-DD'), 250.00, 105),
(7, TO_DATE('2024-03-21', 'YYYY-MM-DD'), 180.00, 106),
(8, TO_DATE('2024-04-01', 'YYYY-MM-DD'), 500.00, 107),
(9, TO_DATE('2024-04-15', 'YYYY-MM-DD'), 220.00, 101);
SELECT 
    EXTRACT(MONTH FROM order_date) AS order_month
FROM 
    online_sales;
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), 
    EXTRACT(MONTH FROM order_date);
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), 
    EXTRACT(MONTH FROM order_date);
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), 
    EXTRACT(MONTH FROM order_date);
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), 
    EXTRACT(MONTH FROM order_date)
ORDER BY 
    order_year ASC, 
    order_month ASC;
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales
WHERE 
    order_date BETWEEN TO_DATE('2024-01-01', 'YYYY-MM-DD') AND TO_DATE('2024-03-31', 'YYYY-MM-DD')
GROUP BY 
    EXTRACT(YEAR FROM order_date), 
    EXTRACT(MONTH FROM order_date)
ORDER BY 
    order_year, 
    order_month;
# Task 6: Sales Trend Analysis Using Aggregations

# Objective:

Analyze monthly revenue and order volume using SQL aggregations on the `online_sales` table.

# Tools Used:

* MY SQL 
* Dataset: `online_sales` (with fields: `order_id`, `order_date`, `amount`, `product_id`)

# Files in This Repository:

| File Name           | Description                                                                              |
| ------------------- | ---------------------------------------------------------------------------------------- |
| `TASK 6.sql`        | SQL script for table creation, insertion, and analysis queries                           |
| `TASK 6 OUTPUT.txt` | Output of each query execution (with timestamps and errors)                              |
| `SQL QUERY+OUTPUT.pdf`| PDF version of query results (for report submission)                                   |

# Mini Guide: SQL Features Used

| Feature                          | Explanation                               |
| -------------------------------- | ----------------------------------------- |
| `EXTRACT(MONTH FROM order_date)` | Extracts the month part of the date       |
| `GROUP BY EXTRACT(YEAR, MONTH)`  | Groups records by year and month          |
| `SUM(amount)`                    | Calculates monthly revenue                |
| `COUNT(DISTINCT order_id)`       | Calculates unique order volume            |
| `ORDER BY`                       | Sorts result chronologically              |
| `TO_DATE()`                      | Converts string to Oracle-compatible date |
| `WHERE`                          | Used for filtering specific date ranges   |

# SQL Query Summary

# 1. Extract Month from Order Date

```sql
SELECT EXTRACT(MONTH FROM order_date) AS order_month FROM online_sales;
```

# 2. Group by Year and Month

```sql
SELECT EXTRACT(YEAR FROM order_date) AS order_year,
       EXTRACT(MONTH FROM order_date) AS order_month
FROM online_sales
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);
```

# 3. Sum for Revenue

```sql
SELECT EXTRACT(YEAR FROM order_date) AS order_year,
       EXTRACT(MONTH FROM order_date) AS order_month,
       SUM(amount) AS total_revenue
FROM online_sales
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);
```

# 4. Count for Volume

```sql
SELECT EXTRACT(YEAR FROM order_date) AS order_year,
       EXTRACT(MONTH FROM order_date) AS order_month,
       COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);
```

# 5. Sorted Combined Query

```sql
SELECT EXTRACT(YEAR FROM order_date) AS order_year,
       EXTRACT(MONTH FROM order_date) AS order_month,
       SUM(amount) AS total_revenue,
       COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY order_year ASC, order_month ASC;
```

# 6. Filtered Time Period (Jan–Mar 2024)

```sql
SELECT EXTRACT(YEAR FROM order_date) AS order_year,
       EXTRACT(MONTH FROM order_date) AS order_month,
       SUM(amount) AS total_revenue,
       COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
WHERE order_date BETWEEN TO_DATE('2024-01-01', 'YYYY-MM-DD') 
                     AND TO_DATE('2024-03-31', 'YYYY-MM-DD')
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY order_year, order_month;
```

# Outcome:

* Understood how to group data using `EXTRACT`.
* Learned how to aggregate monthly revenue and order volume.
* Practiced filtering and sorting SQL data in Oracle.


USE final_project;

-- Q.1 Top Customers by Revenue 
SELECT 
    customer_id,
    SUM(total_amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(total_amount) DESC) AS customer_rank
FROM orders
GROUP BY customer_id;


-- Q.2 Running Revenue Trend
SELECT 
    order_date,
    SUM(total_amount) AS daily_revenue,
    SUM(SUM(total_amount)) OVER (ORDER BY order_date) AS cumulative_revenue
FROM orders
GROUP BY order_date;


-- Q.3 Repeat vs New Customers
SELECT 
    customer_id,
    COUNT(order_id) AS total_orders,
    CASE 
        WHEN COUNT(order_id) = 1 THEN 'New'
        ELSE 'Repeat'
    END AS customer_type
FROM orders
GROUP BY customer_id;

-- Q.4 Customer Retention Cohort (Window Logic)

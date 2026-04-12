USE final_project;

/* Q.1 Find each country's average order value per customer. Show two columns: country and avg_order_value. 
	   Sort the results by average order value, in ascending order.			*/
WITH average_per_customer AS (
  SELECT
    c.customer_id,
    country,
    AVG(total_amount) AS avg_order_value
  FROM customers c
  JOIN orders o
    ON c.customer_id = o.customer_id
  GROUP BY c.customer_id, country
)
SELECT country, AVG(avg_order_value) AS avg_order_value
FROM average_per_customer
GROUP BY country
ORDER BY avg_order_value;


/* Q.2 Find out the average number of orders placed in the last 180 days by customers who have been active 
       (made a purchase) in the last 30 days. Name the column avg_order_count.		*/
WITH orders_per_customer AS (
	SELECT c.customer_id,  COUNT(o.order_id) as order_count
	FROM customers c
	INNER JOIN orders o
	ON c.customer_id = o.customer_id
	WHERE datediff(curdate(), last_order_date) <= 30
	AND datediff(curdate(),order_date)<=180
	GROUP BY c.customer_id)
SELECT AVG(order_count) AS avg_order_count
FROM orders_per_customer;


/* Q.3 The average order value per customer in France is 1564.853 . Now, for each French customer with an 
       average order value above that, show the following columns: customer_id, full_name, and avg_order_value. 
       Order the results by average order value, in descending order.		*/
SELECT cu.customer_id, full_name, 
	AVG(total_amount) avg_order_value
FROM customers cu INNER JOIN orders od
ON cu.customer_id = od.customer_id
WHERE country = 'France'
GROUP BY cu.customer_id, full_name
HAVING avg_order_value > 1564.853
ORDER BY avg_order_value DESC;





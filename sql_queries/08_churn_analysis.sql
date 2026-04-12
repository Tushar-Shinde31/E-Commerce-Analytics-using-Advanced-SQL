USE final_project;

/* Q.1 Out of customers registered in 2017, find the number of churned customers. Define a churned customer as 
       one who hasn't placed an order in more than 60 days. Show the count in a column named churned_customers. */
SELECT COUNT(*) AS churned_customers
FROM customers
WHERE DATEDIFF(CURDATE(), last_order_date) > 60
  AND registration_date >= '2017-01-01'
  AND registration_date <  '2018-01-01';
  

/* Q.2 Find the number of churned customers in monthly registration basis from 2017. In this exercise, churned customers 
	   are those who haven't placed an order in more than 45 days. Show the following columns: month and 
       churned_customers. Order the results by month.  */
SELECT
  MONTH(registration_date) AS month,
  COUNT(*) AS churned_customers
FROM customers
WHERE datediff(curdate(), last_order_date) > 45
  AND registration_date >= '2017-01-01'
  AND registration_date <  '2018-01-01'
GROUP BY MONTH(registration_date)
ORDER BY MONTH(registration_date);


/* Q.3 Find the number of churned customers in weekly signup from 2017. In this exercise, churned customers are 
       those who haven't placed an order in 30 days. Show the following columns: week and churned_customers. 
       Order the results by week.  */
SELECT
  WEEK(registration_date) AS week,
  COUNT(*) AS churned_customers
FROM customers
WHERE DATEDIFF(CURDATE(), last_order_date) > 30
  AND registration_date >= '2017-01-01'
  AND registration_date < '2018-01-01'
GROUP BY WEEK(registration_date)
ORDER BY WEEK(registration_date);






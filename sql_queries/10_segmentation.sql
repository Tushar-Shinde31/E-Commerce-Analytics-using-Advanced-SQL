USE final_project;

/* Q.1 Find the number of "good customers" in weekly signup from the first quarter of 2017. Define a good customer 
	as one whose average total order amount was above $1450.00. Show the following columns:
	year – the year of registration.
	week – the week of registration.
	percent_of_good_customers – the percent of good customers.
	Order the results by year and week.			*/
WITH average_total_amount AS (
  SELECT
		c.customer_id,
		registration_date,
		AVG(total_amount) AS average_total_amount
  FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  WHERE registration_date >= '2017-01-01' AND registration_date < '2017-04-01'
  GROUP BY c.customer_id, registration_date
)
SELECT
  YEAR(registration_date) AS year,
  WEEK(registration_date) AS week,
  COUNT(CASE
    WHEN average_total_amount > 1450
    THEN average_total_amount
  END) * 100.0 / COUNT(average_total_amount) AS percent_of_good_customers
FROM average_total_amount
GROUP BY
  YEAR(registration_date),
  WEEK(registration_date)
ORDER BY
  YEAR(registration_date),
  WEEK(registration_date);


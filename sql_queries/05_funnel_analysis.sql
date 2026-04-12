USE final_project;

/* Q.1 Create a conversion chart for monthly registration. Show the following columns:
	   year
	   month
	   registered_count
	   no_sale
	   three_days – the number of customers who made a purchase within 3 days from registration.
	   first_week – the number of customers who made a purchase during the first week but not within the first three days.
	   after_first_week – the number of customers who made a purchase after the 7th day.   
       Order the results by year and month.		*/
SELECT YEAR(registration_date) year, MONTH(registration_date) month, COUNT(customer_id) registered_count,
COUNT(CASE 
		WHEN first_order_date IS NULL THEN 1 END) AS no_sale,
COUNT(CASE 
		WHEN DATEDIFF(first_order_date, registration_date) BETWEEN 0 AND 3 THEN 1 END) three_days,
COUNT(CASE 
		WHEN DATEDIFF(first_order_date, registration_date) BETWEEN 4 AND 7 THEN 1 END) first_week,
COUNT(CASE 
		WHEN DATEDIFF(first_order_date, registration_date) > 7 THEN 1 END) after_first_week
FROM customers
GROUP BY YEAR,MONTH
ORDER BY YEAR,MONTH;



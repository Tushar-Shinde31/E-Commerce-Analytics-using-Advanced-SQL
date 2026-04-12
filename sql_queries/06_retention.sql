USE final_project;

/* Q.1 Find the number of active customers in each country. Show two columns: country and active_customers 
	   (number of those who have placed an order within the last 30 days). Do you see any major differences 
       between countries?		*/
SELECT country, 
	COUNT(*) active_customers
FROM customers WHERE DATEDIFF(CURDATE(), last_order_date) <= 30
GROUP BY country;


/* Q.2 Find the number of active customers in quarterly registration basis. Active customers are customers who've 
	   made a purchase in the last 14 days. Show three columns: year, quarter, and active_customers. Order the rows 
       by year and quarter.  */
SELECT YEAR(registration_date) AS year,
	QUARTER(registration_date) AS quarter,
	COUNT(*) as active_customers 
FROM customers
WHERE DATEDIFF(CURDATE(),last_order_date)<=14 
GROUP BY YEAR, QUARTER;





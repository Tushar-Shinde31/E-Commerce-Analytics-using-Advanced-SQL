USE final_project;

/*  Q.1 Among customers registered in 2017, show how many made at least one purchase 
		  (name the column customers_with_purchase) and the number of all the customers registered in 2017 
		  (name the column all_customers). */
SELECT COUNT(*) AS all_customers,
	COUNT(first_order_id) AS customers_with_purchase
FROM customers
WHERE YEAR(registration_date)=2017;


/*  Q.2 Find the lifetime conversion rate among customers who registered in 2017. 
	      Show the result in a column named conversion_rate. Round the result to four decimal places.  */
SELECT ROUND((COUNT(first_order_id) / COUNT(*))*100 , 4) AS conversion_rate
FROM customers
WHERE YEAR(registration_date) = '2017' AND registration_date <  '2018-01-01';


/*  Q.3 Find the conversion rate for each customer channel. Show the channel_name and conversion_rate columns. 
		Display the conversion rates as percentages rounded to two decimal places.   */
SELECT channel_name,
	ROUND((COUNT(first_order_id)/COUNT(*) )* 100 , 2) AS conversion_rate
FROM customers cs
INNER JOIN channels ch ON cs.channel_id = ch.id
GROUP BY channel_name;


/*  Q.4 Create a report showing conversion rates in monthly basis. Display the conversion rates as ratios, 
          rounded to three decimal places. Show the following columns: year, month, and conversion_rate. 
		  Order the results by year and month.		*/
SELECT YEAR(registration_date) year, 
	MONTH(registration_date) month, 
	ROUND(COUNT(first_order_id)/COUNT(customer_id),3) ratios
FROM customers
GROUP BY year,month
ORDER BY year, month;


/*  Q.5 Create a report containing the conversion rates for weekly registration in each registration channel, 
	   based on customers registered in 2017. Show the following columns: week, channel_name, and conversion_rate. 
	   Format the conversion rates as percentages, rounded to a single decimal place. Order the results by week 
	   and channel name.			*/
SELECT WEEK(registration_date) WEEK, 
	ch.channel_name, 
	ROUND((COUNT(first_order_id)/COUNT(*))*100,1) AS conversion_rate
FROM customers c INNER JOIN channels ch ON c.channel_id=ch.id
WHERE YEAR(registration_date) = '2017'
GROUP BY WEEK,channel_name
ORDER BY WEEK,channel_name;


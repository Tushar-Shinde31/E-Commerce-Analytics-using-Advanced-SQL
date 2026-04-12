USE final_project;

/* Q.1 Show customers' emails and interval between their first purchase and the date of registration. 
	   Name the column difference.   */
-- approach1
SELECT email, first_order_date, registration_date,
	TIMESTAMPDIFF(DAY,registration_date,first_order_date) AS difference 
FROM customers
WHERE first_order_date IS NOT NULL;

-- approach2
SELECT email, 
	DATEDIFF(first_order_date,registration_date) AS difference
FROM customers
WHERE first_order_date IS NOT NULL;


/* Q.2 Find the average time from registration to first order for each channel. Show two columns: 
       channel_name and avg_days_to_first_order.		*/
SELECT channel_name,
	AVG(DATEDIFF(first_order_date,registration_date)) AS avg_days_to_first_order
FROM customers cs 
INNER JOIN channels ch ON cs.channel_id = ch.id
WHERE first_order_date IS NOT NULL
GROUP BY channel_name;


/* Q.3 Calculate the average number of days that passed between registration and first order in quarterly registration 
	   basis. Show the following columns: year, quarter, and avg_days_to_first_order. Order the results by year 
       and quarter.  */
SELECT YEAR(registration_date) year, 
	QUARTER(registration_date) AS quarter, 
	AVG(DATEDIFF(first_order_date,registration_date)) AS avg_days_to_first_order
FROM customers
WHERE first_order_date IS NOT NULL
GROUP BY year,quarter
ORDER BY  year,quarter;


/* Q.4 Create a report of the average time to first order for weekly registration basis from 2017 in each 
       registration channel. Show the following columns: week, channel_name, and avg_days_to_first_order. 
       Order the results by the week.			*/
SELECT WEEK(registration_date) AS week, channel_name,
	AVG(DATEDIFF(first_order_date,registration_date)) AS avg_days_to_first_order
FROM customers cs 
INNER JOIN channels ch ON cs.channel_id = ch.id
WHERE first_order_date IS NOT NULL
	AND year(registration_date) >= 2017
group by week ,channel_name 
order by week;


/* Q.5 Find all customers who placed their first order within one month from registration, and their last order 
	   within three months from registration – let's see who's stopped ordering. For each customer show these 
       columns: email, full_name, first_order_date, last_order_date.		*/
SELECT email, full_name, first_order_date, last_order_date
FROM customers
WHERE first_order_date BETWEEN
	registration_date AND DATE_ADD(registration_date, INTERVAL 1 MONTH) AND
last_order_date BETWEEN
	registration_date AND DATE_ADD(registration_date, INTERVAL 3 MONTH);








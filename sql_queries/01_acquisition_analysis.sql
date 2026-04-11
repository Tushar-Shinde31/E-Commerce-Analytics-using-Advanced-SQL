USE final_project;

-- Q.1 Customers registered in first 6 months of 2017
-- approach1
SELECT COUNT(customer_id) AS registration_count
FROM customers
WHERE registration_date 
BETWEEN '2017-01-01' and '2017-06-30';

-- approach2
SELECT COUNT(customer_id) FROM customers 
WHERE registration_date >= '2017-01-01' 
AND registration_date <=  '2017-06-30';

-- approach3
SELECT COUNT(customer_id) registration_count 
FROM customers WHERE 
YEAR(registration_date)= 2017 
AND MONTH(registration_date) BETWEEN 1 AND 6;

-- approach4
SELECT count(customer_id) reg_count
FROM customers
WHERE year(registration_date) = 2017 AND month(registration_date) <= 06;

-- approach5
SELECT COUNT(customer_id) AS registration_count
FROM customers
WHERE registration_date >= '2017-01-01' 
AND registration_date < DATE_ADD('2017-01-01', INTERVAL 6 MONTH);


-- Q.2 Show the number of registrations in the current week. Name the column registrations_current_week.
-- approach1
SELECT COUNT(*) AS registration_count 
FROM customers
WHERE DATEDIFF(CURDATE(),  registration_date) <= 7;

-- approch2
SELECT COUNT(*) as registrations_current_week 
FROM customers
WHERE YEAR(registration_date) = YEAR(CURDATE())
AND WEEK(registration_date,1) = WEEK(CURDATE(), 1);


-- Q.3 Create a report containing the 2017 monthly registration counts. Show the registration_month and registration_count columns. Order the results by month.
SELECT MONTH(registration_date) as registration_month, 
	COUNT(*) as registration_count
FROM customers 
WHERE YEAR(registration_date) = '2017'
GROUP BY MONTH(registration_date)
ORDER BY registration_month;


-- Q.4 Find the registration count for each month in each year. Show the following columns: registration_year, registration_month, and registration_count. Order the results by year and month.
SELECT YEAR(registration_date) AS registrtion_year,
        MONTH(registration_date) AS registration_month,
        COUNT(*) as registration_count
FROM customers
GROUP BY YEAR(registration_date),MONTH(registration_date)
ORDER BY  registrtion_year, registration_month ;


-- Q.5 Write an SQL query to find the number of customer registrations per year for each channel.
SELECT ch.channel_name , 
	YEAR(c.registration_date) as reg_year,
COUNT(*) as reg_count
FROM customers c 
INNER JOIN channels ch ON c.channel_id = ch.id
GROUP BY ch.channel_name , reg_year 
ORDER BY  reg_year ;


-- Q.6 Write an SQL query to find the number of customer registrations per year for organic search channel
-- approch1
SELECT  ch.channel_name , 
	YEAR(c.registration_date) AS reg_year,
COUNT(*) as reg_count
FROM customers c 
INNER JOIN channels ch ON c.channel_id = ch.id
GROUP BY ch.channel_name , reg_year 
HAVING channel_name = 'Organic Search'
ORDER BY reg_year ;

-- approch2
SELECT ch.channel_name, year(c.registration_date) as reg_year, count(*) AS reg_count
FROM customers c
INNER JOIN channels ch
ON c.channel_id = ch.id
WHERE ch.channel_name = 'Organic Search'
GROUP BY ch.channel_name, reg_year
ORDER BY reg_year;


-- Q.7 Create a report to show the weekly counts of registration in 2017, based on the customer country. Show the following columns: registration_week, country, and registration_count. Order the results by week.
SELECT WEEK(registration_date) registration_week,country,
	COUNT(registration_date) registration_count
FROM customers
WHERE YEAR(registration_date)='2017'
GROUP BY registration_week,country
ORDER BY registration_week;




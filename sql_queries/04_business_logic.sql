USE final_project;

/* Q.1 Our e-store has used three versions of the registration form:
	   'ver1' – introduced when the e-store started.
	   'ver2' – introduced on Mar 14, 2017.
	   'ver3' – introduced on Jan 1, 2018.
	   For each customer, select the customer_id, registration_date, and the form version the user filled 
       in at the time of registration. Name this third column registration_form.			*/
SELECT customer_id,registration_date, 
CASE 
	WHEN registration_date <'2017-03-14' THEN 'ver1'
	WHEN registration_date > '2018-01-01' THEN 'ver2'
	ELSE 'ver3' 
END AS 'registration_form'
FROM customers
ORDER BY registration_date;


/* Q.2 Show two metrics in two different columns:
       order_on_registration_date – the number of 
       people who made their first order within one day from their registration date.
       order_after_registration_date – the number of people who made their first order after their registration date.  */
SELECT COUNT(
CASE 
	WHEN DATEDIFF(first_order_date, registration_date)= 0 THEN 1 
END) order_on_registration_date,
COUNT(CASE 
	WHEN DATEDIFF(first_order_date, registration_date) > 0 THEN 1 
END) order_after_registration_date
FROM customers ;




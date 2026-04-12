USE final_project;

/* Q.1 Create a customer retention chart based on monthly signup for all years. It should have the following columns:
		year
		month
		percent_active_14d (the percentage of customers still active after 14 days).
		percent_active_30d (the percentage of customers still active after 30 days).
		Order the results by year and month.			*/
SELECT
    WEEK(registration_date) AS week,

    COUNT(
        CASE
            WHEN DATEDIFF(last_order_date, registration_date) > 10
            THEN customer_id
        END
    ) * 100.0 / COUNT(customer_id) AS percent_active_10d,

    COUNT(
        CASE
            WHEN DATEDIFF(last_order_date, registration_date) > 30
            THEN customer_id
        END
    ) * 100.0 / COUNT(customer_id) AS percent_active_30d,

    COUNT(
        CASE
            WHEN DATEDIFF(last_order_date, registration_date) > 60
            THEN customer_id
        END
    ) * 100.0 / COUNT(customer_id) AS percent_active_60d

FROM
    customers

WHERE
    registration_date >= '2017-01-01'
    AND registration_date < '2018-01-01'

GROUP BY
    WEEK(registration_date)

ORDER BY
    WEEK(registration_date);
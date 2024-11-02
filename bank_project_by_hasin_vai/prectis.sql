-- Active: 1730537862313@@127.0.0.1@3306@bank_datiles

--- count customar by GROUP BY city
SELECT COUNT(*) AS TOTAL, city, postal_code FROM customer GROUP BY CITY, `POSTAL_CODE`


--- Work With Multiple Where Clause
SELECT * FROM customer WHERE (CITY = 'Salem' AND `POSTAL_CODE` IN ('03079','03082')) OR (CITY = 'Wilmington' AND `POSTAL_CODE` IN ('01887','01888'))

--- Data from multiple tables according to different conditions
SELECT customer.cust_id, individual.first_name, individual.last_name, customer.postal_code, customer.address FROM customer, individual WHERE city = 'salem' AND customer.CUST_ID = individual.CUST_ID




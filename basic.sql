-- Active: 1730537862313@@127.0.0.1@3306@damo_rabbil_vai
--- starting Rabbile vai ar class prectise 
SELECT 'Hello world' as msg, 3+2 as sub, 3-2 as mai

--diclared variable in sql

SET @num1= 10; SET @num2 = 20, @num3 = 30

-- arithmetic operation
SELECT 
    @num1 + @num2 AS addition,
    @num1 - @num2 AS subtraction,
    @num1 * @num2 AS multiplication

--- power/ squer root/ round 
SELECT
    POWER (@num1,2) as squer,
    SQRT(@num1) as sqrt ,
    ROUND(@num3/@num2,2) as rounde

-- convert into letter case

SELECT LOWER("HELLO WORLD") as lower_case

SELECT REVERSE("HELLO world") AS reverse_case

-- conditional statements / if else statements
SELECT
    CASE
        WHEN @num1 > @num2 THEN @num1
        ELSE @num2
    END AS max_value

-- date time

SELECT NOW() AS curtime_now

SELECT CURDATE() AS curdate_now

SELECT CURTIME() AS curnt_time 

SELECT DATE_ADD(NOW(), INTERVAL 5 MINUTE) as future_time

SELECT DATE_SUB(NOW(), INTERVAL 5 MINUTE) as past_time

SELECT DATE_FORMAT(NOW(), "%Y, %M, %D") AS format_date

SELECT DATEDIFF("2024-10-22", "2003-07-28") AS timedeffernce

--- simple select query using Alias

SELECT a.name FROM categories a 
SELECT b.firstName FROM users b

-- joining Query users-> a categories ->b

SELECT a.firstName, a.lastName, a.id, b.name, b.id FROM users a INNER JOIN  categories b ON a.id=b.user_id

SELECT a.firstName, a.lastName, a.id, b.name  FROM users a LEFT JOIN categories b ON a.id=b.user_id

SELECT a.firstName, a.lastName, b.name, b.id FROM users a RIGHT JOIN categories b ON a.id=b.user_id

select a.firstName, a.lastName, b.name FROM users a CROSS JOIN categories b  ON a.id=b.user_id

-- there i try to count total selce amount 1st and 2nd i try to separate all the selce by the peyment_status like pending and successfull 
SELECT 
    SUM(payable) AS total_amount,
    COUNT(*) AS total_records,
    SUM(CASE WHEN payment_status = 'pending' THEN 1 ELSE 0 END) AS pending_count,
    SUM(CASE WHEN payment_status = 'success' THEN 1 ELSE 0 END) AS successful_count
FROM invoices
WHERE user_id = 1;










 
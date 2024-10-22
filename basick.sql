-- Active: 1728650081456@@127.0.0.1@3306@damo_rabbil_vai
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

-- conditional statements
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

CURDATE() as current_date, CURTIME() as current_time, NOW() as current_datetime
   
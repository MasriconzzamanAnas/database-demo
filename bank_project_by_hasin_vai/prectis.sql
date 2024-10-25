-- Active: 1728650081456@@127.0.0.1@3306@bank_datiles

--- count customar by GROUP BY city
SELECT COUNT(*) AS TOTAL, city, postal_code FROM customer GROUP BY CITY, `POSTAL_CODE`


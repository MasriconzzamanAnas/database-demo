-- Active: 1728650081456@@127.0.0.1@3306@demo_niamor_vai
-- 1. Select All Rows from the employees table
SELECT * FROM employees;

-- 2. Select Specific Columns (name, salary, city)
SELECT name, salary, city FROM employees;

-- 3. Where Clause (select employees with salary greater than 60000)
SELECT * FROM employees WHERE salary > 60000;

-- 4. Order By Clause (order employees by salary in descending order)
SELECT * FROM employees ORDER BY salary DESC; -- It shows big to small
SELECT * FROM employees ORDER BY salary ASC; -- It shows small to big

-- 5. Insert Data into the employees table
INSERT INTO employees (id,name, salary, designation, city) 
VALUES (31,'David King', 52000.00, 'Backend Developer', 'Boston');

-- 6. Update Data (update salary of a specific employee)
UPDATE employees 
SET salary = 57000.00 
WHERE name = 'David King';

-- 7. Delete Data (delete an employee based on name)
DELETE FROM employees WHERE name = 'David King';

-- 8. Count Rows (count the total number of employees)
SELECT COUNT(*) AS total_employees FROM employees;

-- 9. Group By Clause (group employees by city and get average salary in each city)
SELECT city, AVG(salary) AS average_salary
FROM employees
GROUP BY city;

-- 10. Having Clause (get cities where the average salary is greater than 60000)
SELECT city, AVG(salary) AS average_salary
FROM employees
GROUP BY city
HAVING AVG(salary) > 60000;

-- 11. Distinct Values (select distinct designations from the employees table)
SELECT DISTINCT designation FROM employees;





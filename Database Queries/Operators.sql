-- Show employees between King and Smith
SELECT * FROM employees
WHERE last_name BETWEEN 'King' AND 'Smith';

-- Show employees earning between 10000 and 15000
SELECT * FROM employees
WHERE salary BETWEEN 10000 AND 15000;

SELECT * FROM employees
WHERE salary >= 10000 AND salary <= 15000;

--Show employees hired between 1996 and 1998
SELECT * FROM employees 
WHERE hire_date BETWEEN '19960101' AND '19981231';

-- Show employees earning less than 10000 or more 15000
SELECT * FROM employees
WHERE salary NOT BETWEEN 10000 AND 15000;

SELECT * FROM employees
WHERE salary <= 10000 OR salary >= 15000;

-- Display employees working in departments 30, 60, 90
SELECT * FROM employees
WHERE department_id IN (30, 60, 90);

SELECT * FROM employees
WHERE department_id = 30 OR department_id = 60 OR department_id = 90;

-- Show employees with surname Hartstein and Vargas
SELECT * FROM employees 
WHERE last_name IN ('Hartstein' , 'Vargas')

SELECT * FROM employees
WHERE last_name = 'Hartstein' OR last_name = 'Vargas';


-- Show employees other than surname Hartstein and Vargas
SELECT * FROM employees 
WHERE last_name NOT IN ('Hartstein' , 'Vargas')

SELECT * FROM employees
WHERE last_name != 'Hartstein' OR last_name != 'Vargas';

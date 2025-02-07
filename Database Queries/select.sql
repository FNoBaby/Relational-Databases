USE Advanced_Diploma_DB

--Data Retrival

--Retrieve a List of ALL Employees
SELECT * FROM employees

--Retrieve first name, last name and salary of all employees
SELECT first_name , last_name , salary FROM employees

--Retrieve a list of all employees with salary grater than 15000
SELECT * FROM employees
WHERE salary > 15000

--Reproduce the previous query but replace the underscore with space in the heading

--Method one which allows spaces in aliases
SELECT first_name 'First Name', last_name 'Last Name', salary 'Salary' FROM employees
WHERE salary > 15000
--Method 2 using the AS keyword, bt no Spaces
SELECT first_name AS Name, last_name AS Surname, salary AS Salary FROM employees
WHERE salary > 15000
--Method 3, without quotes, we cannot have spaces
SELECT first_name FirstName, last_name LastName, salary Salary FROM employees
WHERE salary > 15000

--Retrieve a unique list of employee names
SELECT DISTINCT first_name FROM employees

--Reteive a unique list of salary
SELECT DISTINCT salary FROM employees

-- Expressions
-- Calculate a 10% bonus on salary for each employee
SELECT first_name , last_name , salary, 0.1 * salary AS Bonus FROM employees

-- Calculate total salary including bonus
SELECT first_name , last_name , salary, salary + ( 0.1 * salary ) 'Salary with Bonus' FROM employees

-- Calculate how long every employee has been working with the company
SELECT first_name, last_name, hire_date , DATEDIFF(YEAR, hire_date, GETDATE()) 'Years at Company' FROM employees

--Split the List of employees in two , those who do not earn a commission and those who do
SELECT * FROM employees
WHERE commission_pct IS NULL

SELECT * FROM employees
WHERE commission_pct IS NOT NULL

-- Retrieve a list of unique job ids that receive a commission
SELECT DISTINCT job_id FROM employees
WHERE commission_pct IS NOT NULL

--Concatination
-- Retrieve the first name, last name and full name of employees
SELECT first_name, last_name, first_Name + ' ' + last_name 'Full Name' FROM employees
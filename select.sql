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

--






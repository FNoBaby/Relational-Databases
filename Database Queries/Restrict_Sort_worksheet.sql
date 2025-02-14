--Worksheet 2

--2
SELECT last_name , salary 'Salary > 12000' FROM employees
WHERE salary > 12000;

--3
SELECT * FROM employees
WHERE employee_id = 176

--4
SELECT last_name , salary 'Salary > 12000' FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

--5
SELECT last_name AS Surname , job_id AS 'Job #' , hire_date AS 'Start Date' FROM employees
WHERE last_name IN ('Matos' , 'Taylor');

--6
SELECT last_name AS Surname , job_id AS 'Job #' , hire_date AS 'Start Date' FROM employees
WHERE last_name IN ('Matos' , 'Taylor')
ORDER BY job_id ASC;

--7
SELECT last_name AS Surname, department_id 'Dep #' FROM employees
WHERE department_id IN (20,50)
ORDER BY department_id ASC;

--8
SELECT last_name AS Surname , salary 'Salary > 12000' FROM employees
WHERE salary BETWEEN 5000 AND 12000 AND department_id IN (20 , 50)
ORDER BY department_id ASC;

--9
SELECT employee_id AS 'Emp #' , first_name + ' ' + last_name AS 'Employee Name' , hire_date AS 'Start Date' FROM employees
WHERE YEAR(hire_date) = 1994
ORDER BY hire_date ASC; 

--10
SELECT last_name , job_id FROM employees
WHERE manager_id IS NULL;

--11
SELECT last_name AS 'Employee Surname' , salary AS 'Salary' , commission_pct AS 'Commission %' FROM employees
WHERE commission_pct IS NOT NULL
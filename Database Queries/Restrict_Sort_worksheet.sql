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
WHERE commission_pct IS NOT NULL;

--12
SELECT employee_id , last_name , salary , department_id FROM employees
WHERE manager_id IN (101 , 103 , 107)
ORDER BY manager_id DESC;

--13
SELECT DISTINCT job_id FROM employees
WHERE job_id LIKE '%CLERK';

--14
SELECT last_name , first_name FROM employees
WHERE last_name LIKE '__a%'

--15
SELECT last_name , first_name FROM employees
WHERE last_name  LIKE '%a%' AND last_name LIKE '%e%'
ORDER BY last_name;

--16
SELECT first_name FROM employees
WHERE first_name LIKE '[LD]e%';

--17
SELECT last_name + ' works as ' + job_id AS INFO FROM employees
WHERE job_id LIKE '%[TR]';

--18
SELECT last_name , job_id , salary FROM employees
WHERE job_id LIKE 'ST%' 
AND salary NOT IN (2500 , 3500 , 7000);

--19
SELECT phone_number FROM employees
WHERE phone_number LIKE '[56][01]%[456]';

--20
SELECT first_name FROM employees
WHERE first_name LIKE '___[^N]' AND LEN(first_name) = 4;

--21
SELECT last_name , salary , commission_pct FROM employees
WHERE commission_pct = 0.2
ORDER BY last_name;
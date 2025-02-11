--1.a
-- True
SELECT last_name , job_id , salary AS Sal FROM employees;
--1.b
--True
SELECT * FROM job_grades;
--1.c
SELECT employee_id, last_name
sal x 12 ANNUAL SALARY
FROM employees;
-- No comma for selecting sal aswell
-- sal does not exist, but salary does
-- x is not for times, its *
-- it should be in '' as its a label

--Corrected Query
SELECT employee_id , last_name , salary * 12 'Annual Salary' FROM employees;


-- 2.a
SELECT * FROM jobs;

--3.
SELECT job_id 'Job Codes' FROM jobs;

--4.
SELECT DISTINCT job_id 'Job Codes' FROM jobs;

--5.
SELECT employee_id , last_name, job_id, hire_date 'Start Date' FROM employees;

--6.
SELECT last_name AS Surname , job_id 'Job Code' FROM employees;

--7.
SELECT last_name + ' ' + job_id 'Employee Info' FROM employees;

--8.
SELECT DISTINCT first_name AS Name FROM employees;

--9.
SELECT DISTINCT department_id , salary FROM employees;

--10.
SELECT first_name + '''s telephone number is ' + phone_number 'Contact Info' FROM employees;

--11.
SELECT job_title AS Job , max_salary 'Max Salary' , max_salary * 1.1 '10% Increase' FROM jobs;

--12.
SELECT last_name AS Surname , hire_date , hire_date + 30 FROM employees;

--13.
SELECT first_name + last_name 'Name Details' , salary , salary / 12 'Monthly Salary' FROM employees;
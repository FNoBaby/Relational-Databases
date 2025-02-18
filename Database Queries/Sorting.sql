--Sorting
--Sort the employees by the hire date
SELECT * FROM employees
ORDER BY hire_date;

--Sort the employees by hire date, latest first
SELECT * FROM employees
ORDER BY hire_date DESC;

--Assuming all Sales reps sold 10,000. Sort the employees by the highest income first
SELECT employee_id , first_name , last_name, salary + (commission_pct * 10000) AS 'Income' FROM employees
WHERE job_id = 'SA_REP' 
ORDER BY income DESC;

--Show a list of employees sorted by firstname and then lastname
SELECT * FROM employees
ORDER BY first_name , last_name;

--Repeat the previous query without using column names in the order clause
SELECT * FROM employees
ORDER BY 2 , 3;

--Conditional and Logical Operators
--Show employees whose job title contains 'MAN' and who earn 10,000 or more
SELECT * FROM employees 
WHERE job_id LIKE '%MAN%' AND salary >= 10000;

--Show employees whose job title contains 'MAN' or who earn 10,000 or more
SELECT * FROM employees 
WHERE job_id LIKE '%MAN%' OR salary >= 10000;


--Show employees whose job_id is neither IT_PROG nor SA_REP
SELECT * FROM employees
WHERE job_id NOT IN ('IT_PROG' , 'SA_REP');

--Show employees who have not been assigned to a department
SELECT * FROM employees
WHERE department_id IS NOT NULL;

-- Precedence: Notice the difference between these two queries
SELECT * FROM employees
WHERE job_id = 'SA_REP' OR job_id = 'AD_PRES' AND salary > 15000

SELECT * FROM employees
WHERE (job_id = 'SA_REP' OR job_id = 'AD_PRES') AND salary > 15000
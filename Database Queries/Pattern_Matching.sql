--Pattern Matching
-- Display details of employees whose surname starts with 'De'
SELECT * FROM employees
WHERE last_name LIKE 'De%';

--Display details of employees who have 'hi' somewhere in their surname
SELECT * FROM employees
WHERE last_name LIKE '%hi%';

--Display details of employees whose surname is 4 characters long and end with 2 consecutive letter 'l'
SELECT * FROM employees
WHERE last_name LIKE '%ll' AND LEN(last_name) = 4;

SELECT * FROM employees
WHERE last_name LIKE '__ll'; -- _ means any single character

--Show employees whose surname starts with A, B or C
SELECT * FROM employees
WHERE last_name LIKE 'A%' OR last_name LIKE 'B%' OR last_name LIKE 'C%';


SELECT * FROM employees
WHERE last_name LIKE '[A-C]%'; -- [] means any single character in the specified range

--Show employees whose surname starts with A, C or E
SELECT * FROM employees
WHERE last_name LIKE '[ACE]%'; -- In this case we don't have a range but a list of acceptable values

--Show employees whose second letter is the letter 'o'
SELECT * FROM employees
WHERE last_name LIKE '_o%';

-- Show employees whose surname does not start with A,B,C
SELECT * FROM employees
WHERE last_name LIKE '[^A-C]%'; -- ^ means not in a pattern

--Show employees whose job_id starts with a "SA_"
SELECT * FROM employees
WHERE job_id LIKE 'SA$_%' ESCAPE '$';


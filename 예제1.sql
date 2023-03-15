-- INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
-- VALUES 
--     (500000,'1996-12-23','Subin','Noh','F','2023-03-14'),
--     (500001,'1994-08-04','JinA','Kim','F','2023-03-15');
-- 
SELECT *
FROM employees
WHERE emp_no IN (500000, 500001);

-- INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date)
-- VALUES 
-- 		(500000, 'd009', '2023-03-14', '2043-03-15'),
-- 		(500001, 'd009', '2023-03-15', '9999-01-01');
-- 		

SELECT *
FROM dept_emp
WHERE emp_no IN (500000, 500001);

-- UPDATE  dept_manager
-- SET to_date = '2023-03-14'
-- where emp_no = 111939;

-- INSERT INTO dept_manager (dept_no, emp_no, from_date, to_date)
-- VALUES ('d009', 500000, '2023-03-14', '9999-01-01');

SELECT *
FROM dept_manager
WHERE dept_no = 'd009';

-- INSERT INTO titles (emp_no, title, from_date, to_date)
-- VALUES (500000, 'senior engineer', NOW(), '9999-01-01'),
--   		(500001, 'senior engineer', NOW(), '9999-01-01');
  		
SELECT *
FROM titles
WHERE emp_no IN (500000, 500001);

-- SELECT *
-- FROM salaries
-- WHERE salary IN (
--     SELECT MAX(salary) 
--     FROM salaries
-- ) OR salary IN (
--     SELECT MIN(salary) 
--     FROM salaries
-- );
-- 
-- SELECT first_name
-- FROM employees
-- WHERE emp_no = (
--     SELECT emp_no 
--     FROM salaries 
--     ORDER BY salary DESC 
--     LIMIT 1
-- );

SELECT e.first_name, s.salary, e.emp_no
FROM salaries s
JOIN employees e ON s.emp_no = e.emp_no
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no
WHERE s.salary IN (
    SELECT MAX(salary) 
    FROM salaries
) OR s.salary IN (
    SELECT MIN(salary) 
    FROM salaries
);

SELECT AVG(salary) AS avg_salary
FROM salaries;

SELECT AVG(salary) AS avg_499975
FROM salaries
WHERE emp_no = 499975;
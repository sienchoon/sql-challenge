--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM public."EMPLOYEES" as e
LEFT JOIN public."SALARIES" as s
ON s.emp_no = e.emp_no
ORDER BY e.emp_no ;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT e.first_name, e.last_name, e.hire_date
FROM public."EMPLOYEES" as e
WHERE e.hire_date IN (
	SELECT e.hire_date
	FROM public."EMPLOYEES" as e
	WHERE e.hire_date >= '1986-01-01' AND e.hire_date <= '1986-12-31'
	ORDER BY e.hire_date;
);

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d.dept_no, d.dept_name, 
		dm.emp_no, 
		e.last_name, e.first_name
FROM public."DEPARTMENTS" as d
LEFT JOIN public."DEPARTMENT_MANAGER" as dm
ON d.dept_no = dm.dept_no
LEFT JOIN public."EMPLOYEES" as e
ON dm.emp_no = e.emp_no;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name,
		d.dept_name
FROM public."EMPLOYEES" as e
LEFT JOIN public."DEPARTMENT_EMPLOYEES" as de
ON de.emp_no = e.emp_no
LEFT JOIN public."DEPARTMENTS" as d
ON de.dept_no = d.dept_no
ORDER BY e.emp_no;

--List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT e.first_name, e.last_name, e.sex 
FROM public."EMPLOYEES" as e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.

--this shows the dept_no
SELECT d.dept_no, d.dept_name
FROM public."DEPARTMENTS" AS d
WHERE d.dept_name = 'Sales';

--hard coding
SELECT e.emp_no, e.last_name, e.first_name, de.dept_no
FROM public."EMPLOYEES" as e 
LEFT JOIN (
	SELECT dept_no, emp_no
	FROM public."DEPARTMENT_EMPLOYEES" 
	WHERE dept_no = 'd007') AS de
ON de.emp_no = e.emp_no
RIGHT JOIN public."DEPARTMENTS" AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

--cleaner code
SELECT e.emp_no, e.last_name, e.first_name, de.dept_no
FROM public."EMPLOYEES" as e 
LEFT JOIN public."DEPARTMENT_EMPLOYEES" as de
ON e.emp_no = de.emp_no
RIGHT JOIN public."DEPARTMENTS" AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name,
		d.dept_name
FROM public."EMPLOYEES" as e
LEFT JOIN public."DEPARTMENT_EMPLOYEES" as de
ON e.emp_no = de.emp_no
LEFT JOIN public."DEPARTMENTS" as d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sale' or d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT e.last_name, COUNT(e.last_name) as "Frequency_Count_Last_Name"
FROM public."EMPLOYEES" as e
GROUP BY e.last_name
ORDER BY "Frequency_Count_Last_Name" DESC;
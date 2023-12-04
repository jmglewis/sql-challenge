--Queries: Data Analysis

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no As employee_number, 
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM employees e
INNER JOIN salaries s ON 
e.emp_no = s.emp_no
ORDER BY e.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT last_name, first_name, hire_date AS employee_hire_date
FROM employees
WHERE DATE_PART('year',hire_date) = 1986;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
    d.dept_no,
    d.dept_name,
    e.emp_no,
    e.last_name AS manager_last_name,
    e.first_name AS manager_first_name
FROM dept_manager AS dm
INNER JOIN departments d ON 
dm.dept_no = d.dept_no
INNER JOIN employees e ON
dm.emp_no = e.emp_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
INNER JOIN dept_emp AS de ON
  de.dept_no = d.dept_no
INNER JOIN employees AS e ON
  e.emp_no = de.emp_no
ORDER BY emp_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments as d
INNER JOIN dept_emp as de ON
  de.dept_no = d.dept_no
INNER JOIN employees as e ON
  e.emp_no = de.emp_no
WHERE 
	dept_name = 'Sales';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments as d
INNER JOIN dept_emp as de ON
  de.dept_no = d.dept_no
INNER JOIN employees as e ON
  e.emp_no = de.emp_no
WHERE 
	dept_name = 'Sales'
	OR dept_name = 'Development'
ORDER BY dept_name;

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "last name count"
FROM employees
GROUP BY last_name
ORDER BY "last name count" DESC;

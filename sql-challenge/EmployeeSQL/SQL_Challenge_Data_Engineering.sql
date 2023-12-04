-- Table Schema: Data Engineering 
-- Create departments table:
CREATE TABLE departments (
    dept_no VARCHAR(255),
    dept_name VARCHAR(255),
    PRIMARY KEY (dept_no)
);

SELECT * FROM departments

-- Create dept_emp table:
CREATE TABLE dept_emp (
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(255),
    PRIMARY KEY(emp_no, dept_no)
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp

-- Create dept_manager table:
CREATE TABLE dept_manager (
    dept_no VARCHAR(255),
    emp_no INTEGER NOT NULL,
    PRIMARY KEY(dept_no, emp_no)
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
	FOREIGN KEY(emp_no) REFERENCES salaries (emp_no)
);

SELECT * FROM dept_manager

-- Create employees table:
CREATE TABLE employees (
    emp_no INTEGER NOT NULL,
    emp_title_id VARCHAR(255),
    birth_date DATE NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex VARCHAR(255),
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no)
);

SELECT * FROM employees

-- Create salaries table:
CREATE TABLE salaries (
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    PRIMARY KEY (emp_no)
);

SELECT * FROM salaries

-- Create titles table:
CREATE TABLE titles (
    title_id VARCHAR(255),
    title VARCHAR(255),
    PRIMARY KEY (title_id)
);

SELECT * FROM titles

CREATE TABLE IF NOT EXISTS departments(
	--dept_id SERIAL PRIMARY KEY,
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR	
);

SELECT *
FROM departments;

CREATE TABLE IF NOT EXISTS employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);

SELECT *
FROM employees;

CREATE TABLE IF NOT EXISTS dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

SELECT *
FROM dept_emp;

CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no INT,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

SELECT *
FROM dept_manager;

CREATE TABLE salaries(
	emp_no INT,
	salaries INT,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

SELECT *
FROM salaries;

CREATE TABLE titles(
	title_id VARCHAR,
	title VARCHAR,
	FOREIGN KEY(title_id) REFERENCES employees(emp_title_id)
);

SELECT *
FROM titles;

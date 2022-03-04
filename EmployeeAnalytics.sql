DROP TABLE departments; 
DROP TABLE employees; 
DROP TABLE dept_emp; 
DROP TABLE dept_manager; 
DROP TABLE salaries; 
DROP TABLE titles; 

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

--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salaries
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.hire_date
FROM employees
WHERE hire_date > '1985-12-31'
AND hire_date < '1987-01-01'

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
-- this will have 2 inner joins dept_no & departments , employees & dept_manager
SELECT dept_manager.dept_no, dept_manager.emp_no, departments.dept_name, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no;


--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."--
SELECT employees.last_name, employees.first_name, employees.sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
--sales dept_no = d007
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
WHERE departments.dept_no = 'd007'


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) FROM Employees
GROUP BY last_name
ORDER BY count(last_name) DESC;

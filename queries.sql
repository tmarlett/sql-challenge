CREATE TABLE employees(
	emp_no VARCHAR(30) NOT NULL,
	emp_title_id VARCHAR(30) NOT NULL,
	birth_date VARCHAR(30) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(30) NOT NULL,
	hire_date VARCHAR(30) NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
	dept_no VARCHAR(30) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp(
	emp_no VARCHAR(30) NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE titles(
	title_id VARCHAR(30) NOT NULL,
	title VARCHAR(30) NOT NULL
);

CREATE TABLE salaries(
	emp_no VARCHAR(30) NOT NULL,
	salary VARCHAR(30) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(30) NOT NULL,
	emp_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
)

DROP TABLE dept_manager;
DROP TABLE salaries;
DROP TABLE titles;
DROP TABLE dept_emp;
DROP TABLE departments;
DROP TABLE employees;

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

SELECT first_name, last_name, hire_date FROM employees WHERE hire_date = '1986';

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name FROM departments
INNER JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON employees.emp_no = dept_manager.emp_no

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_no FROM employees 
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no;

SELECT employees.first_name, employees.last_name, employees.sex FROM employees
WHERE employees.first_name = 'Hercules' AND (SUBSTRING (employees.last_name,1,1)) = 'B';

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name FROM departments, employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales';

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name FROM departments, employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

SELECT employees.last_name, COUNT(*) FROM employees GROUP BY last_name ORDER BY 2 DESC;
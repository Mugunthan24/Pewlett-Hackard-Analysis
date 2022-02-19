-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(40) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);
	
SELECT * FROM titles;

SELECT * FROM dept_emp;

CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) references employees (emp_no),
	PRIMARY KEY (emp_no)
);

SELECT * FROM employees;

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-031';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-01';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name, title
FROM employees AS e
LEFT JOIN titles as t ON e.emp_no = t.emp_no

SELECT * FROM employees AS e
INNER JOIN titles as t ON e.emp_no = t.emp_no

DROP TABLE retirement_info;

SELECT first_name, last_name, emp_no
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table
SELECT * FROM retirement_info

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO retirement_department
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- Employee Information: A list of employees containing their unique employee number, their last name, first name, gender, and salary
SELECT emp_no,
    first_name,
last_name,
    gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT e.emp_no,
    e.first_name,
e.last_name,
    e.gender,
    s.salary,
    de.to_date
--INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 	AND (de.to_date = '9999-01-01');

SELECT * FROM emp_info

-- Management: A list of managers for each department, including the department number, name, and the manager's employee number,
-- last name, first name, and the starting and ending employment dates

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
--INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

-- Department Retirees: An updated current_emp list that includes everything it currently has, but also the employee's departments

SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);



SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE dept_name IN ('Sales', 'Development');


SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
--INTO employee_database
FROM employees as e
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no

SELECT * FROM employee_database

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) first_name, 
	last_name
FROM employee_database
WHERE to_date = '9999-01-01'
ORDER BY _____, _____ DESC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
--INTO unique_titles
FROM employee_database
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT COUNT(title) as title_count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY title_count DESC

SELECT * FROM dept_emp;

SELECT e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
	de.from_date,
    de.to_date,
    t.title
FROM employees as e
LEFT JOIN dept_emp as de
	ON e.emp_no = de.emp_no
LEFT JOIN titles as t
	ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no, to_date DESC;

SELECT DISTINCT ON(e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
	de.from_date,
    de.to_date,
    t.title
FROM employees as e
INNER JOIN dept_emp as de
	ON e.emp_no = de.emp_no
LEFT JOIN titles as t
	ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no, to_date DESC;

SELECT emp_no,
	first_name,
	last_name,
	title
--INTO unique_titles
FROM employee_database
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

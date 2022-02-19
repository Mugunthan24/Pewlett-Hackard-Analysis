-- DELIVERABLE 1

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO employee_database
FROM employees as e
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no


SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM employee_database
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;


SELECT COUNT(title) as title_count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY title_count DESC



-- DELIVERABLE 2

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
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;



-- DELIVERABLE 3


-- Getting count for the total number of employees eligible for the mentorship program
SELECT COUNT(*) FROM mentorship_eligibilty

-- Table that shows employee count of those eligible for mentorship for each title in each department 
SELECT 	d.dept_name,
	COUNT(me.emp_no) as employee_count
FROM mentorship_eligibilty as me
INNER JOIN dept_emp as de
	ON me.emp_no = de.emp_no
INNER JOIN departments as d
	ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY d.dept_name

-- Employee count for each department for those eligible for mentorship
SELECT 	d.dept_name,
	COUNT(me.emp_no) as employee_count
FROM mentorship_eligibilty as me
INNER JOIN dept_emp as de
	ON me.emp_no = de.emp_no
INNER JOIN departments as d
	ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY d.dept_name

-- Employee count for each title for those eligible for mentorship
SELECT 	me.title,
	COUNT(me.emp_no) as employee_count
FROM mentorship_eligibilty as me
INNER JOIN dept_emp as de
	ON me.emp_no = de.emp_no
GROUP BY me.title
ORDER BY me.title

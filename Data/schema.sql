Departments
-
dept_no varchar pk
dept_name varchar

Dept_Emp
-
emp_no int pk fk >- Employees.emp_no
dept_no int pk fk >- Departments.dept_no
from_date
to_date

Dept_Manager
-
dept_no varchar pk fk - Departments.dept_no
emp_no int pk fk - Employees.emp_no
from_date
to_date

Employees
-
emp_no int pk
birth_date
first_name
last_name
gender
hire_date

Salaries
-
emp_no int pk fk - Employees.emp_no
salary
from_date
to_date

Title
-
emp_no int pk fk >- Employees.emp_no
title
from_date
to_date
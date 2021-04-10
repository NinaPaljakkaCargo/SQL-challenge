/* print employee info: first and last name, emp_no, sex, salary*/
SELECT  "Employees".emp_no, "Employees".last_name, "Employees".first_name,
"Employees".sex, "Salaries".salary
FROM "Employees", "Salaries"
WHERE "Employees".emp_no = "Salaries".emp_no;

/* print first name, last name, and hire date for employees hired
in 1986*/
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE "Employees".hire_date >= '01/01/1986' and "Employees".hire_date < '12/31/1986';

/* print manager of each department including: dept_no, dept_name,
manager emp_no, last name, first name*/
SELECT "Departments".dept_no, "Departments".dept_name, 
"Managers".emp_no, "Employees".first_name, "Employees".last_name
FROM "Departments", "Managers", "Employees"
WHERE "Departments".dept_no = "Managers".dept_no and 
"Managers".emp_no = "Employees".emp_no;

/* print department of each employee including: 
emp_no, last name, first name, department name*/
SELECT "Dpt_Employees".emp_no, "Employees".last_name, 
"Employees".first_name, "Departments".dept_name
FROM "Dpt_Employees", "Employees", "Departments"
WHERE "Dpt_Employees".emp_no = "Employees".emp_no and 
"Dpt_Employees".dept_no = "Departments".dept_no;

/* print first name, last name, sex for all employees with 
first name Hercules and last name starts with B*/
SELECT "Employees".first_name, "Employees".last_name, "Employees".sex
FROM "Employees"
WHERE "Employees".first_name = 'Hercules' and "Employees".last_name 
LIKE 'B%';

/* print all employees in the Sales department, including:
emp_no, last name, first name, and dept_name */
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name,
"Departments".dept_name
FROM "Employees", "Departments"
WHERE "Departments".dept_name = 'Sales';

/* print all employees in the Sales and Development departments,
including: emp_no, last name, first name, and department name*/
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name,
"Departments".dept_name
FROM "Employees", "Departments"
WHERE "Departments".dept_name = 'Sales' or 
"Departments".dept_name = 'Development';

/* print, in descending order, how many employees share each last
name*/
SELECT last_name, COUNT(*)
FROM "Employees" GROUP BY last_name HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;
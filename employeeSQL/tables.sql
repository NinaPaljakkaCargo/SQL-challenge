/* print employee info: first and last name, emp_no, sex, salary*/
SELECT  "Employees".emp_no, "Employees".last_name, "Employees".first_name,
"Employees".sex, "Salaries".salary
FROM "Employees", "Salaries"
WHERE "Employees".emp_no = "Salaries".emp_no;
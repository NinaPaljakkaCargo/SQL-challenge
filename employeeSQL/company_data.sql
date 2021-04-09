CREATE TABLE "Titles" (
    "title_id" VARCHAR NOT NULL,
    "title" VARCHAR NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

SELECT * FROM "Titles";

CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" VARCHAR NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "sex" VARCHAR NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

SELECT * FROM "Employees";

CREATE TABLE "Departments" (
    "dept_no" VARCHAR NOT NULL,
    "dept_name" VARCHAR NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Managers" (
    "dept_no" VARCHAR NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_Managers" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "Dpt_Employees" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR NOT NULL,
    CONSTRAINT "pk_Dpt_Employees" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);



ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Managers" ADD CONSTRAINT "fk_Managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Managers" ADD CONSTRAINT "fk_Managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dpt_Employees" ADD CONSTRAINT "fk_Dpt_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dpt_Employees" ADD CONSTRAINT "fk_Dpt_Employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");


/* print employee info: first and last name, emp_no, sex, salary*/
SELECT  "Employees".emp_no, "Employees".last_name, "Employees".first_name,
"Employees".sex, "Salaries".salary
FROM "Employees", "Salaries"
WHERE "Employees".emp_no = "Salaries".emp_no;

/* print first name, last name, and hire date for employees hired
in 1986*/
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE "Employees".hire_date >= 01/01/1986 and "Employees".hire_date < 12/31/1986;

/* print manager of each department including: dept_no, dept_name,
manager emp_no, last name, first name*/
SELECT "Departments".dept_no, "Departments".dept_name, 
"Managers".emp_no, "Employees".first_name, "Employees".last_name
FROM "Departments", "Managers", "Employees"
WHERE "Departments".dept_no = "Managers".dept_no and 
"Managers".emp_no = "Employees".emp_no;

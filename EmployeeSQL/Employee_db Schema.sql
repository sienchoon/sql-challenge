-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/QlGUnb
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
CREATE TABLE "TITLES" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_TITLES" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "EMPLOYEES" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_EMPLOYEES" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "DEPARTMENTS" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_DEPARTMENTS" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "DEPARTMENT_EMPLOYEES" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_DEPARTMENT_EMPLOYEES" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "DEPARTMENT_MANAGER" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_DEPARTMENT_MANAGER" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "SALARIES" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_SALARIES" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "fk_EMPLOYEES_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "TITLES" ("title_id");

ALTER TABLE "DEPARTMENT_EMPLOYEES" ADD CONSTRAINT "fk_DEPARTMENT_EMPLOYEES_emp_no" FOREIGN KEY("emp_no")
REFERENCES "EMPLOYEES" ("emp_no");

ALTER TABLE "DEPARTMENT_EMPLOYEES" ADD CONSTRAINT "fk_DEPARTMENT_EMPLOYEES_dept_no" FOREIGN KEY("dept_no")
REFERENCES "DEPARTMENTS" ("dept_no");

ALTER TABLE "DEPARTMENT_MANAGER" ADD CONSTRAINT "fk_DEPARTMENT_MANAGER_dept_no" FOREIGN KEY("dept_no")
REFERENCES "DEPARTMENTS" ("dept_no");

ALTER TABLE "DEPARTMENT_MANAGER" ADD CONSTRAINT "fk_DEPARTMENT_MANAGER_emp_no" FOREIGN KEY("emp_no")
REFERENCES "EMPLOYEES" ("emp_no");

ALTER TABLE "SALARIES" ADD CONSTRAINT "fk_SALARIES_emp_no" FOREIGN KEY("emp_no")
REFERENCES "EMPLOYEES" ("emp_no");


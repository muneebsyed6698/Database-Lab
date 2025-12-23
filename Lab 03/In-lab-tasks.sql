-- Q1. Create employees table with check constraint and foreign key reference
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(15),
    salary INT,
    CONSTRAINT check_salary CHECK (salary > 20000),
    dept_id INT REFERENCES departments(dept_id)
);


-- Q2. Change column name from emp_name to full_name
ALTER TABLE employees RENAME COLUMN emp_name TO full_name;

-- Q3. Drop the salary check constraint
ALTER TABLE employees DROP CONSTRAINT check_salary;
INSERT into employees(emp_id,full_name,salary,dept_id) values(1,'Raghib',5000,5);
-- Q4. Create table departments with PK and unique dept_name
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(15) UNIQUE
);

-- Insert 3 records into departments
INSERT INTO departments (dept_id, dept_name) VALUES (1, 'HR');
INSERT INTO departments (dept_id, dept_name) VALUES (2, 'IT');
INSERT INTO departments (dept_id, dept_name) VALUES (3, 'Management');

-- Try inserting an employee with salary = 5000 (allowed now)
INSERT INTO employees (emp_id, full_name, salary, dept_id)
VALUES (1, 'Ali Haider', 5000, 2);

-- Q5. Add foreign key again (if not already exists)
ALTER TABLE employees DROP COLUMN dept_id;
ALTER TABLE employees ADD (
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Q6. Add bonus column with default value 1000
ALTER TABLE employees ADD bonus NUMBER(6,2) DEFAULT 1000;

-- Q7. Add city (default 'Karachi') and age (>18)
ALTER TABLE employees ADD (
    city VARCHAR(10) DEFAULT 'Karachi',
    age INT CONSTRAINT check_age CHECK (age > 18)
);

-- Insert another valid employee
INSERT INTO employees (emp_id, full_name, salary, dept_id, bonus, city, age)
VALUES (2, 'Sara Khan', 55000, 1, 2500.50, 'Lahore', 25);

-- Q8. Delete employees with id = 1 and id = 3
DELETE FROM employees WHERE emp_id IN (1, 3);

-- Q9. Change length of full_name and city to 20
ALTER TABLE employees MODIFY (full_name VARCHAR(20), city VARCHAR(20));

-- Q10. Add email column with UNIQUE constraint
ALTER TABLE employees ADD (
    email VARCHAR(50),
    CONSTRAINT unique_mail UNIQUE (email)
);


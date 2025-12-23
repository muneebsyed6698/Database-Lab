/* ---------------- POST-LAB TASKS ---------------- */

-- Q11. Make bonus unique
ALTER TABLE employees ADD CONSTRAINT unique_bonus UNIQUE (bonus);

-- Test by inserting two records with same bonus (second will fail)
INSERT INTO employees (emp_id, full_name, salary, dept_id, bonus, city, age, email)
VALUES (3, 'Ahmed Raza', 60000, 2, 1500.00, 'Islamabad', 30, 'ahmed@example.com');
-- Second record with same bonus to check UNIQUE violation
-- (this will throw error intentionally)
INSERT INTO employees (emp_id, full_name, salary, dept_id, bonus, city, age, email)
VALUES (4, 'Hina Malik', 70000, 3, 1500.00, 'Karachi', 28, 'hina@example.com');

-- Q12. Add dob column with constraint age >= 18
ALTER TABLE employees ADD dob DATE;
ALTER TABLE employees ADD CONSTRAINT check_dob CHECK (dob <= ADD_MONTHS(SYSDATE, -12*18));

-- Q13. Try inserting invalid employee (age < 18 based on dob)
INSERT INTO employees (emp_id, full_name, salary, dept_id, bonus, city, age, email, dob)
VALUES (5, 'Young Kid', 30000, 1, 2000.00, 'Karachi', 16, 'kid@example.com', DATE '2010-05-01');
-- (This will fail due to check_dob constraint)

-- Q14. Drop dept_id FK, insert invalid dept_id, then re-add
ALTER TABLE employees DROP CONSTRAINT employees_dept_id_fkey;
INSERT INTO employees (emp_id, full_name, salary, dept_id, bonus, city, age, email, dob)
VALUES (6, 'Fake Dept Emp', 40000, 99, 3000.00, 'Quetta', 29, 'fake@example.com', DATE '1995-07-20');
-- Now re-add foreign key
ALTER TABLE employees ADD CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES departments(dept_id);

-- Q15. Drop age and city columns
ALTER TABLE employees DROP COLUMN age;
ALTER TABLE employees DROP COLUMN city;

-- Q16. Display departments with their employees
SELECT d.dept_name, e.full_name
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id;

-- Q17. Rename salary to monthly_salary
ALTER TABLE employees RENAME COLUMN salary TO monthly_salary;

-- Q18. Display departments with no employees
SELECT d.dept_name
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;

-- Q19. Empty students table (assuming it exists)
TRUNCATE TABLE students;

-- Q20. Find department with max number of employees
SELECT d.dept_name, COUNT(e.emp_id) AS emp_count
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name
ORDER BY emp_count DESC
FETCH FIRST 1 ROWS ONLY;

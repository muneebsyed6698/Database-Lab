CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary DECIMAL(10,2),
    hire_date DATE,
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);
DROP TABLE departments CASCADE constraints;
DROP TABLE employees CASCADE constraints;

CREATE TABLE projects (
    proj_id INT PRIMARY KEY,
    proj_name VARCHAR(100)
);

CREATE TABLE emp_projects (
    emp_id INT,
    proj_id INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (proj_id) REFERENCES projects(proj_id)
);

DROP TABLE students CASCADE constraints;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    city VARCHAR(50)
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    teacher_id INT
);
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(100),
    city VARCHAR(50)
);

DROP TABLE enrollments CASCADE constraints;
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
insert into departments values (1, 'AI');
insert into departments values (2, 'CS');
insert into departments values (3, 'DS');
insert into departments values (4, 'CY');
insert into departments values (5, 'EE');

-- employeees with null manager ids are managers themselves
insert into employees values (101, 'Adina', 60000, TO_DATE('2021-03-10', 'YYYY-MM-DD'), 1, NULL); --Manager
insert into employees values (102, 'Bob', 45000, TO_DATE('2022-05-15', 'YYYY-MM-DD'), 1, 101);
insert into employees values (103, 'Charlie', 55000,TO_DATE('2020-06-01', 'YYYY-MM-DD'), 2, NULL);
insert into employees values (104, 'Alice', 30000, TO_DATE('2022-07-20', 'YYYY-MM-DD'), 2, 103);
insert into employees values (105, 'Raghib', 70000, TO_DATE('2019-02-01', 'YYYY-MM-DD'), 3, NULL);  
insert into employees values (106, 'Rizwan', 80000, TO_DATE('2023-06-01', 'YYYY-MM-DD'), 4, NULL); 
insert into employees values (107, 'Faraz', 30000, TO_DATE('2020-04-13', 'YYYY-MM-DD'), 3, 105);
insert into employees values (108, 'Bareerah', 37000, TO_DATE('2019-12-01', 'YYYY-MM-DD'), 5, 106);

select * from employees;

INSERT INTO projects VALUES (201, 'Website Development');
INSERT INTO projects VALUES (202, 'Payroll System');
INSERT INTO projects VALUES (203, 'Healthcare Managemnet System');
INSERT INTO projects VALUES (204, 'GPT 10.0');

INSERT INTO emp_projects VALUES (102, 201);
INSERT INTO emp_projects VALUES (104, 201);
INSERT INTO emp_projects VALUES (105, 202);
INSERT INTO emp_projects VALUES (106, 203);
INSERT INTO emp_projects VALUES (107, 203);
INSERT INTO emp_projects VALUES (108, 202);
INSERT INTO emp_projects VALUES (101, 204);
INSERT INTO emp_projects VALUES (103, 204);

INSERT INTO students VALUES(301, 'Ali', 'Lahore');
INSERT INTO students VALUES(302, 'Sara', 'Karachi');
INSERT INTO students VALUES(303, 'Fahad', 'Lahore');
INSERT INTO students VALUES(304, 'Mustafa', 'Lahore');
INSERT INTO students VALUES(305, 'Farheena', 'Karachi');
INSERT INTO students VALUES(306, 'Daniyal', 'Lahore');
INSERT INTO students VALUES(307, 'Abeeha', 'Lahore');
INSERT INTO students VALUES(308, 'Farooque', 'Karachi');
INSERT INTO students VALUES(309, 'Alisha', 'Lahore');

INSERT INTO teachers VALUES(401, 'Dr. Rafi', 'Lahore');
INSERT INTO teachers VALUES(402, 'Ms. Saeeda kanwal', 'Karachi');
INSERT INTO teachers VALUES(403, 'Sir Fahad Sherwani', 'Lahore');
INSERT INTO teachers VALUES(404, 'Ms. Kinza Mushtaq', 'Karachi');

insert into courses values(501, 'Database Systems', 404);
insert into courses values(502, 'Operating Systems', 402);
insert into courses values(503, 'KRR', 401);
insert into courses values(504, 'Discrete Maths', 402);

insert into customers values(601, 'Talha');
insert into customers values(602, 'Saif');
insert into customers values(603, 'Zahid');
insert into customers values(604, 'Rimsha');

insert into enrollments values(301, 501);
insert into enrollments values(302, 502);
insert into enrollments values(303, 503);
insert into enrollments values(304, 504);
insert into enrollments values(305, 501);
insert into enrollments values(306, 502);
insert into enrollments values(307, 503);
insert into enrollments values(308, 504);
select * from enrollments;
select * from customers;

insert into orders values (701, 601, TO_DATE('2021-03-10', 'YYYY-MM-DD'));
insert into orders values (702, 602, TO_DATE('2021-04-11', 'YYYY-MM-DD'));
insert into orders values (703, 603, TO_DATE('2021-05-28', 'YYYY-MM-DD'));
insert into orders values (704, 604, TO_DATE('2021-06-22', 'YYYY-MM-DD'));
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------IN-LAB TASKS------------------------------------------------------------------------------
select e.emp_name, d.dept_name from employees e cross join departments d;
select d.dept_name, e.emp_name from departments d left join employees e on d.dept_id = e.dept_id;
select e.emp_name as employee, m.emp_name as manager from employees e left join employees m on e.manager_id = m.emp_id;
select e.emp_name as employees from employees e left join emp_projects m on e.emp_id = m.emp_id where m.proj_id is NULL;
select s.student_name, c.course_name from students s join enrollments e on s.student_id = e.student_id join courses c on e.course_id = c.course_id;
select c.customer_name, o.order_id, o.order_date from customers c left join orders o on o.customer_id = c.customer_id;
select e.emp_name, d.dept_name from employees e left join departments d on d.dept_id = e.dept_id;
SELECT t.teacher_name, c.course_name
FROM teachers t
CROSS JOIN courses c;
select d.dept_name, count(e.emp_id) as number_of_employees from departments d left join employees e on d.dept_id = e.dept_id group by d.dept_name;
select s.student_name, c.course_name, t.teacher_name from students s join enrollments e on s.student_id = e.student_id join  courses c on e.course_id = c.course_id join teachers t on c.teacher_id = t.teacher_id;














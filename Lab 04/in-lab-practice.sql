create table students(
id int primary key,
stdName varchar(30),
email varchar(20),
password varchar(20),
age int,
city varchar(20),
salary int
);

create table department(
id int primary key,
name varchar(30)
);

select * from students;
select * from department;

insert into department values(4, 'CY');

alter table students add (dept_id int, constraint fk_dept_id foreign key(dept_id) references department(id));
insert into students values(5, 'Adina Faraz', 'adinafaraz@gmail.com', 5693, 19, 'Sialkot', 350000, 3);

--------------------------------------------------- SUB QUERIES --------------------------------------------------------
-- group by
select count(*) as total_students , dept_id from students group by(dept_id);
select (select d.name from department d where d.id = s.dept_id) as dept_name, count(*) from students s group by(s.dept_id);
select (select name from department where id = students.dept_id) as dept_name, count(8) as total_students,
sum(salary) as total_salary from students group by (dept_id);

create table faculty(
id int primary key,
name varchar(30)
);

insert into faculty values(3, 'Ms. Anam');

alter table students add (f_id int, constraint fk_fac_id foreign key(f_id) references faculty);

update students set f_id = 2 where id in(4, 6);

select f_id, count(*) as total_students from students group by(f_id);

select (select name from faculty where id = students.f_id) as faculty_name,
count(*) as total_students from students group by(f_id);

select sum(salary) as total_salary, (select name from department where id = students.dept_id) as dept_name
from students group by(dept_id) having sum(salary) >= 100000;

select dept_id, max(salary) as highest_salary from students group by(dept_id) having max(salary) >= 80000;
select msx(salary) from students;
select * from students where salary = (select max(salary) from students);
select * from students where salary < any(select salary from students where dept_id = 2);
select * from students where salary < all(select salary from students where dept_id = 2);

select * from students where salary < any(select salary from students where dept_id = 2);
select * from students where salary < all(select salary from students where dept_id = 2);
select * from faculty;
-----------------------DML operations with sub-queries
insert into students (id, stdName, email, password, age, city, salary, dept_id, f_id)
values(6, 'aisha', 'aisha@gmail.com', 202, 23, 'Karachi', 78000, (select id from department where name = 'CY'),
(select id from faculty where name = 'Ms. Kinza'));

update students set age = age + 1 where dept_id = (select id from department where name = 'CY');

select salary from (select salary from students order by salary desc) where rownum <= 3;











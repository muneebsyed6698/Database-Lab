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

create table employee(
id int primary key,
stdName varchar(30),
email varchar(20),
password varchar(20),
age int,
city varchar(20),
salary int
);

select * from students;
select * from department;
select * from employee;

insert into department values(4, 'CY');

alter table students add (dept_id int, constraint fk_dept_id foreign key(dept_id) references department(id));
insert into students values(4, 'Hafsa Rashid', 'hafsarashid@gmail.com', 0064,20, 'Karachi', 50000, 1);

create table faculty(
id int primary key,
name varchar(20)
);

select * from faculty;
insert into faculty values(1,'Miss Fareeha');
insert into faculty values(2,'Miss Aqsa');
insert into faculty values(3,'Miss Aqsa');
alter table students add (f_id int, foreign key(f_id) REFERENCES faculty(id));
update students set f_id = 2 where id in (2);
update faculty set name = 'Miss Amna' where id = 2;
select s.id, s.stdName , s.salary, f.name as faculty_name from students s inner join faculty f on s.f_id = f.id where city = 'Karachi';
select s.id, s.stdName , s.salary, f.name as faculty_name from students s left join faculty f on s.f_id = f.id;
select s.id, s.stdName , s.salary, f.name as faculty_name from students s right join faculty f on s.f_id = f.id;

select * from faculty;
alter table faculty add mentor_id int;
-- linking within a table -> self-join

update faculty set mentor_id = 1 where id in (2, 3);

select f.id, f.name as faculty_name, m.name as mentor_name
from faculty f inner join faculty m on f.mentor_id = m.id;

select * from students cross join faculty;

select s.*, f.name as faculty_name from students s cross join faculty f;

select s.*, f.* from students s full outer join faculty f on s.f_id = f.id;
drop table employee;
------------------------------------------------------------------------------ IN-LAB ---------------------------------------------------------------------
select * from department;
select * from employee;

create table employee(
    id int primary key,
    name varchar(30),
    email varchar(20),
    password varchar(20),
    age int,
    city varchar(20),
    salary int,
    dept_id int,
    constraint fk_dept foreign key(dept_id) references department(id)
);

insert into employee values(1, 'Marry William', 'marrywilliam@gmail.com', '1111', 45, 'Karachi', 50000, 1);
insert into employee values(2, 'Raghib Rizwan', 'raghibrizwan@gmail.com', '2222', 30, 'Landhi', 60000, 2);
insert into employee values(3, 'Abdul Rahman', 'arazam@gmail.com', '3333', 42, 'Nawabshah', 70000, 3);

select * from employee cross join department;


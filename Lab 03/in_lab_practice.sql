create table students(
id int primary key, 
std_name varchar(30),
email varchar(20),
age int,
check(age>=10)
);
select * from students;

alter table students add salary int;
alter table students add (city varchar(20) default 'Hyderabad', dept_id int);

select * from students;

--single constraint
alter table students add constraint unique_email unique(email);

-- modify multiple columns or we can modify single column
alter table students modify(std_name varchar(20) not null, email varchar(20) not null);

-- mutiple cnstraints
alter table students add (
constraint check_age check(age between 1 and 18),
constraint unique_email unique(email)
);

-- primary key single table pe sngle column implement ki jaati and should be unique and non null always
-- unique key- could be multiple cols in a single table and is nullable

create table departments(
id int primary key,
dept_name varchar(20) not null
);

select * from departments;
insert into departments(id, dept_name) values(4, 'AI'); 
-- trigger runs for entering multiple vales at oce into a table in mysqldeveloper

alter table students drop column dept_id;
alter table students add( dept_id int, foreign key(dept_id) references departments(id));
insert into students(id, std_name, std_email, age, salary, dept_id) values(64, 'Hafsa', 'hafsa@gmail.com', 20, 18000, 4);
select * from students;

alter table students rename column email to std_email;
insert into students(id, std_name, std_email, age,city, salary, dept_id) values(8, 'Sara', 'sara@gmail.com', 20, 'Karachi', 50, 4);

--delete vs truncate:
TRUNCATE table students;
delete from students where id in (1,2,3);
insert into students(id, std_name, std_email, age,city, salary, dept_id) values(1, 'Sara Ali', 'sara@gmail.com', 20, 'Karachi', 50, 4);
insert into students(id, std_name, std_email, age,city, salary, dept_id) values(2, 'Adina', 'adina@gmail.com', 19, 'Hyderabad', 50000, 4);
insert into students(id, std_name, std_email, age, salary, dept_id) values(3, 'Hafsa', 'hafsa@gmail.com', 20, 18000, 4);



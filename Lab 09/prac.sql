 create table students(
 student_id int primary key,
 student_name varchar(20),
 h_pay int,
 y_pay int
 );
 insert into students values(3, 'sana', 250, 1120);
 select * from students;

 set serveroutput on;
 -- before insert
create or replace trigger insert_data
before insert on students
for each row
begin
IF:NEW.h_pay IS NULL THEN
:NEW.h_pay := 250;
end if;
end;
/
--before update
create or replace trigger update_salary
before update on students
for each row
begin
:NEW.y_pay := :NEW.h_pay*120;
end;
/
update students 
set h_pay = 1233 
where student_id = 3;

select * from students;
--delete
create or replace trigger prevent_admin
before delete on students
for each row
begin
IF :OLD.student_name = 'admin'
then
RAISE_APPLICATION_ERROR(-20000, 'you cannot delete admin record');
end if;
end;
/
delete from students where student_name = 'admin';

create table student_logs(
student_id int,
student_name varchar(20),
inserted_by varchar(20),
inserted_on date
);

create or replace trigger after_ins
after insert on students for each row
begin
insert into student_logs(student_id, student_name, inserted_by, inserted_on) values
(:NEW.student_id, :NEW.student_name, SYS_CONTEXT('USERENV', 'SESSION_USSER'), SYSDATE);
end;
/

insert into students(student_id, student_name, h_pay) values (5, 'aqsa', 300);
select * from student_logs;
select * from students;

--class task: delete the student and the deleted students should be inserted into a new table called students_deleted
create table student_deleted(
student_id int,
student_name varchar(20),
deleted_by varchar(20),
deleted_on date
);

create or replace trigger after_ins
after insert on students for each row
begin
insert into student_deleted(student_id, student_name, deleted_by, deleted_on) values
(:NEW.student_id, :NEW.student_name, SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSDATE);
end;
/

insert into students(student_id, student_name, h_pay) values (5, 'aqsa', 300);
select * from student_logs;
select * from students;




--------------------------DDL TRIGGERS---------------------------------
-- prevent table to drop
create or replace trigger prevent_tables
before drop ON database
begin
RAISE_APPLICATION_ERROR(
    num => -20000,
    msg => 'cannot drop object'
);
end;
/
DROP table student_logs;

---------------- TASK 02--------------------
--- prevent only students table(ONLY) being deleted;
create or replace trigger prevent_table_student
before drop ON database
begin
case e_did
when 90 then
RAISE_APPLICATION_ERROR(
    num => -20000,
    msg => 'cannot drop table'
);
end;
/
DROP table student_logs;

------------------------ PL-SQL remaining topics -----------------------------
-- for loop












----- Another DDL trigger
create table schema_audit(
ddl_date DATE,
ddl_user varchar2(15),
object_created varchar2(15),
object_name varchar2(15),
ddl_operation varchar(15)
);
select * from schema_audit;

set serveroutput on;

create or replace trigger hr_audit_tr
after ddl on schema
begin
insert into schema_audit values(sysdate,
sys_context('USERENV', 'CCURRENT_USER'), ora_dict_obj_type, ora_dict_obj_name, ora_sysevent);
end;
/

create table ddl2_check(
h_name varchar(20));

drop table ddl2_check;

select * from schema_audit;



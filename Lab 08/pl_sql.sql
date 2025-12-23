set serveroutput on;
--3 phases of PL language:declaration(variable declaration: optional), execution: mandatory, exception: optional
--declare
declare
sec_name varchar(20) := 'SEC-AI';
course_name varchar(20) := 'DBMS';
--execution phase below
Begin
DBMS_OUTPUT.PUT_LINE('WELCOME ' || sec_name || ' to the ' ||course_name);
End;
 --PL program block ended
/
declare
a int := 10 ;
b int := 20;
c int;
f real;
begin
c:=a+b;
DBMS_OUTPUT.put_line('Value of c is '||c);
f := 70.0/3.0;
DBMS_OUTPUT.PUT_LINE('Value of f is '||f);
end;
/

declare
num1 number := 21;
num2 number := 22;

begin
dbms_output.put_line('Outer Variable num1 ' || num1);
dbms_outpu.put_line('Outer variable num2' || num2);

Declare
--local variable
n1 int := 45;
n2 int := 12;
begin 
dbms_output.put_line('Local variables n1 and n2 are '|| n1 || ' ' || n2);
end;
End;
/

declare
e_name varchar(20);
begin
select first_name into e_name from employees where employee_id = 101;
dbms_output.put_line('Employee name is: '||e_name);
Exception
WHEN
NO_DATA_FOUND then
DBMS_OUTPUT.PUT_LINE('no employee found');
end;
/

declare
begin
update employees set salary = salary*1.10 where
department_id = (select department_id from departments where department_name = 'Administration');
dbms_output.put_line('salary updated successfully');
end;
/

declare
e_id employees.employee_id%type;
e_name employees.first_name%type;-- assigns the type of var from the table(col mentioned)
d_name departments.department_name%type;
begin
select employee_id,first_name,department_name into e_id,e_name,d_name from employees inner join DEPARTMENTS on employees.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID where employee_id=100;
DBMS_OUTPUT.PUT_LINE('emp id: '|| e_id);
DBMS_OUTPUT.PUT_LINE('emp name: '|| e_name);
DBMS_OUTPUT.PUT_LINE('dep name: '|| d_name);
end;
/

declare
    e_id employees.employee_id%type := 100;
    e_sal employees.salary%type;
    e_did employees.department_id%type;

begin
    select salary, department_id into e_sal, e_did from employees where employee_id = e_id;
    case e_did
    when 90 then
    update employees set salary = e_sal+100 where employee_id = e_id;
    dbms_output.put_line('Salary updated: '||e_sal);
    when 50 then
    update employees set salary = e_sal+50 where employee_id = e_id;
    dbms_output.put_line('Salary updated: '||e_sal);
    when 40 then
    update employees set salary = e_sal+10 where employee_id = e_id;
    dbms_output.put_line('Salary updated: '||e_sal);
    else
    dbms_output.put_line('No such record');
    end case;
end;
/

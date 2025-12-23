------------------------------------------------ IN-LAB TASKS ------------------------------------------------
select sum(salary) as total_salary from employees;
select avg(salary) as average_salary from employees;
select count(*) as no_of_employees from employees group by(manager_id);
select * from employees where salary = (select min(salary) from employees);
select to_char(sysdate, 'DD-MM-YYYY') as today from dual;
select to_char(sysdate, 'DAY MONTH YYYY') as today from dual;
select * from employees where to_char(hire_date, 'Day') = 'Wednesday';
select months_between('01-JAN-2025','01-OCT-2024') from dual;
select months_between(sysdate, hire_date) from employees;
select last_name, substr(last_name, 1, 5) as first_five_characters from employees;

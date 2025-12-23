------------------------------------------------ POST-LAB TASKS ------------------------------------------------
select first_name, lpad(first_name, 15, '*') as longer from employees;
select ltrim(' Oracle') from dual;
select initcap(first_name) as Capitalized from employees;
select next_day('20-AUG-2022','MONDAY') as after_monday from dual;
select to_char(to_date('25-DEC-2023'), 'MM-YYYY') as converted from dual;
select distinct salary from employees order by salary asc;
select first_name, salary, round(salary,-2) as rounded_salary from employees;
select department_id from employees group by department_id having count(employee_id) = ( select max(count(employee_id)) from employees group by department_id);
select department_id, sum(salary) as total_salary_expense from employees group by department_id order by total_salary_expense desc;
select department_id from employees group by department_id having count(employee_id) = ( select max(count(employee_id)) from employees group by department_id);

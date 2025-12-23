------------------------------------------------------------------POST-LAB-----------------------------------------------------------------
select s.student_name, t.teacher_name, s.city from students s join teachers t on s.city = t.city;
select e.emp_name as employee, m.emp_name as manager from employees e left join employees m on e.manager_id = m.emp_id;
select e.emp_name from employees e where e.dept_id is null;
select d.dept_name, avg(e.salary) as avg_salary from departments d join employees e on d.dept_id = e.dept_id group by d.dept_name having avg(e.salary) > 50000;
select e.emp_name, e.salary, d.dept_name from employees e join departments d on e.dept_id = d.dept_id where e.salary > (select avg(e2.salary) from employees e2 where e2.dept_id = e.dept_id);
select d.dept_name from departments d join employees e on d.dept_id = e.dept_id group by d.dept_name having min(e.salary) >= 30000;
select s.student_name, c.course_name from students s join enrollments e on s.student_id = e.student_id join courses c on e.course_id = c.course_id where s.city = 'Lahore';
select e.emp_name, e.hire_date, d.dept_name, m.emp_name as manager from employees e left join departments d on e.dept_id = d.dept_id left join employees m on e.manager_id = m.emp_id where e.hire_date between date '2020-01-01' and date '2023-01-01';
select s.student_name, c.course_name from students s join enrollments e on s.student_id = e.student_id join courses c on e.course_id = c.course_id join teachers t on c.teacher_id = t.teacher_id where t.teacher_name = 'Sir Ali';
select e.emp_name, m.emp_name as manager, d.dept_name from employees e join employees m on e.manager_id = m.emp_id join departments d on e.dept_id = d.dept_id where e.dept_id = m.dept_id;

select dept_id, count(*) as number_of_students from Students group by dept_id;
select dept_id, avg(gpa) as avg_gpa from Student group by dept_id having avg(gpa) > 3.0;
SELECT course_id, AVG(fee_paid) AS avg_fee
FROM Enrollment e, Student s
WHERE e.student_id = s.student_id
GROUP BY course_id;
SELECT dept_id, COUNT(*) AS faculty_count
FROM Faculty
GROUP BY dept_id;
select faculty_id, faculty_name, salary from Faculty where Salary > (select avg(salary) from Faculty);
select student_id, student_name, gpa from Student where gpa > any(select gpa from Student where dept_id = 1);
select Student_ID, student_name, GPA from ( select Student_ID, student_name, GPA  from Student order by GPA desc
) where ROWNUM <= 3;
select s.student_id, s.STUDENT_NAME from student s where not exists (select e.course_id from enrollment e where e.student_id = (select student_id from student where student_name='ali') minus select e2.course_id from enrollment e2 where e2.student_id=s.student_id);
select dept_id, sum(fee_paid) as total_fees from student group by dept_id;
select distinct course_id from enrollment where student_id in (select student_id from student where gpa>3.5);

-- 1. Create a schema named `student_management`.
create schema if not exists student_managment;
use student_managment;
-- 2. Create a table `students` with columns: student_id, name, age, gender, course, city, marks, attendance, admission_date.
create table students( 
student_id int primary key auto_increment,
name varchar(100),
age int,
gender varchar(50),
course varchar(100),
city varchar(50),
marks int,
attendance int,
admission_date date);

-- 3. Insert 15 student records into the `students` table.
insert into students(name,age,gender,course,city,marks,attendance,admission_date)
values 
('vishal', 22,'male', 'Data Science', 'pune',89,82,'2023-07-07'),
('rahul', 20,'male', 'Data Analytics', 'mumbai',75,68,'2025-01-15'),
('swapnil', 18,'male', 'Full Stack', 'pune',85,72,'2024-05-05'),
('amit', 21,'male', 'Cyber Security', 'nagpur', 78, 80, '2023-09-12'),
('neha', 23,'female', 'AI ML', 'bangalore', 92, 88, '2022-11-21'),
('pratik', 19,'male', 'Cloud Computing', 'hyderabad', 69, 74, '2024-02-10'),
('sakshi', 22,'female', 'Full Stack', 'pune', 81, 79, '2023-06-18'),
('rohit', 20, 'male','Data Science', 'delhi', 73, 65, '2025-03-01'),
('pooja', 21, 'female','AI ML', 'mumbai', 34, 31, '2022-08-14'),
('karan', 24,'male', 'Cyber Security', 'chennai', 67, 70, '2023-12-25'),
('anjali', 20, 'female','Data Analytics', 'pune', 48,55, '2024-07-19'),
('sagar', 17, 'male','Cloud Computing', 'kolkata', 76, 71, '2020-04-30'),
('meena', 19, 'female','Full Stack', 'jaipur', 82, 77, '2025-01-09'),
('nikhil', 22,'male', 'AI ML', 'pune', 90, 86, '2022-10-11'),
('tejas', 21, 'male','Data Science', 'mumbai', 79, 75, '2024-09-27');

-- 4. Display all records from the `students` table.
select * from students;

-- 5. Display only student names and marks.
select name,marks from students;

-- 6. Find students whose marks are greater than 80.
select name,course,city,marks from students
where marks > 80; 

-- 7. Find students whose age is less than 20.
select name,age,course,city,marks from students 
where age < 20;

-- 8. Display students from Pune city.
 select name,course,city,marks from students 
 where city='pune';
 
-- 9. Find students enrolled in the Data Science course.
 select name,course,city,marks from students 
 where course='Data science';
 
-- 10. Display students whose attendance is above 85%.
 select name,course,city,marks,attendance from students 
 where attendance >85;
 
-- 11. Find students whose marks are between 60 and 80.
 select name,course,city,marks from students 
 where marks between 60 and 80;

-- 12. Display students whose names start with the letter ‘A’.
 select name,course,city,marks from students  
 where name like 'A%';

-- 13. Display students whose names end with the letter ‘n’.
 select name,course,city,marks from students 
 where name like '%n';
 
-- 14. Find students whose city is either Mumbai or Pune.
 select name,course,city,marks from students 
 where city ='mumbai' or city = 'pune';

-- 15. Display students whose marks are not equal to 78.
 select name,course,city,marks from students  
 where marks != 78;
 
 -- 16. Sort student records by marks in ascending order.
 select name,course,city,marks from students 
 order by marks;
 
-- 17. Sort student records by marks in descending order.
 select name,course,city,marks from students 
 order by marks desc;
 
-- 18. Sort students first by city and then by marks.
 select name,course,city,marks from students 
 order by city , marks;
 
-- 19. Display top 5 students based on marks.
 select name,course,city,marks from students 
 order by marks desc limit 5;
 
 
-- 20. Find the average marks of all students.
 select  avg(marks) as avg_marks from students;

-- 21. Find the maximum marks scored by students.
select max(marks) as max_marks from students;

-- 22. Find the minimum attendance percentage.
select min(attendance) as min_attendance from students;

-- 23. Count total number of students.
select count(*) from students;

-- 24. Count number of students city-wise.
select city,count(*) as city_count 
from students
group by city;

-- 25. Find total marks obtained by all students.
select sum(marks) as total_marks from students;

-- 26. Display distinct course names from the table.
select distinct(course) as courses from students;

-- 27. Use alias names for columns while displaying records.
 select name as std_name,course,city,marks as students_marks from students; 
 
-- 28. Find students whose marks are greater than the average marks.
select name, course, marks from students
where marks > (
select avg(marks) from students
);

-- 29. Display students admitted after ‘2024-01-01’.
 select name,course,city,marks,admission_date from students 
 where admission_date > '2024-01-01';
 
-- 30. Find students whose attendance is NULL.
select name,course,city,marks,attendance from students 
where attendance is null;

-- 31. Update marks of a specific student.
update students set marks=55 where student_id=8;
-- 32. Delete students whose marks are below 35.
delete from students
where marks <35; 
-- 33. Add a new column `email` to the students table.
alter table students 
add email varchar(100);

-- 34. Modify the datatype of the attendance column.
alter table students
modify attendance decimal(10,2);

-- 35. Rename the column `course` to `department`.
alter table students
rename column course to department;

-- 36. Drop the email column from the table.
alter table students
drop column email;

-- 37. Use arithmetic expressions to calculate bonus marks (+5).
select 
name,department,city,marks,
marks+5 as bonus_marks 
 from students;
 
-- 38. Display student name and yearly scholarship amount using expressions.
select 
name,department,marks,
marks*1000 as scholorship
from students;

-- 39. Concatenate student name and city into one column.
select
concat( name,'-',city) as name_and_city,
marks,
department
from students;

-- 40. Use CASE WHEN to classify students as Pass or Fail.
select 
name, 
department,
marks,
case
  when marks >=35 then 'pass'
  else 'failed'
  end as status
from students;  
  
  
-- 41. Use CASE WHEN to categorize grades as A, B, C, and D.
select 
name,
department,
marks,
case 
 when marks >=90 then 'A'
 when marks >=75 then 'B'
 when marks >=60 then 'C'
 else 'D'
 end as grade
 
from students;

-- 42. Use CASE WHEN to classify attendance as Excellent, Good, or Poor.
select 
name,
department,
attendance,
case 
 when attendance >=90 then 'Excellent'
 when attendance >=75  then 'Good'
 else 'poor'
end as attendance_grade

from students; 
-- 43. Display remarks using CASE WHEN based on marks.
select 
name,
department,
marks,
case 
   when marks >=90 then 'Top performer'
   when marks >=75 then 'Strong performer'
   when marks >=60 then 'Satisfactory'
   else 'Poor Performance'
end as remarks
from students;  
 
-- 44. Use ORDER BY with CASE WHEN for custom sorting.
SELECT
    name,
    city,
    marks
FROM students
ORDER BY
CASE
    WHEN city = 'pune' THEN 1
    WHEN city = 'mumbai' THEN 2
    ELSE 3
END;

-- 45. Find students whose marks are greater than 70 AND attendance above 85%.
select 
name,
marks,
attendance,
department
from students
where marks > 70 and attendance > 85;

-- 46. Find students whose city is Pune OR marks above 90.
select 
name,
city,
marks
from students
where city='pune' or marks >90;

-- 47. Use NOT operator to exclude a specific course.
select
name,
department
from students
where department != 'Data Analytics';

-- 48. Find second highest marks using ORDER BY clause.
select 
name,
marks
from students 
order by marks desc 
limit 1
offset 1;

-- 49. Display students in alphabetical order of names.
select
name,
marks,
department
from students
order by name;

-- 50. Find students whose names contain the substring “ra”.
select 
name,
department
from students
where name like '%ra%';
-- 51. Display students with marks in descending order and attendance in ascending order.
select 
name,
marks,
attendance
from students
order by marks desc , attendance asc;

-- 52. Calculate percentage assuming marks are out of 200.
select 
name,
marks,
department,
 (marks/200) * 100 as percentage
from students;
 
-- 53. Use CASE WHEN to identify scholarship eligibility.
select 
name,
marks,
case 
   when marks >=75 then 'Eligible'
   else 'Not eligible'
end as eligibility
from students; 
  
-- 54. Find students having attendance between 75% and 90%.

select 
name,
attendance
from students 
where attendance between 75 and 90;


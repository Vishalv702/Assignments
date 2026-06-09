-- WHERE Clause

-- 1.	Create a database named "school_db" and inside it 
create database if not exists school_db;
use school_db;

-- create a table named "student" with columns: student_id auto-increment primary key, student_name varchar 100 not null, age int, city varchar 60, marks decimal 5 comma 2, grade varchar 5, admission_date date, stream varchar 50.

create table student (
student_id int primary key auto_increment,
student_name varchar(100) not null,
age int,
city varchar(60),
marks decimal(5,2),
grade varchar(5),
admission_date date,
stream varchar(50)
);

-- 2.	Insert fifteen student records: Rohan Sharma age 17 from Pune marks 85.5 grade A stream Science admitted 2023-06-01. Priya Mehta age 16 from Mumbai marks 72.0 grade B stream Commerce admitted 2023-06-01. Aakash Joshi age 18 from Delhi marks 55.0 grade C stream Arts admitted 2023-06-02. Sneha Patil age 17 from Pune marks 91.0 grade A stream Science admitted 2023-06-02. Vikram Rao age 19 from Nagpur marks 38.5 grade F stream Commerce admitted 2023-06-03. Ananya Iyer age 16 from Mumbai marks 68.0 grade B stream Science admitted 2023-06-03. Deepak Verma age 18 from Delhi marks 47.0 grade D stream Arts admitted 2023-06-04. Meena Kulkarni age 17 from Nashik marks 82.0 grade A stream Commerce admitted 2023-06-04. Suresh Nambiar age 19 from Pune marks 29.0 grade F stream Arts admitted 2023-06-05. Kavita Reddy age 16 from Hyderabad marks 76.5 grade B stream Science admitted 2023-06-05. Ajay Singh age 18 from Delhi marks 93.0 grade A stream Science admitted 2023-06-06. Pooja Desai age 17 from Mumbai marks 61.0 grade C stream Commerce admitted 2023-06-06. Harish Tiwari age 19 from Nagpur marks 44.0 grade D stream Arts admitted 2023-06-07. Ritu Gupta age 16 from Pune marks 88.0 grade A stream Science admitted 2023-06-07. Nikhil Jain age 18 from Nashik marks 53.0 grade C stream Commerce admitted 2023-06-08.

insert into student
(student_name, age, city, marks, grade, admission_date, stream)
values
('Rohan Sharma',17,'Pune',85.50,'A','2023-06-01','Science'),
('Priya Mehta',16,'Mumbai',72.00,'B','2023-06-01','Commerce'),
('Aakash Joshi',18,'Delhi',55.00,'C','2023-06-02','Arts'),
('Sneha Patil',17,'Pune',91.00,'A','2023-06-02','Science'),
('Vikram Rao',19,'Nagpur',38.50,'F','2023-06-03','Commerce'),
('Ananya Iyer',16,'Mumbai',68.00,'B','2023-06-03','Science'),
('Deepak Verma',18,'Delhi',47.00,'D','2023-06-04','Arts'),
('Meena Kulkarni',17,'Nashik',82.00,'A','2023-06-04','Commerce'),
('Suresh Nambiar',19,'Pune',29.00,'F','2023-06-05','Arts'),
('Kavita Reddy',16,'Hyderabad',76.50,'B','2023-06-05','Science'),
('Ajay Singh',18,'Delhi',93.00,'A','2023-06-06','Science'),
('Pooja Desai',17,'Mumbai',61.00,'C','2023-06-06','Commerce'),
('Harish Tiwari',19,'Nagpur',44.00,'D','2023-06-07','Arts'),
('Ritu Gupta',16,'Pune',88.00,'A','2023-06-07','Science'),
('Nikhil Jain',18,'Nashik',53.00,'C','2023-06-08','Commerce');




-- 3.	Display all students who belong to Pune.
select * from student
where city = "Pune";

-- 4.	Display all students who do not belong to Delhi.
select * from student
where city != "Delhi";

-- 5.	Display all students whose marks are above 80.
select * from student
where marks > 80;

-- 6.	Display all students whose age is exactly 17.
select * from student 
where age = 17;

-- 7.	Display all students who scored 60 or more marks.
select * from student 
where marks >=60;

-- 8.	Display all students from Pune who have marks greater than 80.
select * from student 
where city = "Pune" and marks > 80;

-- 9.	Display all students from either Mumbai or Nagpur.
select * from student 
where city = "Mumbai" or city ="Nagpur";

-- 10.	Display all students from Mumbai who are in the Science stream.
select * from student
where city = "Mumbai" and stream = "Science";

-- 11.	Display all students whose marks fall between 60 and 90 using the range operator.
select * from student 
where marks between 60 and 90;

-- 12.	Display all students whose marks do not fall between 40 and 70.
select * from student 
where marks not between 40 and 70;

-- 13.	Display all students whose admission date falls between June 1 and June 4 of 2023.
select * from student 
where admission_date between '2023-06-01' and '2023-06-04';

-- 14.	Display all students whose name starts with the letter R.
select * from student 
where student_name like 'R%';

-- 15.	Display all students whose name ends with the letter a.
select * from student 
where student_name like '%a';

-- 16.	Display all students whose name contains the letters "an" anywhere in the name.
select * from student 
where student_name like '%an%';

-- 17.	Display all students whose city name is exactly 4 characters long using a single character placeholder for each character.
select * from student 
where city like '____';

-- 18.	Display all students whose city is one of Pune, Mumbai, or Delhi using the list membership operator.
select * from student 
where city in ("Pune","Mumbai","Delhi");

-- 19.	Display all students whose city is not in Nagpur or Nashik using the exclusion operator.
select * from student 
where city not in ("Nagpur","Nashik");

-- 20.	Display all students whose name does not start with the letter A.
select * from student 
where student_name not like "A%";

-- 21.	Display all students who have no value entered in the grade column.
select * from student 
where grade is null;

-- 22.	Display all students who have a value entered in the stream column.
select * from student 
where stream is not null;

-- 23.	Display students from Pune who are either in Science or Commerce stream.
select * from student 
where city = "Pune" and ( stream = "Science" or stream = "Commerce" ) ;

-- 24.	Display students whose marks are above 75 or whose age is below 17.
select * from student 
where marks >75 or age < 17;

-- 25.	Display students whose age is between 16 and 18 and whose marks are above 60.
select * from student 
where age between 16 and 18 and marks >60;

-- 26.	Display all students from Delhi whose name contains the letter i anywhere.
select * from student 
where city ="Delhi" and student_name like "%i%";

-- 27.	Display all students whose stream is not Science.
select * from student 
where stream != "Science";

-- 28.	Display all students whose marks are not null and are less than 40.
select * from student 
where marks is not null and marks < 40 ;

-- 29.	Display students from cities whose names start with the letter N.
select * from student 
where city like "N%";

-- 30.	Display students admitted in the year 2023 whose grade is either A or B and who belong to either Pune or Mumbai.
select * from student 
where year(admission_date) = '2023' and (grade in ("A","B") ) and ( city in ("Pune", "Mumbai") );
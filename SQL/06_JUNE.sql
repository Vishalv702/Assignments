-- 1. Create a database named CompanyDB.
create database if not exists companyDB;
use companyDB;

-- 2. Create a table named Employees with columns EmployeeID, EmployeeName, Department, Salary, JoiningDate, Email, and City.

create table employees (
emp_id int primary key auto_increment,
emp_name varchar(100),
department varchar(100),
salary decimal(10,2),
joining_date date,
email varchar(100),
city varchar(50)
);

-- 3. Create a table named Departments with columns DepartmentID, DepartmentName, and Location.

create table departments(
    dept_id int primary key auto_increment,
    dept_name varchar(100),
    location varchar(100)
);

-- 4. Insert 10 employee records into the Employees table.

insert into employees
(emp_name, department, salary, joining_date, email, city)
values
('amit', 'IT', 75000, '2021-05-10', 'amit@gmail.com', 'Pune'),
('rohan', 'HR', 45000, '2022-03-15', 'rohan@gmail.com', 'Mumbai'),
('sneha', 'Finance', 68000, '2020-11-20', 'sneha@yahoo.com', 'Pune'),
('akash', 'IT', 82000, '2023-01-08', 'akash@gmail.com', 'Delhi'),
('pooja', 'Marketing', 55000, '2022-07-12', 'pooja@gmail.com', 'Pune'),
('karan', 'Finance', 72000, '2021-09-25', 'karan@yahoo.com', 'Mumbai'),
('arjun', 'HR', 38000, '2024-02-10', 'arjun@gmail.com', 'Nagpur'),
('nikita', 'IT', 91000, '2020-06-18', 'nikita@gmail.com', 'Pune'),
('mohan', 'Marketing', 47000, '2023-08-05', 'mohan@yahoo.com', 'Delhi'),
('ankit', 'IT', 64000, '2022-12-01', 'ankit@gmail.com', 'Pune');

-- 5. Insert department details into the Departments table.

insert into departments
(dept_name, location)
values
('IT', 'Pune'),
('HR', 'Mumbai'),
('Finance', 'Delhi'),
('Marketing', 'Pune'),
('Operations', 'Nagpur');

-- 6. Display all records from the Employees table.

select * from employees;

-- 7. Display only EmployeeName and Salary from the Employees table.

select emp_name, salary 
from employees;

-- 8. Find employees who belong to the IT department.
select emp_name , department
from employees
where department = 'IT';

-- 9. Find employees whose salary is greater than 50000.

select emp_name, salary 
from employees
where salary > 50000;

-- 10. Display employees who are from Pune city.

select emp_name,city 
from employees 
where city = 'Pune';

-- 11. Find employees whose salary is between 30000 and 70000.

select emp_name, salary 
from employees
where salary between 30000 and 70000;

-- 12. Display employees whose names start with the letter 'A'.

select emp_name
from employees
where emp_name like 'A%';

-- 13. Display employees whose names end with the letter 'n'.

select emp_name
from employees
where emp_name like '%n';

-- 14. Find employees whose department is either HR or Finance.

select emp_name, department
from employees
where department = 'HR' or department ='Finance';

-- 15. Display employees who joined after 2022-01-01.

select emp_name, joining_date
from employees
where joining_date > '2022-01-01';

-- 16. Sort employee records based on salary in ascending order.

select * from employees
order by salary;

-- 17. Sort employee records based on salary in descending order.

select * from employees
order by salary desc;

-- 18. Count the total number of employees in the table.

select count(*) as total_count
from employees;

-- 19. Find the maximum salary among all employees.

select max(salary) as max_salary
from employees;

-- 20. Find the minimum salary among all employees.

select min(salary) as min_salary
from employees;

-- 21. Calculate the average salary department-wise.

select department, avg(salary) as avg_salary
from employees
group by department;

-- 22. Find the total salary paid to employees department-wise.

select department, sum(salary) as total_salary
from employees
group by department;

-- 23. Display the number of employees in each department.

select department, count(*) as emp_perdepartment
from employees
group by department;

-- 24. Display departments having more than 3 employees.

select department, count(*) as emp_perdepartment
from employees
group by department
having count(*) > 3;

-- 25. Find departments where the average salary is greater than 60000.

select department,round( avg(salary) , 2) as avg_salary
from employees
group by department
having avg(salary) > 60000;

-- 26. Display cities where more than 2 employees are working.

select city , count(*) as city_count
from employees
group by city
having count(*) > 2;

-- 27. Convert all employee names into uppercase.

select 
upper(emp_name) as name
from employees;

-- 28. Convert all employee names into lowercase.

select 
lower(emp_name) as name
from employees;

-- 29. Display the first 3 characters of each employee name.

select
left(emp_name , 3) as three_char
from employees;

-- 30. Find the length of each employee name.

select 
emp_name,
length(emp_name) as name_len
from employees;

-- 31. Concatenate employee name and city in a single column.

select 
concat(emp_name,city) as concatinated_name
from employees;

-- 32. Remove extra spaces from employee names using string functions.

select 
trim(emp_name) as triimed_name
from employees;

-- 33. Replace a specific city name with another city name in the output.

select 
city,
replace(city, 'Nagpur','Buldhana') as changed_city
from employees;

-- 34. Display employee names along with the current system date.

select emp_name , curdate() as curr_date
from employees;

-- 35. Find employees whose email contains “gmail”.

select 
emp_name,
email from employees
where email like '%gmail%';

-- 36. Round employee salaries to the nearest thousand.

select 
emp_name,
salary,
round(salary, -3) as rounded_to_thousand
from employees;

-- 37. Display the square root of employee salaries.

select emp_name,
salary,
round(sqrt(salary) , 2)as salary_sqrt
from employees;

-- 38. Find the absolute difference between salary and 50000.

select emp_name,
salary,
abs(salary - 50000) as abs_diff
from employees;

-- 39. Display salary raised to the power of 2.

select emp_name,
salary,
pow(salary,2) as raised_salary
from employees;

-- 40. Find the remainder when salary is divided by 1000.

select emp_name,
salary,
mod(salary,1000) as mod_salary
from employees;

-- 41. Display employee records where the salary is an even number.

select *
from employees
where mod(salary,2) = 0;

-- 42. Count employees city-wise and display only cities having more than 1 employee.

select city, count(*) as city_count
from employees
group by city
having count(*) > 1; 

-- 43. Find the highest salary in each department.

select department, max(salary) as max_salary
from employees
group by department;

-- 44. Find the lowest salary in each department.

select department, min(salary) as min_salary
from employees
group by department;

-- 45. Display departments where the total salary exceeds 200000.

select department, sum(salary) as total_salary
from employees
group by department
having sum(salary) > 200000;

-- 46. Display employee names in reverse order using string functions.

select 
emp_name,
reverse(emp_name) as reverse_name
from employees;

-- 47. Extract the domain name from employee email addresses.

select emp_name, email,
substring(  email ,locate('@',email)+1 ) as domain
from employees;

-- 48. Display employees whose names contain exactly 5 characters.

select emp_name,
length(emp_name) as name_length
from employees
where length(emp_name) = 5;

-- 49. Find the difference in years between joining date and current date.

select 
joining_date, 
curdate() as today_date,
timestampdiff(year,joining_date, curdate() ) as year_diff
from employees;

-- 50. Display department-wise employee count, average salary, maximum salary, and minimum salary in a single query.

select department , 
count(*) as emp_count, 
avg(salary) as avg_salary,
max(salary) as max_salary,
min(salary) as min_salary
from employees 
group by department;

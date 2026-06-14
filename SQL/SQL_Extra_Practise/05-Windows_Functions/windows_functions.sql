-- 1. Create Database

create database if not exists performance_db;
use performance_db;


-- 2. Create Table

create table employee_sales (
    record_id int primary key auto_increment,
    salesperson_name varchar(100) not null,
    region varchar(60),
    city varchar(60),
    product_category varchar(60),
    sale_amount decimal(12,2),
    quantity_sold int,
    sale_date date,
    customer_type varchar(40),
    target_amount decimal(12,2)
);


-- Insert 20 Records

insert into employee_sales
(salesperson_name, region, city, product_category, sale_amount, quantity_sold, sale_date, customer_type, target_amount)
values
('Ravi Sharma','North','Pune','Electronics',55000,2,'2024-01-08','Corporate',50000),
('Priya Mehta','West','Mumbai','Furniture',36000,3,'2024-01-15','Retail',40000),
('Ravi Sharma','North','Delhi','Electronics',22000,1,'2024-01-22','Government',20000),
('Anand Joshi','South','Chennai','Stationery',18000,15,'2024-02-05','Retail',15000),
('Priya Mehta','West','Pune','Electronics',55000,1,'2024-02-12','Corporate',50000),
('Kavita Rao','East','Nagpur','Electronics',14000,4,'2024-02-20','Retail',12000),
('Ravi Sharma','North','Delhi','Furniture',36000,2,'2024-03-01','Government',35000),
('Anand Joshi','South','Mumbai','Electronics',22000,1,'2024-03-10','Retail',20000),
('Kavita Rao','East','Nagpur','Electronics',55000,1,'2024-03-18','Corporate',50000),
('Priya Mehta','West','Chennai','Stationery',2400,20,'2024-04-02','Retail',2000),
('Ravi Sharma','North','Pune','Electronics',35000,1,'2024-04-15','Corporate',30000),
('Anand Joshi','South','Nagpur','Furniture',24000,2,'2024-04-22','Government',20000),
('Kavita Rao','East','Delhi','Electronics',24000,2,'2024-05-05','Corporate',22000),
('Priya Mehta','West','Mumbai','Furniture',18000,1,'2024-05-12','Retail',15000),
('Ravi Sharma','North','Chennai','Electronics',10500,3,'2024-05-20','Retail',10000),
('Anand Joshi','South','Pune','Electronics',110000,2,'2024-06-02','Corporate',100000),
('Kavita Rao','East','Mumbai','Stationery',3000,25,'2024-06-10','Retail',2500),
('Priya Mehta','West','Delhi','Electronics',35000,1,'2024-06-18','Corporate',30000),
('Ravi Sharma','North','Nagpur','Electronics',12000,1,'2024-06-25','Government',10000),
('Anand Joshi','South','Chennai','Furniture',18000,1,'2024-06-28','Corporate',15000);




-- 3.	Assign a sequential number to each row ordered by sale_amount from highest to lowest, showing salesperson name, sale amount, and the assigned number.
select 
salesperson_name, sale_amount, 
row_number() over( order by sale_amount desc ) as ranks
from employee_sales;

-- 4.	Assign sequential numbers to each salesperson's records independently, ordered by sale_date ascending, showing salesperson name, sale date, sale amount, and the per-salesperson sequential number.
select salesperson_name, sale_date,sale_amount,
row_number() over(partition by salesperson_name order by sale_date) as ranks
from employee_sales;

-- 5.	Assign sequential numbers within each region ordered by sale_amount descending, showing region, salesperson name, sale amount, and the within-region sequence number.
select 
region, salesperson_name, sale_amount,
row_number() over( partition by region order by sale_amount desc) as ranks
from employee_sales;

-- 6.	Display the top 1 highest sale record per region using sequential numbering within regions, showing only the highest sale from each region.
select * from 
(
select * ,
row_number() over( partition by region order by sale_amount desc) as ranks
from employee_sales 
) t
where ranks = 1;

-- 7.	Display the top 2 records per salesperson by sale amount, showing salesperson name, sale date, sale amount, and their within-salesperson rank.
select * from(
select 
salesperson_name, sale_date, sale_amount,
row_number() over( partition by salesperson_name order by sale_amount desc) as ranks
from employee_sales
) t 
where ranks <=2;


-- 8.	Display which record number each sale is when all sales are ordered by sale_date chronologically, and from this result show only records numbered 6 through 10.
select * 
from ( 
select 
salesperson_name, sale_date, sale_amount,
row_number() over( order by sale_date) as ranks
from employee_sales
)t
where ranks between 6 and 10 ; 

-- 9.	Compute a running total of sale_amount ordered by sale_date ascending across all records, showing sale date, salesperson name, sale amount, and cumulative total to that point.
select sale_date, salesperson_name, sale_amount,
sum(sale_amount) over( order by sale_date) as running_total
from employee_sales;

-- 10.	Compute a running total of sale_amount independently for each salesperson ordered by sale_date, showing salesperson name, sale date, sale amount, and the per-salesperson cumulative total.
select 
salesperson_name , sale_date, sale_amount,
sum(sale_amount) over(partition by salesperson_name order by sale_date) as running_total
from employee_sales;

-- 11.	Compute a running total of sale_amount within each region ordered by sale_date, showing region, salesperson name, sale amount, and the within-region cumulative total.
select 
region , salesperson_name, sale_amount, 
sum(sale_amount) over( partition by region order by sale_date) as running_total
from employee_sales;

-- 12.	Compute a running count of transactions (how many transactions have occurred up to each row) ordered by sale_date, showing sale date, sale amount, and the cumulative transaction count.
select 
sale_date, sale_amount, 
count(*) over(order by sale_date) as running_count
 from employee_sales;

-- 13.	Compute a running average of sale_amount ordered by sale_date, showing sale date, sale amount, and the cumulative average rounded to 2 decimal places.
select 
sale_date, sale_amount, 
round( avg(sale_amount) over( order by sale_date)  ,2) as running_average
 from employee_sales;
 
-- 14.	Compute a running maximum of sale_amount ordered by sale_date, showing sale date, sale amount, and the highest sale amount seen up to each point.
select sale_date, sale_amount,
max(sale_amount) over( order by sale_date ) as running_maximum
from employee_sales;

-- 15.	Assign overall ranking and per-region ranking to each record simultaneously in one query, ordered by sale_amount descending, showing salesperson name, region, sale amount, overall rank, and region rank.
select 
salesperson_name, region, sale_amount,
rank() over(order by sale_amount desc) as overall_ranking,
rank() over( partition by region order by sale_amount desc) as regionwise_ranking
from employee_sales;


-- 16.	Display salesperson name, region, sale amount, and a comparison showing the sale amount from the immediately preceding record ordered by sale_date, to see how each sale compares to the previous one.
select salesperson_name, region , sale_amount,
lag(sale_amount) over( order by sale_date ) as previous
from employee_sales;


-- 17.	Display salesperson name, sale date, sale amount, and the sale amount from the next chronological sale, to allow forward comparison for trend analysis.
select salesperson_name, sale_date, sale_amount ,
lead(sale_amount) over( order by sale_date ) as forward
from employee_sales;

-- 18.	Display the difference between each sale's amount and the immediately previous sale's amount ordered by sale_date, showing whether each sale was higher or lower than the one before it.
select sale_amount ,previous_amount, sale_amount - previous_amount as difference_amount,
case 
  when sale_amount > previous_amount  then "Higher"
  when sale_amount < previous_amount  then "Lower"
  when sale_amount = previous_amount then 'Same'
  else 'No Previous Sale'
end as sale_type
from (
select sale_amount,
lag(sale_amount) over(order by sale_date) as previous_amount
from employee_sales
) t;

-- 19.	For each record, display the salesperson name, region, sale amount, and the name of the salesperson who made the highest sale in that same region, shown alongside every row in that region.
select salesperson_name, region, sale_amount,
first_value(salesperson_name) over(partition by region order by sale_amount desc) as highest_sale_emp
from employee_sales ;

-- 20.	Assign a number to each row within each product category ordered by sale_date ascending, and from this result return only the first sale record in each category (the earliest sale for each category).
select * from (
select product_category, sale_date, sale_amount,
row_number() over( partition by product_category order by sale_date) as ranks
from employee_sales
)t 
where ranks = 1;

-- 21.	Compute a running total of quantity_sold ordered by sale_date across all records, showing sale date, product category, quantity sold, and cumulative quantity to that point.
select sale_date, product_category, quantity_sold,
sum(quantity_sold) over( order by sale_date) as running_total
from employee_sales;

select * from employee_sales;

-- 22.	Compute a running total of sale_amount within each city ordered by sale_date, showing city, sale date, sale amount, and the city-level cumulative total.
select city, sale_date, sale_amount, 
sum(sale_amount) over(partition by city order by sale_date) as running_total
from employee_sales;

-- 23.	Display salesperson name, sale amount, target amount, the difference between sale and target, and assign a rank based on how much each salesperson's sale exceeded their target (sale minus target) ordered from highest excess to lowest.
select salesperson_name, sale_amount, target_amount, sale_amount - target_amount as difference,
rank() over (order by sale_amount - target_amount desc ) as ranks
from employee_sales;

-- 24.	Display records numbered sequentially by sale_date and then return only the most recent 3 records using the sequential numbering approach instead of direct date filtering.
select * 
from (
select salesperson_name, sale_amount,sale_date,
row_number() over( order by sale_date desc) as recent_sale
from employee_sales)t
where recent_sale <=3;

-- 25.	Compute a running total per customer type ordered by sale_date, showing customer type, sale date, sale amount, and the cumulative total for that customer type up to each point.
select customer_type, sale_date, sale_amount , 
sum(sale_amount) over( partition by customer_type order by sale_date) as running_total
from employee_sales;

-- 26.	Display each salesperson's records with their within-salesperson sequential number and alongside it the running total of their sale amounts, both computed within each salesperson's partition ordered by sale_date.
select 
salesperson_name, sale_amount, sale_date,
row_number() over( partition by salesperson_name order by sale_date) as ranks,
sum(sale_amount) over( partition by salesperson_name order by sale_date) as running_total
from employee_sales;

-- 27.	For each sale, display the sale amount and compute how much the current sale amount differs from the sale amount two transactions before it in date order, showing the gap across two rows.
select sale_date, sale_amount, sale_amount - previous_amount as difference_amount
from (
select sale_amount , sale_date,
lag(sale_amount, 2) over(order by sale_date) as previous_amount
from employee_sales
)t ;

-- 28.	Display salesperson name, region, sale amount, the running total within the region, and the overall running total across all regions simultaneously in one query, ordered by sale_date.
select salesperson_name, region, sale_amount, 
sum(sale_amount) over(partition by region order by sale_date) as running_total,
sum(sale_amount) over(order by sale_date) as overall_running_total
from employee_sales;

-- 29.	Assign a rank to each salesperson's records by sale_amount within their region, and display only those records where the salesperson ranked first within their region but where their sale_amount was below their own target_amount for that transaction.
select * from
(select region , salesperson_name,  target_amount ,sale_amount,
rank() over(partition by region order by sale_amount desc)  as ranks
from employee_sales
)t
where ranks =1 and sale_amount < target_amount;


-- 30.	Build a complete performance summary for each salesperson showing: their sequential transaction number overall, their rank within their region by sale amount,
-- the running total of their individual sales ordered by date, the running total of sales in their region ordered by date, and the difference between the current sale and the previous sale, all in a single query showing all columns together ordered by salesperson name and sale date.
select salesperson_name,
row_number() over( order by sale_date) as sequencial_rank,
rank() over( partition by region order by sale_amount desc) as ranks,
sum(sale_amount) over(partition by salesperson_name order by sale_date) as individual_total,
sum(sale_amount) over(partition by region order by sale_date)  as running_total,
sale_amount - lag(sale_amount) over(order by sale_date) as difference_amount
from employee_sales;



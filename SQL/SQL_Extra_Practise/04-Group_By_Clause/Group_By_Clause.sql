-- 1. Create Database

create database if not exists sales_db;
use sales_db;


-- 2. Create Table

create table sales (
    sale_id int primary key auto_increment,
    salesperson_name varchar(100) not null,
    product_name varchar(100) not null,
    category varchar(60),
    region varchar(60),
    amount decimal(10,2),
    quantity int,
    sale_date date,
    customer_type varchar(50)
);


-- Insert 20 Records

insert into sales
(salesperson_name, product_name, category, region, amount, quantity, sale_date, customer_type)
values
('Ravi Sharma','Laptop','Electronics','North',55000,1,'2024-01-05','Corporate'),
('Ravi Sharma','Mouse','Electronics','North',2550,3,'2024-01-12','Retail'),
('Priya Mehta','Office Chair','Furniture','West',12000,1,'2024-01-18','Corporate'),
('Priya Mehta','Desk','Furniture','West',36000,2,'2024-02-05','Government'),
('Anand Joshi','Notebook','Stationery','South',1800,15,'2024-02-10','Retail'),
('Anand Joshi','Laptop','Electronics','South',55000,1,'2024-02-22','Corporate'),
('Kavita Rao','Smartphone','Electronics','East',22000,1,'2024-03-01','Retail'),
('Kavita Rao','Headphones','Electronics','East',14000,4,'2024-03-15','Corporate'),
('Ravi Sharma','Tablet','Electronics','North',35000,1,'2024-03-20','Government'),
('Priya Mehta','Bookshelf','Furniture','West',25500,3,'2024-04-02','Retail'),
('Anand Joshi','Pen Set','Stationery','South',1500,25,'2024-04-10','Retail'),
('Kavita Rao','Printer','Electronics','East',24000,2,'2024-04-18','Corporate'),
('Ravi Sharma','Laptop','Electronics','North',55000,1,'2024-05-05','Retail'),
('Priya Mehta','Whiteboard','Stationery','West',9000,5,'2024-05-12','Government'),
('Anand Joshi','Smartphone','Electronics','South',22000,1,'2024-05-20','Retail'),
('Kavita Rao','Desk','Furniture','East',18000,1,'2024-06-01','Corporate'),
('Ravi Sharma','Headphones','Electronics','North',3500,1,'2024-06-08','Retail'),
('Priya Mehta','Laptop','Electronics','West',55000,1,'2024-06-15','Corporate'),
('Anand Joshi','Office Chair','Furniture','South',12000,1,'2024-06-22','Government'),
('Kavita Rao','Notebook','Stationery','East',2400,20,'2024-06-28','Retail');

-- 3.	Display the total number of sales transactions made by each salesperson.
select salesperson_name, count(*) as total
from sales
group by salesperson_name;

-- 4.	Display the total sales amount earned by each salesperson, sorted from highest to lowest.
select salesperson_name, sum(amount) as earnings
from sales
group by salesperson_name
order by sum(amount) desc;

-- 5.	Display the total number of items sold in each product category.
select category,sum(quantity) as items_sold
from sales
group by category;

-- 6.	Display the average sale amount per transaction for each region.
select region, round(avg(amount), 0 )  average_amount
from sales
group by region;

-- 7.	Display the highest single sale amount and the lowest single sale amount recorded for each category.
select category,
max(amount) as highest_amount,
min(amount) as lowest_amount
from sales
group by category;

-- 8.	Display the total revenue generated from each unique product.
select product_name , sum( amount ) as total_revenue
from sales
group by product_name;

-- 9.	Display how many sales transactions happened in each month of the data.
select month(sale_date) as months,
count(*) as total_sales
from sales
group by month(sale_date);

-- 10.	Display the total amount and total quantity sold by each salesperson in each region (group by two columns).
select salesperson_name, region,
sum(amount) totalammount,
sum(quantity) as total_quantity
from sales
group by salesperson_name, region;

-- 11.	Display only those salespersons whose total sales amount exceeds 100000.
select salesperson_name , sum(amount) as total_amount
from sales 
group by salesperson_name
having sum(amount) > 100000;

-- 12.	Display only those product categories where the average transaction amount is above 15000.
select category , avg(amount) as average_amount 
from sales
group by category
having avg(amount) > 15000;

-- 13.	Display total revenue per region but only for Corporate customer type transactions, filtering before grouping.
select region, sum(amount) as total_revenue
from sales 
where customer_type = "Corporate"
group by region; 

-- 14.	Display total revenue per category but include only categories where more than 3 transactions happened.
select category, sum(amount) as total_revenue
from sales 
group by category
having count(*) > 3;


-- 15.	Display the most recent sale date and the earliest sale date recorded for each salesperson.
select 
salesperson_name, 
min(sale_date) as earliest_date,
max(sale_date) as recent_date
from sales
group by salesperson_name;

-- 16.	Display the total quantity sold per product, but only show products where the total quantity is more than 5.
select product_name , sum(quantity) as total_quantity
from sales
group by product_name
having sum(quantity) > 5 ;

-- 17.	Display total revenue by year extracted from sale_date.
	select year(sale_date) as years , sum(amount) as total_revenue
    from sales
    group by year(sale_date);
    
-- 18.	Display total revenue by year and month together in correct chronological order.
select 
year(sale_date) as years,
month(sale_date) as months,
sum(amount) as total_revenue
from sales 
group by  year(sale_date), month(sale_date)
order by  year(sale_date) , month(sale_date) ;


-- 19.	Display the number of sales made to each customer type (Corporate, Retail, Government).
select customer_type , count(*) as total_sales
from sales 
group by customer_type;

-- 20.	Display each region's total revenue sorted from highest to lowest revenue.
select region , sum(amount) as total_revenue
from sales 
group by region
order by total_revenue desc;

-- 21.	Display each salesperson's average transaction amount, rounded to 2 decimal places, only for those whose average exceeds 20000.
select salesperson_name, 
round(avg(amount), 2) as average_amount
from sales 
group by salesperson_name
having  average_amount > 20000; 

-- 22.	Display total amount grouped by category and region together (two column grouping) sorted by category and then by total amount descending.
select category , region , 
sum(amount) as total_amount
from sales
group by category, region
order by category , total_amount desc;

-- 23.	Display the count of transactions and total revenue for each salesperson where transactions happened in the first quarter (January to March) of 2024 only.
select salesperson_name,
count(*) as total_count,
sum(amount) as total_revenue
from sales 
where sale_date between '2024-01-01' and '2024-03-31'
group by salesperson_name;


-- 24.	Display the maximum quantity sold in a single transaction per region.
select region , 
max(quantity) as max_quantity
from sales 
group by region;

-- 25.	Display total revenue per product with a grand total row at the end using the automatic summary feature.
select product_name ,
sum(amount) as total_revenue
from sales 
group by product_name WITH ROLLUP;

-- 26.	Display the number of distinct products sold by each salesperson.
select salesperson_name, 
count( distinct product_name) as total_products_sold
from sales
group by salesperson_name;

-- 27.	Display the total revenue per category per customer type (group by two columns) sorted by category alphabetically.
select category,
customer_type,
sum(amount) as total_revenue
from sales
group by category, customer_type
order by category;

-- 28.	Display only those regions where total revenue exceeds 50000 and the number of transactions is more than 4.
select 
region,
sum(amount) as total_revenue,
count(*) as count 
from sales 
group by region
having sum(amount) > 50000 and count(*) > 4 ;

-- 29.	Display total revenue grouped by month number only across all years, sorted from January to December.
select 
month(sale_date) as months ,
sum(amount) as total_revenue
from sales 
group by month(sale_date) 
order by month(sale_date);

-- 30.	Display each salesperson's performance summary showing total transactions, total revenue, average per transaction, highest single sale, and lowest single sale all in one grouped query sorted by total revenue descending.
select salesperson_name,
count(*) as total_transactions,
sum(amount) as total_revenue,
avg(amount) as average_per_transactions,
max(amount) as highest_sale,
min(amount) as lowest_sale
from sales
group by salesperson_name
order by sum(amount) desc;

-- 1. Create Database

create database if not exists retail_db;
use retail_db;


-- 2. Create Table

create table sales_data (
    sale_id int primary key auto_increment,
    salesperson_name varchar(100) not null,
    region varchar(60),
    city varchar(60),
    product_name varchar(100),
    category varchar(60),
    quantity int,
    unit_price decimal(10,2),
    discount_percent decimal(5,2),
    sale_date date,
    customer_type varchar(40),
    payment_mode varchar(40)
);


-- Insert 20 Records

insert into sales_data
(salesperson_name, region, city, product_name, category, quantity, unit_price, discount_percent, sale_date, customer_type, payment_mode)
values
('Ravi Sharma','North','Pune','Laptop','Electronics',2,55000,10,'2024-01-08','Corporate','Card'),
('Priya Mehta','West','Mumbai','Smartphone','Electronics',3,22000,8,'2024-01-15','Retail','UPI'),
('Ravi Sharma','North','Delhi','Office Chair','Furniture',1,12000,5,'2024-01-22','Corporate','Card'),
('Anand Joshi','South','Chennai','Notebook','Stationery',15,120,2,'2024-02-05','Retail','Cash'),
('Priya Mehta','West','Pune','Laptop','Electronics',1,55000,10,'2024-02-12','Corporate','Card'),
('Kavita Rao','East','Nagpur','Headphones','Electronics',4,3500,12,'2024-02-20','Retail','UPI'),
('Ravi Sharma','North','Delhi','Desk','Furniture',2,18000,7,'2024-03-01','Government','Card'),
('Anand Joshi','South','Mumbai','Smartphone','Electronics',1,22000,8,'2024-03-10','Retail','Cash'),
('Kavita Rao','East','Nagpur','Laptop','Electronics',1,55000,10,'2024-03-18','Corporate','UPI'),
('Priya Mehta','West','Chennai','Notebook','Stationery',20,120,2,'2024-04-02','Retail','Cash'),
('Ravi Sharma','North','Pune','Tablet','Electronics',1,35000,15,'2024-04-15','Corporate','Card'),
('Anand Joshi','South','Nagpur','Office Chair','Furniture',2,12000,5,'2024-04-22','Government','Card'),
('Kavita Rao','East','Delhi','Printer','Electronics',2,12000,10,'2024-05-05','Corporate','UPI'),
('Priya Mehta','West','Mumbai','Desk','Furniture',1,18000,7,'2024-05-12','Retail','Card'),
('Ravi Sharma','North','Chennai','Headphones','Electronics',3,3500,12,'2024-05-20','Retail','Cash'),
('Anand Joshi','South','Pune','Laptop','Electronics',2,55000,10,'2024-06-02','Corporate','Card'),
('Kavita Rao','East','Mumbai','Notebook','Stationery',25,120,2,'2024-06-10','Retail','UPI'),
('Priya Mehta','West','Delhi','Tablet','Electronics',1,35000,15,'2024-06-18','Corporate','Card'),
('Ravi Sharma','North','Nagpur','Printer','Electronics',1,12000,10,'2024-06-25','Government','Card'),
('Anand Joshi','South','Chennai','Desk','Furniture',1,18000,7,'2024-06-28','Corporate','UPI');


-- 3.	Display all unique regions present in the sales data.
select distinct region 
from sales_data;

-- 4.	Display all unique cities from which sales have been recorded.
select distinct city
 from sales_data;

-- 5.	Display all unique product names that have been sold.
select distinct product_name
from sales_data;

-- 6.	Display all unique categories of products that appear in the sales records.
select distinct category
from sales_data;

-- 7.	Display all unique payment modes used across all transactions.
select distinct payment_mode 
from sales_data;

-- 8.	Display all unique customer types that appear in the data.
select distinct customer_type
from sales_data;

-- 9.	Display all unique salesperson names who have made at least one sale.
select distinct salesperson_name 
from sales_data;

-- 10.	Display all unique combinations of region and city to understand the geographic coverage of the sales team.
select distinct region , city 
from sales_data;

-- 11.	Display all unique combinations of category and product name to get a clean product catalog view from the sales data.
select distinct category, product_name
from sales_data;

-- 12.	Display all unique combinations of salesperson name and region to understand which salesperson covers which region.
select distinct salesperson_name , region 
from sales_data;

-- 13.	Display all unique combinations of customer type and payment mode to understand customer payment behavior patterns.
select distinct customer_type, payment_mode
from sales_data;

-- 14.	Display all unique total sale values computed as quantity multiplied by unit_price, across all transactions, without repeating any total value that appears more than once.
select 
distinct quantity * unit_price as total_sale_value
from sales_data;

-- 15.	Display all unique discounted price values per unit, computed as unit_price minus the discount amount on unit_price, without any repeated computed values.
select 
distinct round( unit_price - (unit_price * (discount_percent / 100 ) ) , 2)  as discounted_price
from sales_data;

-- 16.	Display all unique revenue values after discount, computed as quantity multiplied by the discounted unit price for each row, sorted from highest to lowest.
select 
distinct round(quantity * ( unit_price - (unit_price * (discount_percent / 100 ) ) ) , 2)  as total_revenue
from sales_data
order by total_revenue desc ;

-- 17.	Display all unique combinations of city and the computed total transaction value (quantity multiplied by unit_price) together.
select distinct city , quantity * unit_price as total_transaction
from sales_data;

-- 18.	Display all unique combinations of region and a computed column that places each transaction into a price bracket: transactions with unit_price above 30000 in one group, between 10000 and 30000 in another, and below 10000 in a third group.
select 
distinct region, 
case 
  when unit_price > 30000 then "High"
  when unit_price > 10000 then "Medium"
  else "Low"
end as price_brackets
from sales_data;  

-- 19.	Display all unique combinations of salesperson name and category to understand which salesperson has sold which types of products.
select distinct salesperson_name , category 
from sales_data;

-- 20.	Display all unique combinations of city and payment mode to understand payment preferences across different cities.
select distinct city , payment_mode 
from sales_data;

-- 21.	Display all unique values of a computed column that rounds the unit_price down to the nearest 10000, to understand the distinct price bands in the product catalog.
select 
 distinct floor(unit_price/10000) * 10000 as rounded_unit_price
from sales_data;

-- 22.	Display all unique combinations of salesperson name, city, and the computed total revenue (quantity multiplied by unit_price) for each sale, without any repeated full combination.
select 
distinct salesperson_name , city , quantity * unit_price as total_revenue
from sales_data;

-- 23.	Count the total number of unique cities from which sales have been made and display that count.
select count(distinct city) as unique_city_count
from sales_data;

-- 24.	Count the total number of unique products sold per region, showing each region with its unique product count.
select region, count( distinct product_name) as unique_products
from sales_data
group by region;

-- 25.	Count the number of unique salespersons who have sold in each city, showing city and the count.
select city , count( distinct salesperson_name) as salesperson_count
from sales_data
group by city;

-- 26.	Display all unique combinations of category and a computed column that classifies each sale's total value (quantity multiplied by unit_price) as High Value if above 50000, Medium Value if between 10000 and 50000, and Low Value if below 10000.
select 
distinct category ,
case 
  when quantity * unit_price > 50000 then "High Value"
  when quantity * unit_price > 10000 then "Medium Value"
  else "Low Value"
end as value_class
from sales_data;  

-- 27.	Display all unique salesperson and payment mode combinations only for transactions that happened in the first quarter of 2024 (January through March).
select 
distinct salesperson_name, payment_mode 
from sales_data
where sale_date between '2024-01-01' and '2024-03-31';

-- 28.	Display all unique city and discount bracket combinations, where the discount bracket is defined as Low for discount below 5 percent, Medium for 5 to 10 percent, and High for above 10 percent.
select 
distinct city,
case
   when discount_percent < 5 then "Low"
   when discount_percent <= 10 then "Medium"
   else "High"
end as discount_bracket   
from sales_data;

-- 29.	Display all unique combinations of region, category, and a computed net revenue column (quantity multiplied by unit_price after subtracting the discount) rounded to the nearest 1000, to understand revenue patterns across regions and categories.
select 
distinct region, category , 
round( quantity * unit_price - ( (quantity*unit_price) * (discount_percent/100) ) , -3) as net_revenue
from sales_data;

-- 30.	Display all unique salesperson names alongside the unique count of cities they have sold in and the unique count of product categories they have covered, using a single grouped query that incorporates unique value counting.
select salesperson_name,
count( distinct city) as city_count ,
count(distinct category) as category_count
from sales_data
group by salesperson_name;


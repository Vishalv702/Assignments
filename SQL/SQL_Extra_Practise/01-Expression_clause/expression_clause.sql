create database if not exists ecommerce;
use ecommerce;

create table product_sales(
sale_id int primary key auto_increment,
product_name varchar(100) not null,
category varchar(50),
quantity int,
unit_price decimal(10 , 2 ),
cost_price decimal( 10, 2),
sale_date date,
city varchar(60),
discount_percentage decimal(5 , 2)
);

insert into product_sales
(product_name, category, quantity, unit_price, cost_price, sale_date, city, discount_percentage)
values
('Laptop', 'Electronics', 2, 55000, 42000, '2024-01-10', 'Pune', 10),
('Smartphone', 'Electronics', 3, 22000, 16000, '2024-01-18', 'Mumbai', 8),
('Office Chair', 'Furniture', 1, 12000, 8500, '2024-02-05', 'Delhi', 5),
('Notebook', 'Stationery', 15, 120, 80, '2024-02-12', 'Pune', 2),
('Headphones', 'Electronics', 4, 3500, 2200, '2024-02-20', 'Nagpur', 12),
('Desk', 'Furniture', 2, 18000, 13000, '2024-03-01', 'Mumbai', 7),
('Pen Set', 'Stationery', 25, 60, 35, '2024-03-15', 'Delhi', 0),
('Tablet', 'Electronics', 1, 35000, 27000, '2024-03-22', 'Pune', 15),
('Bookshelf', 'Furniture', 3, 8500, 6000, '2024-04-05', 'Chennai', 5),
('Printer', 'Electronics', 2, 12000, 9000, '2024-04-18', 'Mumbai', 10),
('Whiteboard', 'Stationery', 5, 1800, 1200, '2024-05-02', 'Pune', 3),
('Webcam', 'Electronics', 6, 2800, 1900, '2024-05-15', 'Delhi', 8);

-- 3.	Display each product name and the total revenue for that sale row computed as quantity multiplied by unit_price.
select 
product_name,
quantity * unit_price as revenue
from product_sales;

-- 4.	Display each product name, unit_price, and the discount amount in rupees per unit.
select
product_name, 
unit_price,
round(unit_price * ( discount_percentage / 100) , 2) as discount_ammount
from product_sales;

-- 5.	Display the final unit price for each product after applying its individual discount percentage.
select 
product_name,
round( unit_price -  ( unit_price * (discount_percentage/100) )   ,2) as discounted_price
from product_sales;

-- 6.	Display each product's total sale value and the total cost value as two separate computed columns, then compute the gross profit as a third computed column.
select 
product_name,
total_sale,
total_cost,
total_sale - total_cost as gross_profit
from (
select 
product_name,
unit_price * quantity as total_sale,
cost_price * quantity as total_cost 
from product_sales
)t;

-- 7.	Display each product's profit margin as a percentage computed as profit divided by unit_price multiplied by 100, rounded to 2 decimal places.
select
product_name,
round( ( (unit_price - cost_price)/unit_price ) * 100 ,2) as profit_margin
from product_sales;

-- 8.	Display each product with a column showing what the unit_price would be after adding 18 percent GST to the discounted price.
select
product_name,
unit_price,
round( discounted_price + ( discounted_price * (18/100) )  ,2) as after_gst_price
from (
select 
product_name,
unit_price,
round( unit_price - (unit_price * (discount_percentage / 100)  ) , 2 ) as discounted_price
from product_sales	
)t;

-- 9.	Display all products where the total sale value (quantity multiplied by unit_price) exceeds 50000.
select
product_name,
total_sale
from (
select 
product_name,
quantity * unit_price as total_sale
from product_sales
)t
where total_sale > 50000;

-- 10.	Display all products where the profit per unit (unit_price minus cost_price) is greater than 5000.

select
product_name,
profit_per_unit
from (
select
product_name,
round( unit_price - cost_price ,2) as profit_per_unit
from product_sales
)t
where profit_per_unit > 5000;


-- 11.	Display all products where even after the discount the selling price remains above 10000.
select
product_name,
selling_price
from (
select
product_name,
round( unit_price - (unit_price * discount_percentage / 100 ) ,2 ) as selling_price
from product_sales
)t
where selling_price > 10000;

-- 12.	Display today's date alongside each product name and sale_date, and compute the number of days since each sale happened.
select
product_name,
curdate() as todays_date,
sale_date,
datediff(curdate() , sale_date) as days_sale_happened
from product_sales;

-- 13.	Display each product's sale_date along with a column showing what date it would be 90 days after the sale.
select
product_name,
sale_date,
date_add(sale_date, interval 90 day) as after_90_days
from product_sales;


-- 14.	Display the year and month extracted from sale_date as two separate columns alongside product_name.

select
product_name,
month(sale_date) as sale_month,
year(sale_date) as sale_year
from product_sales;

-- 15.	Display product_name and sale_date only for sales that happened more than 60 days ago from today.
select
product_name,
sale_date
from product_sales
where datediff(curdate(), sale_date) > 60;

-- 16.	Display each product name in uppercase and the unit_price rounded up to the nearest whole number using the ceiling function.
select
 upper(product_name),
 ceil(unit_price)
 from product_sales;


-- 17.	Display the absolute difference between unit_price and cost_price for each product with the heading "Price Gap".
select
product_name,
abs(unit_price - cost_price) as price_gap
from product_sales;

-- 18.	Display each product's total revenue and find the remainder when divided by 1000 to identify leftover units after bulk pricing. 
select 
product_name,
total_revenue , 
mod(total_revenue,1000) as leftover_units
from (
select 
product_name,
quantity * unit_price as total_revenue from product_sales
)t;

-- 19.	Display a column that shows a value of 1 for all products where profit exceeds 30 percent of cost_price, and 0 otherwise, using a Boolean expression directly in SELECT.
select 
product_name,
profit,
profit > 30 as boolean_value
from 
(select 
product_name, 
round(  ( (unit_price-cost_price) / cost_price) * 100,2) as profit 
from product_sales
)t;

-- 20.	Display product_name, quantity, and a column that shows whether the quantity is even or odd by computing quantity modulo 2.

select 
product_name,
quantity,
case 
when mod(quantity ,2) = 0 then "Even"
else "Odd"
end as quantity_type 
from product_sales;

-- 21.	Display a column that computes unit_price multiplied by quantity, then subtracts the discount amount, then adds 18 percent GST, all in one expression labeled "Final Taxed Revenue".
select
product_name,
round(  ( (unit_price *quantity) - ( (unit_price *quantity) * (discount_percentage /100 ) )  ) + ( ( (unit_price *quantity) - 
( (unit_price *quantity) * (discount_percentage /100 ) )  ) 
* ( 18 / 100) )   ,2 ) as Final_Taxed_Revenue
from product_sales;

-- 22.	Display only those sales where the computed profit percentage (unit_price minus cost_price divided by cost_price multiplied by 100) is greater than 30.

select 
product_name,
quantity,
profit_percentage
from (
select 
product_name,
quantity,
round( ((unit_price - cost_price) / cost_price ) * 100  ,2) as profit_percentage
from product_sales  
)t
where profit_percentage > 30;

-- 23.	Display all sales from the current year by extracting the year from sale_date and comparing it to the current year.

select *  
from product_sales
where year(sale_date) = year(curdate());

-- 24.	Display product_name and compute how many days are remaining until 365 days after the sale_date, labeled "Days Until Annual Mark".

select 
product_name,
datediff( date_add(sale_date, interval 365 day) , curdate() ) as "Days until annual Mark"
from product_sales;


-- 25.	Display product_name, unit_price, and show what the price would be if a flat 500 rupee reduction followed by a 5 percent additional discount were applied.

select
product_name,
unit_price,
round( (unit_price - 500) - ( (unit_price- 500) * (5/100) ) ,2)     as price_after_discount
from product_sales;


-- 26.	Display using a conditional function: show "High Profit" if profit per unit exceeds 5000, otherwise show "Low Profit".

select
product_name,
unit_price,
cost_price,
if( (unit_price - cost_price ) > 5000, "High Profit", "Low Profit" ) as profit
from product_sales;

-- 27.	Display the formatted sale_date in day-month-year format alongside each product name, but ensure sorting uses the raw date value.

select 
product_name,
date_format(sale_date, '%d-%m-%y') as formatted_date
from product_sales;

-- 28.	Display a summary column that concatenates product name, category, and total sale value in a readable format using string and arithmetic expressions together.

select
concat(product_name, category, quantity*unit_price) as summary
from product_sales;

-- 29.	Display all sales where the sale happened in an even month number (January is 1, February is 2, and so on).

select * 
from product_sales
where mod(month(sale_date) , 2) = 0;

-- 30.	Display each product with a column showing the tax amount (18 percent of the discounted total value) and the grand total including tax, both rounded to 2 decimal places.

select
product_name,
price_after_discount,
round( price_after_discount * (18/100) ,2) as tax_amount,
round( price_after_discount +  price_after_discount * (18/100)   ,2) as grand_total
from ( 
select 
product_name,
round(unit_price - ( unit_price* (discount_percentage/100) ),2)   as price_after_discount
from product_sales
)t;


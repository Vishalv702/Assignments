-- 1. Create Database

create database if not exists bookstore;
use bookstore;

-- 2. Create Table

create table book_sales (
sale_id int primary key auto_increment,
book_title varchar(150) not null,
author_name varchar(100),
genre varchar(60),
quantity_sold int,
price decimal(8,2),
sale_date date,
city varchar(60),
rating decimal(3,1)
);

-- Insert Records

insert into book_sales
(book_title, author_name, genre, quantity_sold, price, sale_date, city, rating)
values
('The Alchemist', 'Paulo Coelho', 'Fiction', 5, 350, '2023-01-15', 'Pune', 4.8),
('Atomic Habits', 'James Clear', 'Self Help', 8, 499, '2023-02-10', 'Mumbai', 4.9),
('Sapiens', 'Yuval Harari', 'History', 3, 599, '2023-03-05', 'Delhi', 4.7),
('Wings of Fire', 'APJ Abdul Kalam', 'Biography', 12, 275, '2023-03-22', 'Pune', 4.9),
('Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 6, 399, '2023-04-08', 'Nagpur', 4.6),
('Clean Code', 'Robert Martin', 'Technology', 4, 1200, '2023-04-25', 'Mumbai', 4.8),
('Ikigai', 'Francesc Miralles', 'Self Help', 10, 320, '2023-05-12', 'Chennai', 4.7),
('Zero to One', 'Peter Thiel', 'Business', 7, 499, '2023-06-01', 'Pune', 4.5),
('The Psychology of Money', 'Morgan Housel', 'Finance', 9, 450, '2023-06-18', 'Delhi', 4.9),
('Deep Work', 'Cal Newport', 'Self Help', 5, 380, '2023-07-03', 'Mumbai', 4.6),
('1984', 'George Orwell', 'Fiction', 4, 299, '2023-07-20', 'Nagpur', 4.8),
('The Lean Startup', 'Eric Ries', 'Business', 3, 549, '2023-08-05', 'Pune', 4.4),
('Educated', 'Tara Westover', 'Biography', 6, 420, '2023-08-22', 'Chennai', 4.7),
('SQL in 10 Minutes', 'Ben Forta', 'Technology', 11, 899, '2023-09-10', 'Delhi', 4.5),
('The Subtle Art', 'Mark Manson', 'Self Help', 8, 350, '2023-09-28', 'Mumbai', 4.6);

-- 3. Display all books sorted by price from lowest to highest.

select * from book_sales
order by price asc;

-- 4.	Display all books sorted by price from highest to lowest.
select * from book_sales
order by price desc;

-- 5.	Display all books sorted by book_title in alphabetical order.
select * from book_sales
order by book_title;

-- 6.	Display all books sorted by rating from highest to lowest, then by price from lowest to highest for books with the same rating.
select * from book_sales
order by rating desc, price asc;

-- 7.	Display all books sorted by genre alphabetically and within each genre by quantity_sold from highest to lowest.
select * from book_sales 
order by genre asc, quantity_sold desc;

-- 8.	Display books sorted by the total sale value (quantity_sold multiplied by price) from highest to lowest.
select * from book_sales
order by (quantity_sold * price) desc;

-- 9.	Display books sorted explicitly in a case-insensitive alphabetical order of author_name regardless of whether names are stored in mixed case.
select * from book_sales
order by upper(author_name);

-- 10.	Display books sorted by the length of book_title from shortest title to longest title.
select * from book_sales
order by length(book_title) ;

-- 11.	Display books sorted by the length of book_title from longest to shortest, and for books with the same title length, sort alphabetically.
select * from book_sales
order by length(book_title) desc , book_title;

-- 12.	Display all sales showing the oldest transaction first.
select * from book_sales
order by sale_date;

-- 13.	Display all sales showing the most recent transaction first.
select * from book_sales
order by sale_date desc ;

-- 14.	Display all sales with the newest sale_date first, and for sales on the same date, sort by book_title alphabetically.
select * from book_sales
order by sale_date desc, book_title asc;

-- 15.	Display all books sorted by the month number of their sale_date only, from January to December, ignoring the year.
select * from book_sales
order by month(sale_date);

-- 16.	Display all sales sorted by year first and then by month within each year in the correct chronological sequence.
select * from book_sales
order by year(sale_date) , month(sale_date);

-- 17.	Display all books sorted by how many days ago the sale happened, with the most recent sale appearing first.
select * from book_sales
order by datediff(curdate(),sale_date);

-- 18.	Display book_title and a formatted sale_date shown as a readable label like "15 January 2023", but ensure the rows are sorted using the actual date value stored.
select book_title,
date_format(sale_date, '%d %M %Y') as formatted_date
from book_sales
order by sale_date;

-- 19.	Display books sorted by price category defined as: prices above 800 should appear first, then prices between 400 and 800, then prices below 400.
select * ,
case 
when price >800 then 1 
when price >400 then 2 
else 3
end as price_case

from book_sales
order by price_case , price desc;

-- 20.	Display author names sorted in reverse alphabetical order.
select * from book_sales
order by author_name desc;

-- 21.	Display books sorted by rating in descending order, but books with a null rating (if any exist after adding a new row with no rating) should appear at the end.
select * from book_sales
order by rating is null, rating desc;

-- 22.	Insert a new sale record with book_title "Thinking Fast and Slow", author "Daniel Kahneman", genre "Psychology", quantity 7, price 520, date 2023-10-15, city Pune, rating 4.8. Then display all records sorted by sale_date descending.
insert into book_sales
( book_title, author_name, genre, quantity_sold, price, sale_date, city, rating )
values
('Thinking Fast and Slow', 'Daniel Kahneman','Psychology',7,520,'2023-10-15','Pune', 4.8 );

select * from book_sales
order by sale_date desc;


-- 23.	Display books in Self Help genre sorted by quantity_sold descending.
select * from book_sales
where genre ="Self Help"
order by quantity_sold desc;

-- 24.	Display all books sorted by the computed profit assuming cost is 60 percent of price, from highest profit to lowest.
select * from book_sales 
order by price - (price *0.6) desc;

-- 25.	Display all cities from which sales happened, sorted alphabetically without repeating any city.
select distinct city from book_sales
order by city;

-- 26.	Display books sorted by genre alphabetically, then within each genre by sale_date from oldest to newest.
select * from book_sales
order by genre , sale_date;

-- 27.	Display all records sorted by the absolute difference between rating and 4.5 in ascending order, showing books closest to a 4.5 rating first.
select * from book_sales
order by abs(4.5 - rating);

-- 28.	Display book_title and sale_date formatted as month name and year (for example August 2023), sorted by the raw date value from newest to oldest.
select book_title,
date_format(sale_date , '%M %Y') as formatted_date
from book_sales
order by sale_date desc;

-- 29.	Display books sorted by quantity_sold multiplied by price (total revenue) in descending order and limit the view to show clearly which book generated the most revenue.
select * from book_sales 
order by quantity_sold*price desc
limit 1;

-- 30.	Display all books sorted first by city alphabetically, then by rating descending within each city
select * from book_sales
order by city , rating desc;

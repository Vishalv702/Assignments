-- 1. Create a schema named `restaurant_db`.
create schema if not exists restaurant_db;

-- 2. Create a table `restaurants` with proper columns and suitable data types.
use restaurant_db;

-- 3. Add columns such as restaurant_id, restaurant_name, city, cuisine_type, rating, total_staff, average_cost, opening_date, and contact_number.
create table restaurants (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    cuisine_type VARCHAR(50),
    rating DECIMAL(2,1),
    total_staff INT,
    average_cost INT,
    opening_date DATE,
    contact_number VARCHAR(15)
);

-- 4. Insert 10 restaurant records into the table.
INSERT INTO restaurants
(restaurant_name, city, cuisine_type, rating, total_staff, average_cost, opening_date, contact_number)
VALUES
('Spice Villa', 'Pune', 'Indian', 4.5, 12, 1200, '2021-05-12', '9876543210'),
('Ocean Delight', 'Mumbai', 'Seafood', 4.2, 15, 1800, '2020-08-20', '9876501234'),
('Pizza Hub', 'Pune', 'Italian', 3.9, 8, 900, '2022-03-15', '9988776655'),
('Saffron Treat', 'Delhi', 'Indian', 4.7, 20, 2200, '2019-11-10', '9123456780'),
('Dragon Bowl', 'Bangalore', 'Chinese', 4.1, 10, 1100, '2023-01-05', '9012345678'),
('Burger Point', 'Mumbai', 'Fast Food', 3.8, 6, 700, '2021-09-17', '9090909090'),
('South Aroma', 'Chennai', 'South Indian', 4.6, 18, 1300, '2018-06-25', '9345678901'),
('Tandoori Nights', 'Pune', 'Indian', 4.3, 14, 1600, '2022-12-01', '9887766554'),
('Cafe Mocha', 'Hyderabad', 'Cafe', 4.0, 9, 850, '2020-02-14', '9765432109'),
('Sushi World', 'Bangalore', 'Japanese', 4.8, 16, 2500, '2023-07-19', '9654321098');

-- 5. Display all records from the restaurants table.
select * from restaurants;

-- 6. Display only restaurant names and city names.
select restaurant_name,city from restaurants;

-- 7. Find restaurants located in Pune.
select 
restaurant_name,city 
from restaurants
where city ='pune';

-- 8. Find restaurants having rating greater than 4.
select restaurant_name,rating
from restaurants
where rating >4;

-- 9. Display restaurants with average cost less than 1000.
select restaurant_name,average_cost
from restaurants
where average_cost <1000;
-- 10. Find restaurants that serve Indian cuisine.
select restaurant_name,cuisine_type
from restaurants
where cuisine_type='Indian';

-- 11. Display restaurant names in alphabetical order.
select restaurant_name
from restaurants
order by restaurant_name;

-- 12. Display restaurant records sorted by rating in descending order.
select restaurant_name,rating
from restaurants
order by rating desc;

-- 13. Display distinct city names from the restaurants table.
select distinct(city) 
from restaurants;

-- 14. Display distinct cuisine types available in the table.
select distinct(cuisine_type)
from restaurants;

-- 15. Count total number of restaurants.
select count(*) as total_restaurants
from restaurants;

-- 16. Find the highest restaurant rating.
select max(rating) 
from restaurants;

-- 17. Find the minimum average cost.
select min(average_cost) 
from restaurants;

-- 18. Find the average rating of all restaurants.
select avg(rating) as average_ratings
from restaurants;

-- 19. Find total number of staff working in all restaurants.
select sum(total_staff) as all_staff
from restaurants;

-- 20. Display top 5 restaurants using LIMIT clause.
select restaurant_name,city
from restaurants
order by rating desc
limit 5;

-- 21. Display first 3 restaurant records.
select *
from restaurants
limit 3;

-- 22. Display restaurants after skipping first 2 records using LIMIT clause.
select restaurant_name,city
from restaurants
limit 10
offset 2;

-- 23. Find restaurants with ratings between 3 and 5.
select restaurant_name,city,rating
from restaurants
where rating between 3 and 5;

-- 24. Display restaurants whose names start with letter ‘S’.
select restaurant_name,city
from restaurants
where restaurant_name like 'S%';

-- 25. Display restaurants whose names end with letter ‘a’.
select restaurant_name,city
from restaurants
where restaurant_name like '%a';

-- 26. Count restaurants city-wise using GROUP BY clause.
select city,count(restaurant_name) as city_wise_count
from restaurants
group by city;

-- 27. Count restaurants cuisine-wise using GROUP BY clause.
select cuisine_type,count(restaurant_name) as city_wise_count
from restaurants
group by cuisine_type;

-- 28. Find average rating city-wise using GROUP BY clause.
select city,avg(rating)
from restaurants
group by city;

-- 29. Find maximum average cost city-wise.
select city,max(average_cost)
from restaurants
group by city;

-- 30. Find minimum rating cuisine-wise.
select cuisine_type,min(rating)
from restaurants
group by cuisine_type;

-- 31. Find total staff city-wise using GROUP BY clause.
select city,sum(total_staff)
from restaurants
group by city;

-- 32. Display number of restaurants in each city.
select city, count(restaurant_name) as restaurant_count
from restaurants
group by city;

-- 33. Find cities having more than 2 restaurants using HAVING clause.
select city, count(restaurant_name) as restaurant_count
from restaurants
group by city
having restaurant_count >2;

-- 34. Find cuisine types with average rating greater than 4 using HAVING clause.
select cuisine_type,avg(rating) as avg_rating
from restaurants
group by cuisine_type
having avg_rating >4;

-- 35. Display cities where total staff is greater than 20 using HAVING clause.
select city,sum(total_staff) as all_staff
from restaurants
group by city
having all_staff >20;

-- 36. Find cuisine types having more than 1 restaurant.
select cuisine_type,count(restaurant_name) as restaurant_count
from restaurants
group by cuisine_type
having restaurant_count > 1;

-- 37. Display cities with average restaurant cost greater than 1500.
select city,average_cost
from restaurants 
where average_cost > 1500;

-- 38. Find restaurant categories with maximum rating above 4.5
select cuisine_type,max(rating) as max_rating
from restaurants
group by cuisine_type
having max(rating) > 4.5;

-- 39. Display top 3 highest-rated restaurants.
select restaurant_name
from restaurants
order by rating desc 
limit 3;

-- 40. Display lowest 5 restaurant costs using ORDER BY and LIMIT.
select restaurant_name, average_cost 
from restaurants
order by average_cost 
limit 5;

-- 41. Find distinct ratings available in the table.
select distinct(rating)
from restaurants;

-- 42. Display restaurant names and ratings sorted by city.
select restaurant_name, city,rating 
from restaurants
order by city;

-- 43. Count restaurants opened after year 2020.
select count(restaurant_name) as restaurants_count
from restaurants 
where opening_date > "2020-01-01";

-- 44. Display cuisine types in descending alphabetical order.
select cuisine_type
from restaurants
order by cuisine_type desc;

-- 45. Find average restaurant cost cuisine-wise.
select cuisine_type, avg(average_cost) as avg_cost
from restaurants
group by cuisine_type;

-- 46. Find total restaurants for each rating.
select rating, count(restaurant_name)
from restaurants
group by rating;

-- 47. Display only unique city and cuisine combinations.
select distinct city, cuisine_type
from restaurants;

-- 48. Find restaurants with duplicate cuisine types using GROUP BY.
select cuisine_type, count(restaurant_name) as rest_count
from restaurants
group by cuisine_type
having rest_count >1;

-- 49. Display cities having exactly 2 restaurants using HAVING clause.
select city, count(restaurant_name) as rest_count
from restaurants
group by city
having rest_count = 2;

-- 50. Find top 2 cities with highest average restaurant rating using GROUP BY, ORDER BY, and LIMIT clauses.

select city,avg(rating) as avg_rating
from restaurants
group by city
order by avg_rating desc
limit 2 ;

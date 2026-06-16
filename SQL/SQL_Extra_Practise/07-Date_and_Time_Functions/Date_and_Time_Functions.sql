CREATE DATABASE IF NOT EXISTS eventmgmt_db;
USE eventmgmt_db;

CREATE TABLE events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(150) NOT NULL,
    category VARCHAR(60),
    organizer_name VARCHAR(100),
    city VARCHAR(60),
    venue VARCHAR(150),
    start_datetime DATETIME,
    end_datetime DATETIME,
    registration_deadline DATE,
    max_participants INT,
    registered_count INT,
    ticket_price DECIMAL(10,2),
    event_status VARCHAR(30)
);

-- Insert 15 Records

INSERT INTO events
(event_name, category, organizer_name, city, venue,
start_datetime, end_datetime, registration_deadline,
max_participants, registered_count, ticket_price, event_status)
VALUES
('Tech Summit', 'Conference', 'Ramesh Joshi', 'Pune', 'Convention Hall',
'2024-01-15 09:00:00', '2024-01-15 18:00:00', '2024-01-10',
500, 480, 2500, 'Completed'),
('Music Fest', 'Entertainment', 'Sunita Rao', 'Mumbai', 'Bandra Amphitheater',
'2024-02-10 17:00:00', '2024-02-10 23:00:00', '2024-02-05',
2000, 1850, 800, 'Completed'),
('Startup Expo', 'Business', 'Anil Mehta', 'Delhi', 'Pragati Maidan',
'2024-03-20 10:00:00', '2024-03-22 19:00:00', '2024-03-15',
1000, 920, 1500, 'Completed'),
('Art Exhibition', 'Culture', 'Meena Patil', 'Pune', 'Nehru Memorial',
'2024-04-05 11:00:00', '2024-04-07 20:00:00', '2024-04-01',
300, 275, 500, 'Completed'),
('Health Walkathon', 'Sports', 'Vikram Singh', 'Nagpur', 'Civil Lines',
'2024-04-21 06:00:00', '2024-04-21 10:00:00', '2024-04-18',
5000, 4200, 200, 'Completed'),
('Food Festival', 'Lifestyle', 'Priya Mehta', 'Chennai', 'Marina Beach',
'2024-05-12 12:00:00', '2024-05-14 22:00:00', '2024-05-08',
3000, 2800, 300, 'Completed'),
('Coding Marathon', 'Technology', 'Suresh Kumar', 'Pune', 'IIT Campus',
'2024-05-25 08:00:00', '2024-05-26 20:00:00', '2024-05-20',
400, 395, 1000, 'Completed'),
('Book Fair', 'Education', 'Divya Nair', 'Mumbai', 'NSCI Dome',
'2024-06-08 10:00:00', '2024-06-10 19:00:00', '2024-06-04',
5000, 3200, 100, 'Completed'),
('Photography Contest', 'Culture', 'Harish Tiwari', 'Delhi', 'India Gate',
'2024-07-14 09:00:00', '2024-07-14 17:00:00', '2024-07-10',
200, 185, 750, 'Completed'),
('Business Leadership Summit', 'Business', 'Lata Iyer', 'Hyderabad', 'Novotel',
'2024-08-22 09:00:00', '2024-08-23 18:00:00', '2024-08-17',
600, 520, 5000, 'Completed'),
('Yoga Wellness Camp', 'Sports', 'Rohit Desai', 'Pune', 'Osho Park',
'2024-09-07 06:00:00', '2024-09-08 08:00:00', '2024-09-03',
150, 148, 400, 'Completed'),
('Fashion Show', 'Lifestyle', 'Kavita Reddy', 'Mumbai', 'JW Marriott',
'2024-10-18 19:00:00', '2024-10-18 23:30:00', '2024-10-14',
800, 750, 3000, 'Upcoming'),
('AI Conference', 'Technology', 'Nikhil Jain', 'Delhi', 'Taj Hotel',
'2024-11-05 09:00:00', '2024-11-06 18:00:00', '2024-11-01',
700, 620, 4500, 'Upcoming'),
('Dance Championship', 'Entertainment', 'Pooja Gupta', 'Chennai', 'Music Academy',
'2024-11-24 14:00:00', '2024-11-24 22:00:00', '2024-11-20',
1000, 890, 600, 'Upcoming'),
('New Year Gala', 'Lifestyle', 'Arjun Pillai', 'Mumbai', 'Taj Mahal Palace',
'2024-12-31 20:00:00', '2025-01-01 02:00:00', '2024-12-25',
500, 450, 8000, 'Upcoming');


-- 3.	Display the current date, the current time, and the current full date and time as three separate columns in a single query.

select 
curdate() as current_dates,
curtime() as current_times,
now() as full_date;

select * from events;
-- 4.	Display each event's name and the year, month, and day extracted separately from the start_datetime.

select event_name, 
year(start_datetime) as years,
month(start_datetime) as months,
day(start_datetime) as days
from events;

-- 5.	Display each event's name and the hour, minute, and second extracted separately from the start_datetime.

select event_name,
hour(start_datetime) as hours,
minute(start_datetime) as minutes,
second(start_datetime) as seconds
from events;

-- 6.	Display each event's name and the month name and day name (full names like January, Monday) of the start date.
select event_name,
monthname(start_datetime) as month_name,
dayname(start_datetime) as day_name
from events;

-- 7.	Display each event's name and compute the duration of each event in hours using the start and end datetime values.

select event_name,
timestampdiff(hour, start_datetime, end_datetime) as diff_in_hours
from events;

-- 8.	Display each event's name and compute the duration in minutes.

select event_name,
timestampdiff(minute, start_datetime, end_datetime) as diff_in_minutes
from events;

-- 9.	Display each event's name, registration deadline, and compute how many days before the event start the registration closes.

select event_name,
registration_deadline,
datediff( start_datetime , registration_deadline) as diff_in_days
from events;

-- 10.	Display each event's name and compute how many days ago the event started (or how many days until it starts for upcoming events), showing the absolute number of days.

select event_name, 
abs( datediff(start_datetime, now() ) ) as diff_in_days
from events;

-- 11.	Display each event's name and its start date in Indian format as day-month-year with dashes.

select event_name,
date_format(  start_datetime,'%d-%m-%Y') as formatted_date
from events;

-- 12.	Display each event's name and its start date formatted as a verbose readable string like "15th January 2024".

select event_name,
date_format(start_datetime, '%d %M %Y') as formatted_date
from events;

-- 13.	Display each event's name and show the event time in 12-hour format with AM or PM.

select event_name,
date_format(start_datetime, '%h : %i %p') as formatted_date
from events;

-- 14.	Display each event's name and the month and year only in the format "January 2024" for the start date.

select event_name,
date_format(start_datetime, '%M %Y') as formatted_date
from events;

-- 15.	Display each event's name and compute the expected date that would be exactly 30 days after the event start date.

select event_name,
date_add(start_datetime, interval 30 day) as added_date
from events;

-- 16.	Display each event's name and compute the date that was 7 days before the registration deadline.

select event_name,
date_sub(registration_deadline, interval 7 day) as subtracted_date
from events;

-- 17.	Display all events that took place in the second quarter of 2024 (April through June) by filtering using the appropriate date part.

select * from events
where year(start_datetime)=2024  and quarter(start_datetime) = 2;

-- 18.	Display all events that started on a Saturday or Sunday by extracting the day of the week.

select * from
events
where dayofweek(start_datetime) in (1,7);

-- 19.	Display events grouped by month of start date, showing the month name and total ticket revenue (price multiplied by registered count) for each month.

select monthname(start_datetime) as months,
sum( ticket_price * registered_count )as Total_ticket_revenue
from events 
group by monthname(start_datetime);

-- 20.	Display events grouped by quarter of start date, showing the quarter number and total number of events in each quarter.

select quarter(start_datetime) as quarters,
count(*) as total_events
from events
group by quarter(start_datetime);


-- 21.	Display each event's name and how many complete months elapsed between the registration deadline and the event start date.

select event_name,
timestampdiff( month, registration_deadline,start_datetime) as diff_in_months
from events;

-- 22.	Display each event's name alongside the last day of the month in which the event takes place.

select event_name,
last_day(start_datetime) as last_dayof_month
from events;

-- 23.	Display each event's name and compute the week number of the year in which the event falls.

select event_name,
week(start_datetime) as weekof_year
from events;

-- 24.	Display each event and compute the number of days remaining until the registration deadline from today (show negative for past deadlines).

select event_name,
datediff(registration_deadline, now() ) as difference
from events;


-- 25.	Display the events where the duration of the event (from start to end) is more than 24 hours.

select * from 
events
where timestampdiff(hour, start_datetime,end_datetime) > 24;

-- 26.	Display events where the event starts in the evening (after 17:00 hours) by filtering on the hour of start_datetime.

select * 
from events
where hour(start_datetime) >= 17;

-- 27.	Display the event name and format the full start datetime as a string in the format "Day-Name, DD Month YYYY at HH:MM" for example "Monday, 15 January 2024 at 09:00".

select event_name,
date_format(start_datetime, '%W, %d %M %Y at %H:%i') as formatted_date
from events;

-- 28.	Display each event's name and convert the registration deadline from the stored date format to the format DD/MM/YYYY, and alongside it parse the string 31-12-2024 back into a date and compute how many days after that parsed date the New Year Gala starts.
SELECT
event_name,
DATE_FORMAT(registration_deadline,'%d/%m/%Y') AS formatted_date,

DATEDIFF(
(   SELECT DATE(start_datetime)
    FROM events
    WHERE event_name = 'New Year Gala'
),  STR_TO_DATE('31-12-2024','%d-%m-%Y')
) AS difference

FROM events;


-- 29.	Display a complete event schedule report showing: event name, category, city, formatted start date (DD Month YYYY), formatted start time (12-hour with AM/PM), 
-- event duration in hours and minutes shown separately, days until or since start from today, and availability status showing whether seats are still available (registered less than max) or sold out.

select event_name,
category,
city,
date_format(start_datetime,'%d %M %Y') as formatted_date,
date_format(start_datetime, '%h:%i %p') as formatted_time,
timestampdiff(hour, start_datetime,end_datetime) as duaration_inhours,
mod( timestampdiff(minute, start_datetime,end_datetime), 60) as duaration_inminute,
timestampdiff(day, start_datetime,now() ) as days_since,
case 
  when registered_count < max_participants then 'Ticket Available'
  else 'Ticket Sold out'
end as Ticket_Status  
from events;


-- 30.	Display quarterly performance summary showing quarter number, total events in that quarter, total revenue generated (price multiplied by registered count), average ticket price, earliest event start date in the quarter formatted as DD-MMM-YYYY, and latest 

select quarter(start_datetime) as quarters,
count(*) as total_events,
sum( ticket_price * registered_count) as total_revenue,
avg(ticket_price) as average_price,
date_format( min(start_datetime) , '%d-%b-%Y') as earliest_date,
date_format( max(end_datetime) , '%d-%b-%Y') as latest_date 
from events 
group by quarter(start_datetime) 
order by quarters;

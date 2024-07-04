create table log_entries(
name varchar(20),
address varchar(20),
email varchar(20),
floor integer,
resources varchar(20)
);

insert into log_entries values
('A', 'Bangalore', 'A@gmail.com', 1, 'CPU'),
('A', 'Bangalore', 'A1@gmail.com', 1, 'CPU'),
('A', 'Bangalore', 'A2@gmail.com', 2, 'Desktop'),
('B', 'Bangalore', 'B@gmail.com', 1, 'CPU'),
('B', 'Bangalore', 'B1@gmail.com', 2, 'Desktop'),
('B', 'Bangalore', 'B2@gmail.com', 2, 'Printer')

select * from log_entries;

with 
cte as (
select name, floor as most_visited_floor from (
select name, floor, count(1) as no_of_visits, 
rank() over(partition by name order by count(1) desc) as floor_rank 
from log_entries
group by name, floor) A where floor_rank = 1),
distinct_resoures as (
select name, STRING_AGG(resources, ', ') as resources from (
select distinct name, resources from log_entries ) A group by name),
total_visits as (
select name, count(1) as total_visits from log_entries group by name
)

select A.name,  A.most_visited_floor, C.total_visits, B.resources from cte A 
join distinct_resoures B on A.name =B.name 
join total_visits C on A.name = C.name;



" finding new and repeat customers .using SQL. In this video we will learn following concepts:
 how to approach complex query step by step"

create table customer_order(
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);

insert into customer_order values(1,100,cast('2022-01-01' as date),2000),
(2,200,cast('2022-01-01' as date),2500),
(3,300,cast('2022-01-01' as date),2100),
(4,100,cast('2022-01-02' as date),2000),
(5,400,cast('2022-01-02' as date),2200),
(6,500,cast('2022-01-02' as date),2700),
(7,100,cast('2022-01-03' as date),3000),
(8,400,cast('2022-01-03' as date),1000),
(9,600,cast('2022-01-03' as date),3000)
;

select * from customer_order;
 
select order_date, 
sum(case when order_date = first_order_date then 1 else 0 end) as new_customer_count,
sum(case when order_date <> first_order_date then 1 else 0 end) as repeat_customer_count,
sum(case when order_date = first_order_date then order_amount else 0 end) as new_customer_order_amount,
sum(case when order_date <> first_order_date then order_amount else 0 end) as repeat_customer_order_amount
from customer_order A 
join (
select customer_id, min(order_date) as first_order_date from customer_order group by customer_id) B 
on A.customer_id = B.customer_id group by order_date order by order_date 





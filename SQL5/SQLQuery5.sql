/*The Pareto principle states that for many outcomes, roughly 80% of consequences come from 20% of causes. eg:
1. 80% of the productivity come from 20% of the employees.
2. 80% of your sales come from 20% of your clients.
3. 80% of decisions in a meeting are made in 20% of the time

4. 80% of your sales comes from 20% of your products or services.
*/

with product_wise_sales as 
(
select product_ID, product_sales,
sum(product_sales) over(order by product_sales desc ROWS BETWEEN UNBOUNDED PRECEDING AND 0 PRECEDING) as running_sales,
0.8 * sum(product_sales) over() as totalsales_80
from (
select product_ID, sum(Sales) as product_sales from superstore_orders group by product_ID) A
)

select product_ID, product_sales, running_sales, totalsales_80 from product_wise_sales where running_sales <= totalsales_80;
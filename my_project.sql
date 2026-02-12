--     SQL Mini Project: my_project 

CREATE DATABASE my_project;

USE my_project;

-- my table name is superstore 

SELECT * FROM superstore
LIMIT 5;
describe superstore;

-- no. of row
select count(*) from superstore;

-- no of columns
select count(*) from
information_schema.columns
where table_name = 'superstore';


-- Q.1.  Which city has high sales but low profit

select * from superstore;

select city, sum(sales) as total_sales ,
sum(profit) as total_profit
from superstore
group by city
order by total_sales desc , total_profit asc
limit 1;


-- Q.2.  Which category sells the most but gives the least profit

select * from superstore;

select city, sum(sales) as total_sales ,
sum(profit) as total_profit
from superstore
group by city
order by total_sales desc , total_profit asc
limit 1;

 -- Q.3.  In each city, which products are causing losses
 
 select distinct city, `product name`  from superstore
 where profit < 0;


-- Q.4. Which category is the riskiest for the business
-- (Risk = high sales but negative profit.)

select category, sum(sales) as total_sales,
sum(profit) as total_profit
from superstore
group by category
order by total_sales desc, total_profit asc
limit 1;

-- Q.5 Which month has the highest sales but relatively low profit
select * from superstore;

alter table  superstore
add column month_year varchar(20);

update superstore
set month_year = DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), '%M %Y');

select month_year,
SUM(Sales) as total_sales,
SUM(Profit) as total_profit 
from superstore
 group by month_year 
 order by total_sales desc, total_profit asc
 limit 1;

-- Q.6 Which cities in the superstore table have total sales greater than 1000

select * from superstore;


select city, sum(sales) as total_sales from superstore
group by city
having sum(sales)>1000;

-- Q.7 Find categories where total profit is negative

select * from superstore;

select category ,sum(sales)as total_sales,
sum(profit) as total_profit 
from superstore
group by category
having sum(profit) < 0 ;


-- Q.8 Find products that have been ordered more than 1 times
select * from superstore;

select `product name` ,count(*) total_order_id
from superstore
group by `product name`
having total_order_id > 1;

-- Q.9 Show regions where average discount is greater than 0.1

select region , avg(discount) as avg_discount
from superstore
group by region
having avg_discount > 0.1;

-- Q.10 Which cities have more than 100 orders but total profit is negative

select * from superstore;

select city ,count(*) as total_order,
sum(profit) as total_profit
from superstore
group by city
having total_order > 5
and total_profit < 0;






















































 
 










 
 
 
 






















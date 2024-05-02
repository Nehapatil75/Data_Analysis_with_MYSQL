-- Day 5 Assignment--
-- 1)	For every year, find the minimum amount value from payments table.

select *from payments;
select year(paymentDate) as Payment_Year , min(amount) as min_amount from payments
group by year(paymentDate)
order by year(paymentDate);

/* 2) 	For every year and every quarter, find the unique customers and total orders from orders table. 
Make sure to show the quarter as Q1,Q2 etc.*/

select * from orders;
select year(orderDate) as order_Year , CONCAT('Q', QUARTER(orderDate)) AS order_quarter,
count(distinct  customerNumber) as unique_Customers , count(orderNumber) as Total_Orders from orders
group by order_Year,order_quarter
order by order_Year,order_quarter;


/* 3) 3)	Show the formatted amount in thousands unit (e.g. 500K, 465K etc.) for every month (e.g. Jan, Feb etc.) with filter on total amount as 500000 to 1000000. 
Sort the output by total amount in descending mode*/



select * from payments;

select date_format(paymentdate,'%b') as 'Month', 
concat(round(sum(Amount)/1000), 'k') as Farmatted_Amount
from payments
Group by month 
having sum(amount) between 500000 and 1000000
order by sum(amount) desc;

    
    
    




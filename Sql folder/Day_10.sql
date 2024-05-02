-- Day 10 Assignment 
/* Create the view products status.
 Show year wise total products sold. Also find the percentage of total value for each year.*/
 
 
create view products_status as
select year(o.orderdate) AS Year ,
CONCAT( count(od.priceEach),
      ' ( ',round((sum(od.priceEach * od.quantityordered) / (select sum(od2.priceEach * od2.quantityordered)
FROM ORDERDETAILS OD2))* 100),'%)') AS VALUE
FROM ORDERS O JOIN ORDERDETAILS OD ON O.ORDERNUMBER = OD.ORDERNUMBER
group by year
order by VALUE ASC;

select * from products_status;

-- DAY 3 ASSIGNMENT -- 
/* 1) 1)	Show customer number, customer name, state and credit limit from customers table for below conditions. 
Sort the results by highest to lowest values of creditLimit.

●	State should not contain null values
●	credit limit should be between 50000 and 100000*/

 --  select *from customers;
select customerNumber,customerName,state,creditLimit from customers
WHERE state IS NOT  NULL  
    AND creditLimit BETWEEN 50000 AND 100000
ORDER BY creditLimit desc;
desc customers;

alter table customers
modify customerNumber int  not null;

alter table customers
 modify customers double default null;
 Desc customers;
 
 
 -- 2)	Show the unique productline values containing the word cars at the end from products table.
 SELECT DISTINCT productLine
FROM products
WHERE productLine LIKE '%cars';
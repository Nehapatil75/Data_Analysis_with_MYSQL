-- Day 7 Assignment 
/* 1)	Show employee number, Sales Person (combination of first and last names of employees), unique customers for each employee number and sort the data by highest to lowest unique customers.
Tables: Employees, Customers  */

use classicmodels;
select * from employees;
select * from customers;


select employeeNumber, concat(firstName,' ',lastName) EmployeeName, count(distinct customername) Unique_Customers from employees
inner join customers on employees.employeeNumber = customers.salesRepemployeeNumber
group by employeeNumber
order by unique_customers desc;


-- 2) 	Show total quantities, total quantities in stock, left over quantities for each product and each customer. Sort the data by customer number.
-- Tables: Customers, Orders, Orderdetails, Products

select * from products;

SELECT
    c.customerNumber,
    c.customerName,
    p.productCode,
    p.productName,
    SUM(od.quantityOrdered) AS OrderedQuantity,
    SUM(p.quantityInStock - od.quantityOrdered) AS Total_Inventory,
    SUM(p.quantityInStock) AS LeftQuantity
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
GROUP BY c.customerNumber, p.productCode
ORDER BY c.customerNumber ;
    

-- 3) 	Create below tables and fields. (You can add the data as per your wish)
/* Laptop: (Laptop_Name), Colours: (Colour_Name)
Perform cross join between the two tables and find number of rows.*/

create table Laptop(Laptop_Name varchar(50) PRIMARY KEY );

create table Colours(Colour_Name varchar(50) PRIMARY KEY  );


insert into Laptop(Laptop_Name) values('DELL'),
                                     ('HP');
             
             DROP TABLE LAPTOP;
             DROP TABLE COLOURS;
SELECT * from laptop;

insert into colours(Colour_name) values ('White'),
                                       ('Black'),
                                        ('Silver');
                                        
SELECT
        ROW_NUMBER() OVER (ORDER BY Laptop.Laptop_Name, Colours.Colour_Name) AS RowNumber,
    Laptop.Laptop_Name, Colours.Colour_Name
FROM Laptop
CROSS JOIN Colours;
    
    
-- 4) 	Create table project with below fields.
/*	EmployeeID,	FullName,	Gender,	ManagerID add this fields.
Find out the names of employees and their related managers.*/

create table Project(EmployeeID int , FullName varchar(50), Gender varchar(250), ManagerID int );

insert into Project  VALUES(1, 'Pranaya', 'Male', 3),
                            (2, 'Priyanka', 'Female', 1),
                             (3, 'Preety', 'Female', NULL),
						     (4, 'Anurag', 'Male', 1),
                             (5, 'Sambit', 'Male', 1),
							(6, 'Rajesh', 'Male', 3),
                            (7, 'Hina', 'Female', 3);
select * from project;

SELECT
    Manager.FullName AS ManagerName,
    Employee.FullName AS EmployeeName
FROM
    Project Employee
LEFT JOIN
    Project Manager ON Employee.ManagerID = Manager.EmployeeID;

    
    









                                     

    





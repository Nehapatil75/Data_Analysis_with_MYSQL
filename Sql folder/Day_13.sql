-- Day 13 Assignment 

-- 1) 	Display the customer numbers and customer names
--  from customers table who have not placed any orders using subquery
SELECT customerNumber,customerName
FROM customers
WHERE customerNumber NOT IN (SELECT customerNumber FROM orders);

-- 2) 	Write a full outer join between customers and orders using union and get the customer number,
-- customer name, count of orders for every customer.

SELECT
    COALESCE(c.customerNumber, o.customerNumber) AS customerNumber,
    COALESCE(c.customerName) AS customerName,
    COUNT(o.orderNumber) AS orderCount
FROM
    customers c
LEFT JOIN
    orders o ON c.customerNumber = o.customerNumber
GROUP BY
    COALESCE(c.customerNumber, o.customerNumber), COALESCE(c.customerName);

-- 3)	Show the second highest quantity ordered value for each order number.
SELECT
    orderNumber,
    quantityOrdered AS secondHighestQuantity
FROM (
    SELECT
        orderNumber,
        quantityOrdered,
        RANK() OVER (PARTITION BY orderNumber ORDER BY quantityOrdered DESC) AS quantityRank
    FROM
        Orderdetails
) AS ranked_data
WHERE
    quantityRank = 2;


-- 4) 	For each order number count the number of products and 
-- then find the min and max of the values among count of orders.


SELECT
    
    MAX(productCount) AS MaxTotal,
	MIN(productCount) AS MinTotal
FROM 
(SELECT orderNumber, COUNT(DISTINCT productCode) AS productCount
    FROM Orderdetails
    GROUP BY orderNumber
    HAVING productCount IS NOT NULL AND productCount > 0) AS counts;
    
    -- 5) 	Find out how many product lines are there for which the buy price value is greater than the average of buy price value. 
    -- Show the output as product line and its count.
    
    SELECT productLine, COUNT(*) AS productLineCount FROM products
WHERE buyPrice > (SELECT AVG(buyPrice) FROM products)
GROUP BY productLine;


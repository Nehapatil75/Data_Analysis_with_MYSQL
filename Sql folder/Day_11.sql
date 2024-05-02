-- DAY 11 Assignment

-- 1)	Create a stored procedure GetCustomerLevel which takes input as customer number and gives the output as either Platinum, Gold or Silver as per below criteria.
/* Table: Customers
Platinum: creditLimit > 100000
Gold: creditLimit is between 25000 to 100000
Silver: creditLimit < 25000 */

DELIMITER //
CREATE PROCEDURE GetCustomerLevel(IN customerNumberParam INT)
BEGIN
    DECLARE customerCreditLimit DECIMAL(10, 2);

    SELECT CreditLimit INTO customerCreditLimit FROM Customers
    WHERE CustomerNumber = customerNumberParam;

    IF customerCreditLimit > 100000 THEN
        SELECT 'Platinum' AS CustomerLevel;
    ELSEIF customerCreditLimit BETWEEN 25000 AND 100000 THEN
        SELECT 'Gold' AS CustomerLevel;
    ELSE 
        SELECT 'Silver' AS CustomerLevel;
    END IF;
END //
DELIMITER ;

CALL GetCustomerLevel(112);
select * from customers;

--  2)	Create a stored procedure Get_country_payments which takes in year and country as inputs and gives year wise, country wise total amount as an output. Format the total amount to nearest thousand unit (K)
-- Tables: Customers, Payments

DELIMITER //

CREATE PROCEDURE Get_country_payments (
    IN input_year INT,
    IN input_country VARCHAR(255)
)
BEGIN
    SELECT 
        YEAR(paymentDate) AS payment_year,
        c.country,
        CONCAT(FORMAT(SUM(amount) / 1000, 0), 'K') AS total_amount
    FROM 
        payments 
    JOIN 
        customers c ON payments.customerNumber = c.customerNumber
    WHERE 
        YEAR(paymentDate) = input_year
        AND c.country = input_country
    GROUP BY 
        payment_year, c.country;
END //

DELIMITER ;


CALL Get_country_payments(2003, 'France');


select * from customers;


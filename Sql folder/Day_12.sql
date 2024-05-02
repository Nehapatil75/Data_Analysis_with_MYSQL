-- Day 12 Assignments 
-- 1)	Calculate year wise, month name wise count of orders and year over year (YoY) percentage change. 
-- Format the YoY values in no decimals and show in % sign.

SELECT
    order_year,
    month_name,
    order_count,
    CONCAT(FORMAT(
        (order_count - LAG(order_count) OVER (PARTITION BY order_year ORDER BY month_num)) /
        LAG(order_count) OVER (PARTITION BY order_year ORDER BY month_num) * 100
        , 0), '%') AS yoy_percentage_change
FROM (
    SELECT
        EXTRACT(YEAR FROM orderdate) AS order_year,
        DATE_FORMAT(orderdate, '%b') AS month_name,
        EXTRACT(MONTH FROM orderdate) AS month_num,
        COUNT(*) AS order_count
    FROM
        Orders
    GROUP BY
        order_year, month_name, month_num
) AS subquery
ORDER BY
    order_year, month_num;

 -- 2) 	Create the table emp_udf with below fields.
-- Emp_ID , Name, DOB 
-- Create a user defined function calculate_age which returns the age in years and months
-- (e.g. 30 years 5 months) by accepting DOB column as a parameter

 CREATE TABLE emp_udf (
    Emp_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    DOB DATE
);

INSERT INTO emp_udf (Name, DOB)
VALUES 
    ("Piyush", "1990-03-30"),
    ("Aman", "1992-08-15"),
    ("Meena", "1998-07-28"),
    ("Ketan", "2000-11-21"),
    ("Sanjay", "1995-05-21");

-- Create calculate_age function


DELIMITER //

CREATE FUNCTION calculate_age(dob_param DATE)
RETURNS VARCHAR(255)
deterministic
BEGIN
    DECLARE years INT;
    DECLARE months INT;
    DECLARE age_str VARCHAR(255);

    SET years = TIMESTAMPDIFF(YEAR, dob_param, CURDATE());
    SET months = TIMESTAMPDIFF(MONTH, dob_param, CURDATE()) - years * 12;

    SET age_str = CONCAT(years, ' years ', ABS(months), ' months');

    RETURN age_str;
END //

DELIMITER ;

SELECT Emp_ID,Name, DOB,calculate_age(DOB) AS Age FROM emp_udf;

 








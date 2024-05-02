/* Create the table Emp_BIT. Add below fields in it.
Name, Occupation, Working_date, Working_hours
Create before insert trigger to make sure any new value of Working_hours, if it is negative, 
then it should be inserted as positive.*/

create table Emp_BIT(Name varchar(255),Occupation varchar(255) , Working_date date  , Working_hours int);

-- Create BEFORE INSERT trigger
DELIMITER //

CREATE TRIGGER BeforeInsertEmp_BIT
BEFORE INSERT ON Emp_BIT
FOR EACH ROW
BEGIN
    -- Ensure that Working_hours is inserted as positive
    IF NEW.Working_hours < 0 THEN
        SET NEW.Working_hours = ABS(NEW.Working_hours);
    END IF;
END //
DELIMITER ;

-- Insert data into Emp_BIT table
INSERT INTO Emp_BIT VALUES
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);

select * from Emp_BIT;

 

-- Day 14 assignment 
/* Create the table Emp_EH. Below are its fields.
	EmpID (Primary Key), EmpName ,EmailAddress
Create a procedure to accept the values for the columns in Emp_EH. 
Handle the error using exception handling concept. Show the message as “Error occurred” in case of anything wrong */ 

create table Emp_EH (EmpID int primary key ,EmpName varchar(250), EmailAddress varchar(250));

-- Create procedure for inserting values with exception handling
DELIMITER //

CREATE PROCEDURE InsertIntoEmp_EH(
    IN p_EmpID INT,
    IN p_EmpName VARCHAR(255),
    IN p_EmailAddress VARCHAR(255)
)
BEGIN
    DECLARE continueHandler INT DEFAULT 1;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET continueHandler = 0;
    END;

    START TRANSACTION;

    -- Insert data into Emp_EH table
    INSERT INTO Emp_EH (EmpID, EmpName, EmailAddress)
    VALUES (p_EmpID, p_EmpName, p_EmailAddress);

    -- Commit the transaction if no exception occurred
    IF continueHandler THEN
        COMMIT;
        SELECT 'Data inserted successfully' AS Message;
    ELSE
	   SELECT 'Error occurred' AS Message;
END IF;
END //
DELIMITER ;

-- Call the stored procedure
CALL InsertIntoEmp_EH(1, 'John Doe', 'john.doe@example.com');

select * from emp_eh;



-- Day 9 Assignment 

-- 1) Create table university with below fields.
	/* ID  , Name
Add the below data into it as it is.
Remove the spaces from everywhere and update the column like Pune University etc.*/

create table university(ID int , Name varchar(50));
insert into university values (1, "       Pune          University     "), 
               (2, "  Mumbai          University     "),
              (3, "     Delhi   University     "),
              (4, "Madras University"),
              (5, "Nagpur University");
			
UPDATE University
SET Name = CONCAT_WS(' ', TRIM(BOTH ' ' FROM SUBSTRING_INDEX(Name, ' ', 1)));

SELECT * FROM University;






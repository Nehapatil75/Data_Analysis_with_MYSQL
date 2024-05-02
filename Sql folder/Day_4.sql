-- DAY 4 ASSIGNMENT--
/*  1)	Show the orderNumber, status and comments from orders table for shipped status only. 
If some comments are having null values then show them as “-“.*/

select orderNumber,status,COALESCE(comments, '-') AS comments from orders
where status ="shipped";


/*2)	Select employee number, first name, job title and job title abbreviation from employees table based on following conditions.
If job title is one among the below conditions, then job title abbreviation column should show below forms.
●	President then “P”
●	Sales Manager / Sale Manager then “SM”
●	Sales Rep then “SR”
●	Containing VP word then “VP” */
 
select * from employees;

alter table employees
add column jobTitle_abbr varchar(50);

select employeeNumber, firstName, jobTitle,jobTitle_abbr   from employees;
select
    employeeNumber,firstName,jobtitle,
    CASE 
        WHEN UPPER(jobtitle) = 'PRESIDENT' THEN 'P'
        WHEN UPPER(jobtitle) LIKE '%SALES MANAGER%' THEN 'SM'
		WHEN UPPER(jobtitle) LIKE '%SALE MANAGER%' THEN 'SM'
        WHEN UPPER(jobtitle) = 'SALES REP' THEN 'SR'
        WHEN UPPER(jobtitle) LIKE '%VP%' THEN 'VP'
        ELSE 'Unknown'
    END AS job_title_abbreviation
FROM employees
order by job_title_abbreviation;




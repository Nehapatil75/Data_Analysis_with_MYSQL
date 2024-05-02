-- Day 6 -- Assignment 

/* 1)	Create a journey table with following fields and constraints.
●   Bus_ID (No null values)
●	Bus_Name (No null values)
●	Source_Station (No null values)
●	Destination (No null values)
●	Email (must not contain any duplicates) */

create table journey(Bus_ID int primary key not null,
					Bus_Name varchar(250) not null,
                    Source_Station varchar(250) not null,
                    Destination varchar(250) not null,
                    Email varchar(250) unique not null);
desc journey;


/* 2)	Create vendor table with following fields and constraints.

●	Vendor_ID (Should not contain any duplicates and should not be null)
●	Name (No null values)
●	Email (must not contain any duplicates)
●	Country (If no data is available then it should be shown as “N/A”)*/

create table vendor(Vendor_ID int unique  not null,
              Name varchar(250) not null,
              Email varchar(250) unique,
              Country varchar(250) default"N/A");
desc vendor;
              

/* 3)	Create movies table with following fields and constraints.

●	Movie_ID (Should not contain any duplicates and should not be null)
●	Name (No null values)
●	Release_Year (If no data is available then it should be shown as “-”)
●	Cast (No null values)
●	Gender (Either Male/Female)
●	No_of_shows (Must be a positive number) */

create table movies(Movie_ID int unique not null,
                   Name varchar(250) not null,
                   Release_year int default null,
                   Cast varchar(250) not null,
				   Gender ENUM('Male', 'Female') , 
                   No_of_shows int check (No_of_shows>0));
                   
desc movies;

/* 4) 	Create the following tables. Use auto increment wherever applicable

a. Product
	product_id - primary key
	product_name - cannot be null and only unique values are allowed
	description
	supplier_id - foreign key of supplier table
b. Suppliers
	supplier_id - primary key
	supplier_name
	location
c. Stock
	id - primary key
	product_id - foreign key of product table
	balance_stock                  */
    
create table Product ( product_id int primary key ,
                       product_name varchar(250) unique not null,
                       description varchar(250),
                       supplier_id int ,
                       foreign key (supplier_id) references Suppliers(supplier_id));
desc Product;
                       

create table Suppliers(supplier_id int primary key,
                       supplier_name varchar(250),
                       location varchar(250));
desc Suppliers;
                       
create table Stock (id int primary key ,
                   product_id int ,
                   foreign key (product_id) references Product(product_id),
                   balance_stock int );
desc stock;


                   
                   


                    

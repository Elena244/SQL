# Database Project for **Employees Management**
The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice.

**Application under test**: Employees Management

**Tools used**: MySQL Workbench
 
**Database description**: Employees Management database is a  digital record of current employees.This include contact information, job titles, payroll data, and other information related to employment. The database can be used to track employee performance, identify potential training needs, and manage other human resources functions.

**Database Schema**

You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them.
The tables are connected in the following way:

![diagrama](https://github.com/user-attachments/assets/2e59aee5-b66f-44fe-bba2-cda04fa470e7)

Below you can find the description of the relationships that were define for the database:

- **table Departments** is connected with **table Employees** through a **one-to-many** relationship which was implemented through **departments_table.department_id** as a primary key and **employees_table.departemnt_id** as a foreign key
- **table Projects** is connected with **table Details** through a **one-to-one** relationship which was implemented through **projects_table.project_id** as a primary key and **details_table.Employee_id** as a foreign key
- **table Location** is connected with **table Employess** through a **one-to-many** relationship which was implemented through **location_table_location_id** as a primary key and **location_table.employee_id** as a foreign key

## Database Queries

### DDL (Data Definition Language)
The following instructions were written in the scope of CREATING the structure of the database (CREATE INSTRUCTIONS)

```
create database Employees
```
```
create table Departments
```
```
create table Employees
```
```
create table Projects
```
```
create table Details
```
```
create table Location
```

After the database and the tables have been created, a few ALTER instructions were written in order to update the structure of the database, as described below:
```
alter table Projects modify column Manager_name varchar(60);
```
```
alter table Departments modify column Location varchar(60);
```
```
alter table Details;
```
```
alter table Employees add Manager_name varchar(50);
```
```
alter table Details rename column Department_id to Department_name;
```


### DML (Data Manipulation Language)
In order to be able to use the database I populated the tables with various data necessary in order to perform queries and manipulate the data. In the testing process, this necessary data is identified in the Test Design phase and created in the Test Implementation phase.

Below you can find all the insert instructions that were created in the scope of this project:
```
insert into Departments (Department_id, Department_name ,Location) values (124, 'Human resources', 'Bucharest');
```
```
insert into Departments (Department_id, Department_name ,Location) values (125, 'PR', 'Cluj' );
```
```
insert into Departments (Department_id, Department_name ,Location) values (145, 'Contability', 'Bucharest');
```
```
insert into Departments (Department_id, Department_name ,Location) values (131, 'Assistant Manager', 'Bucharest');
```
```
insert into Employees (Employee_id,First_name,Last_name, Address,Hourly_pay, Email, Age,Department_id) 
values (1,'Radulescu' , 'Andrei', 'str.Garii,Bucuresti' , 10.2,'radulescu.andrei@gmail.com', 34,124);
```
```
insert into Employees (Employee_id,First_name,Last_name, Address,Hourly_pay,Email, Age, Department_id) 
values (2,'Ion' , 'Mihai', 'str.Apusului,Bucuresti', 14.2,'ion.mihai@gmail.com', 35,125);
```
```
insert into Employees (Employee_id,First_name,Last_name, Address,Hourly_pay,Email, Age,Department_id) 
values (3,'Mircea' , 'Claudia', 'str.Dealul Babei,Bucuresti' ,17.5,'mircea.claudia@gmail.com', 25,145);
```
```
insert into Employees (Employee_id,First_name,Last_name, Address,Hourly_pay,Email, Age,Department_id) 
values (4,'Dinu' , 'Iulia', 'str.Unirii,Bucuresti' ,23.5, 'dinu.iulia@gmail.com',  36,131);
```
```
insert into Projects (Project_id, Project_name, Manager_name, Department_id) values (1,'ProjectD', 'Stoica Andrei',124);
```
```
insert into Projects (Project_id, Project_name, Manager_name,Department_id) values (2,'ProjectB', 'Mircea Claudiu',125);
```
```
insert into Projects (Project_id, Project_name, Manager_name,Department_id) values (3,'ProjectD', 'Stoica Andrei',145);
```
```
insert into Projects (Project_id, Project_name, Manager_name,Department_id) values (4,'ProjectD', 'Stoica Andrei',131);
```
```
insert into Details (Salary,Department_id, Employee_id) values
(234,124,1);
(435,125,2);
(567,145,3);
(457,131,4);
```
```
insert into Location (Location_id,City, Employee_id) values
(145,'Bucharest',1);
(234,'Cluj',2);
(146,'Bucharest',3);
(148,'Bucharest',4);
```

After the insert, in order to prepare the data to be better suited for the testing process, I updated some data in the following way:
```
update Employees set Email = 'radulescu.andrei2@gmail.com' where Department_id = 124 ;
```
```
update Projects set Project_name = 'ProjectBD' where Department_id = 125 ;
```
```
update Employees set hourly_pay = '15' where Employee_id = 1;
```

### DQL (Data Query Language)
After the testing process, I deleted the data that was no longer relevant in order to preserve the database clean:
```
DELETE FROM Employees WHERE Department_id = 131;
```

In order to simulate various scenarios that might happen in real life I created the following queries that would cover multiple potential real-life situations:
```
select* from Employees where Hourly_pay >= '17';
```
```
select* from employees where First_name like 'Ion' and Hourly_pay = 14.2or Age = 35 ;
```
```
select Location from Departments where Location  != 'Bucharest';
```
```
select * from Projects where Manager_name like '%Claudiu';
```
```
select max(Salary) from Details;
```
```
select First_name , Last_name,count(*) from Employees  where First_name= 'Ion' and Last_name = 'Mihai' ;
```
```
select Hourly_pay , avg(Hourly_pay) from Employees group by Hourly_pay;
```
```
select location, count(*) from Departments group by location;
```
```
select location, count(*) from Departments  group by location order by count(*) asc;
```
```
select count(*) as 'Employee_id' from employees where Age >=35;
```
```
select location, count(*) from Departments  group by location having count(*) >1 order by count(*) asc;
```
```
select Project_ID, Department_id, count(*)from Projects where Project_ID like '2' group by Project_ID,Department_id order by count(*) asc;
```
```
select Project_ID, Department_id, count(*) from Projects where Project_ID like '4' group by Project_ID,Department_id having count(*) <4 order by count(*) asc;
```
```
select* from Departments inner join Employees on Departments.Department_id=Employees.Department_id;
```
```
select* from Departments left join Employees on Departments.Department_id=Employees.Department_id;
```
```
select* from Departments right join Employees on Departments.Department_id=Employees.Department_id;
```
```
select* from Departments inner join Projects on Departments.Department_id=Projects.Department_id;
```
```
select Employee_id from Employees e inner join departments d  on e.department_id = d.department_id;
```
```
select department_name from departments inner join Employees on departments.department_id=Employees.department_id;
```
```
select count(*) as 'Location_id' from Location   where Employee_id =2 and City ='Cluj';
```
```
select p.project_id, p.Manager_name, e.address,e.age from project as p join Employees as E on p.project_id =e.project;
```
```
select e.employee_id , e.first_name, d.employee_id, d.salary from Employees as e join Details as D  on e.employee_id=d.employee_id;
```

## Conclusions
Employees Management database is essential tool for maintaining data integrity and optimizing database performance. Understanding their types, implementation, and best practices is crucial for database professionals. As SQL Server continues to evolve, staying updated with the latest developments in constraint management will be key to effective database design and management. By tracking employee performance, an organization can identify high-performing employees and identify areas in which employees need improvement. By tracking employee training and development, an organization can ensure that employees are receiving the necessary training to meet the organization’s standards. By managing employee files, an organization can keep all employee information in one centralized location.

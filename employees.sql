create database Employees ;
use Employees  ;
create table Departments (
Department_id int primary key,
Department_name varchar(30),
Location varchar(50)
);

insert into Departments (Department_id, Department_name ,Location) values (124, 'Human resources', 'Bucharest');
insert into Departments (Department_id, Department_name ,Location) values (125, 'PR', 'Cluj' );
insert into Departments (Department_id, Department_name ,Location) values (145, 'Contability', 'Bucharest');
insert into Departments (Department_id, Department_name ,Location) values (131, 'Assistant Manager', 'Bucharest');

Delete table Departments;

create table Employees (
Employee_id int primary key,
First_name varchar(20) NOT NULL,
Last_name varchar (20) ,
 Address varchar (50) NOT NULL,
 Hourly_pay decimal (12,2),
 Email varchar (30),
 Age int NOT NULL,
 Department_id int ,
 constraint foreign key (Department_id) references Departments (Department_id));

insert into Employees (Employee_id,First_name,Last_name, Address,Hourly_pay, Email, Age,Department_id) 
values (1,'Radulescu' , 'Andrei', 'str.Garii,Bucuresti' , 10.2,'radulescu.andrei@gmail.com', 34,124);

insert into Employees (Employee_id,First_name,Last_name, Address,Hourly_pay,Email, Age, Department_id) 
values (2,'Ion' , 'Mihai', 'str.Apusului,Bucuresti', 14.2,'ion.mihai@gmail.com', 35,125);

insert into Employees (Employee_id,First_name,Last_name, Address,Hourly_pay,Email, Age,Department_id) 
values (3,'Mircea' , 'Claudia', 'str.Dealul Babei,Bucuresti' ,17.5,'mircea.claudia@gmail.com', 25,145);

insert into Employees (Employee_id,First_name,Last_name, Address,Hourly_pay,Email, Age,Department_id) 
values (4,'Dinu' , 'Iulia', 'str.Unirii,Bucuresti' ,23.5, 'dinu.iulia@gmail.com',  36,131);
 
create table Projects (
Project_ID INT primary key,
Project_name varchar(20) NOT NULL,
 Manager_name varchar (50) NOT NULL,
 Department_id int ,
 constraint foreign key (Department_id) references Departments (Department_id)
);
insert into Projects (Project_id, Project_name, Manager_name, Department_id) values (1,'ProjectD', 'Stoica Andrei',124);
insert into Projects (Project_id, Project_name, Manager_name,Department_id) values (2,'ProjectB', 'Mircea Claudiu',125);
insert into Projects (Project_id, Project_name, Manager_name,Department_id) values (3,'ProjectD', 'Stoica Andrei',145);
insert into Projects (Project_id, Project_name, Manager_name,Department_id) values (4,'ProjectD', 'Stoica Andrei',131);

alter table Projects modify column Manager_name varchar(60);
select* from Projects;

create table Details (
Salary int ,
Department_id int,
Employee_id int,
constraint foreign key (Employee_id) references Employees (Employee_id)
);
insert into Details (Salary,Department_id, Employee_id) values (234,124,1);
insert into Details (Salary,Department_id, Employee_id) values (435,125,2);
insert into Details (Salary,Department_id, Employee_id) values (567,145,3);
insert into Details(Salary,Department_id, Employee_id) values (457,131,4);

select Salary , Department_id from Details;

create table Location(
Location_id int primary key,
City varchar (50),
Employee_id int, 
constraint foreign key (Employee_id) references Employees (Employee_id)
);
insert into Location (Location_id,City, Employee_id) values (145,'Bucharest',1);
insert into Location (Location_id,City, Employee_id) values (234,'Cluj',2);
insert into Location (Location_id,City, Employee_id) values (146,'Bucharest',3);
insert into Location(Location_id,City, Employee_id) values (148,'Bucharest',4);

select Location_id, count(*)
from Location
where Location_id like '14%'
group by Location_id
order by count(*) asc;

select count(*) as 'Location_id'
from Location 
where Employee_id =2
and City ='Cluj';

select * from Location
where City like 'Bucharest';

update Employees set hourly_pay = '15'
where Employee_id = 1;

select max(Salary) from Details;

select min(Salary) from Details;

select* from Details
where Salary >= '543';

select* from employees
where First_name like 'Ion'
and Hourly_pay = 14.2
or Age = 35 ;

update Employees set Email = 'radulescu.andrei2@gmail.com'
where Department_id = 124 ;

update Projects set Project_name = 'ProjectBD'
where Department_id = 125 ;

select * from departments
where Department_name = 'PR';

select count(*) from employees;

select* from Departments
where Department_id like '12_';

select* from Employees
where Hourly_pay >= '17';

select* from Projects
order by Manager_name desc;

select* from Employees
limit 3;

 select max(Hourly_pay) from Employees;
 select min(Hourly_pay) from Employees;
 select avg(Hourly_pay) from Employees;
 
SELECT e.* FROM Employees e
where e.hourly_pay not in (10.20, 14,20);

SELECT p.* FROM Projects p
where p.Manager_name not in ('Mircea', 'Claudiu');

select Hourly_pay
from Employees
where Hourly_pay < 90;

select count(*) as 'Employee_id'
from employees
where Age >=35;

select Location 
from Departments
where Location  != 'Bucharest';

select * from Projects
where Manager_name like '%Claudiu';

select First_name , Last_name,count(*)
 from Employees 
where First_name= 'Ion'
and Last_name = 'Mihai' ; 

select Hourly_pay , avg(Hourly_pay)
from Employees
group by Hourly_pay;

select Hourly_pay , avg(Hourly_pay)
from Employees
group by Hourly_pay
having avg(Hourly_pay) <=15; 

select location, count(*)
from Departments 
group by location;

select location, count(*)
from Departments 
group by location
order by count(*) asc;

select location, count(*)
from Departments 
group by location,Department_name
order by count(*) asc;

select location, count(*)
from Departments 
group by location
having count(*) >1
order by count(*) asc;

select Department_id, count(*)
from Employees
where Department_id like '12%'
group by Department_id
order by count(*) asc;

select Project_ID, Department_id, count(*)
from Projects
where Project_ID like '2'
group by Project_ID,Department_id
order by count(*) asc;


select Project_ID, Department_id, count(*)
from Projects
where Project_ID like '4'
group by Project_ID,Department_id
having count(*) <4
order by count(*) asc;

select* from Departments
inner join Employees
on Departments.Department_id=Employees.Department_id;

select* from Departments
left join Employees
on Departments.Department_id=Employees.Department_id;

select* from Departments
right join Employees
on Departments.Department_id=Employees.Department_id;

select* from Departments
inner join Projects
on Departments.Department_id=Projects.Department_id;

select Employee_id
from Employees e
inner join departments d 
on e.department_id = d.department_id;

select department_name
from departments
inner join Employees on departments.department_id=Employees.department_id;

select e.employee_id,
e.first_name,
e.age
from Employees as e;



create database Table_Employees ;
use Table_Employees  ;
create table Employees (
ID INT PRIMARY KEY AUTO_INCREMENT,
First_name varchar(20) NOT NULL,
Last_name varchar (20) ,
 Address varchar (50) NOT NULL,
 Hourly_pay decimal (12,2),
 Email varchar (30),
 Age int NOT NULL
);
insert into Employees (First_name,Last_name, Address,Hourly_pay, Email, Age) 
values ('Radulescu' , 'Andrei', 'str.Garii,Bucuresti' , 10.2,'radulescu.andrei@gmail.com', 34);

insert into Employees (First_name,Last_name, Address,Hourly_pay,Email, Age) 
values ('Ion' , 'Mihai', 'str.Apusului,Bucuresti', 14.2,'ion.mihai@gmail.com', 35);

insert into Employees (First_name,Last_name, Address,Hourly_pay,Email, Age) 
values ('Mircea' , 'Claudia', 'str.Dealul Babei,Bucuresti' ,17.5,'mircea.claudia@gmail.com', 25);

insert into Employees (First_name,Last_name, Address,Hourly_pay,Email, Age) 
values ('Dinu' , 'Iulia', 'str.Unirii,Bucuresti' ,23.5, 'dinu.iulia@gmail.com',  36);


create table Projects (
Project_ID INT,
Project_name varchar(20) NOT NULL,
 Manager_name varchar (50) NOT NULL,
 Employees_id int ,
 foreign key (Employees_id) references Employees(id)
);
insert into Projects (Project_id, Project_name, Manager_name,Employees_id) values (1,'ProjectD', 'Stoica Andrei',1);
insert into Projects (Project_id, Project_name, Manager_name,Employees_id) values (2,'ProjectB', 'Mircea Claudiu',2);
insert into Projects (Project_id, Project_name, Manager_name,Employees_id) values (3,'ProjectD', 'Stoica Andrei',3);
insert into Projects (Project_id, Project_name, Manager_name,Employees_id) values (4,'ProjectD', 'Stoica Andrei',4);

create table Departments (
Department_id int,
Department_name varchar(30),
Location varchar(50),
Employees_id int not null ,
foreign key (Employees_id) references Employees(id)
);

insert into Departments (Department_id, Department_name ,Location,Employees_id) values (124, 'Human resources', 'Bucharest', 1);
insert into Departments (Department_id, Department_name ,Location,Employees_id) values (125, 'PR', 'Cluj', 2);
insert into Departments (Department_id, Department_name ,Location,Employees_id) values (145, 'Contability', 'Bucharest', 3);
insert into Departments (Department_id, Department_name ,Location,Employees_id) values (131, 'Assistant Manager', 'Bucharest', 4);

update Departments set Employees_id = 1
where Location like 'Bucharest' ;
select * from employees;

#filtare dupa departament in care apare denumirea de PR
select * from departments
where Department_name = 'PR';

#afisare departamente ce au cod id partial cunoscut 12_ 
select* from Departments
where Department_id like '12_';

#afisare rinregistrari unde Hourly_pay este > 17 
select* from Employees
where Hourly_pay >= '17';

#sortare alfabetica sort by Manager_name
select* from Projects
order by Manager_name desc;

#limitare de inregistari id
select* from Employees
limit 3;

#afisare maxim houly_pay pentru toate 
 select max(Hourly_pay) from Employees;
 select min(Hourly_pay) from Employees;
 select avg(Hourly_pay) from Employees;
 
select* from Empoyees
inner join ID
on Employees.id = Departments.department_id;








--Creation of a database
Create database dbname
go
Create database XyzCo
go

--To use a particular DB
use XyzCo
go
--------------------------------------
--SQL Commands

--Creation of a new table
--Create table syntax
Create table TableName
(
   ColName datatype primary key identity (seed,incr),
   ColName datatype null,
   ColName datatype not null,
   ColName datatype null default (value),
   ColName datatype not null check (expression),
   ColName datatype foreign key refrences PKTableName(PKColName),
)
go
--Creation of a table
create table Dept
(
  DeptID int primary key,
  DeptName varchar (200),
)
go
--selecting of a particular table to execute 
select*from Dept

--inserting data into a table 

insert into tablename values(v1,v2,...)

insert into Dept values(10, 'Sales')
insert into Dept values(20, 'Purchase')
insert into Dept values(30, 'Technical')
insert into Dept values(40, 'Accounts')
insert into Dept values(50, 'Product'), (60, 'Security'), (70, 'Audit')

--inserting multiple comands \\shown above

--To get help for the details of table name

sp_help tablename
go

sp_help Dept
go

--deleting complete table

delete from dept
go

--deleting a single row in a table
delete from Dept where DeptID = 50
go

--deleting a single row in a table using deptname
delete from Dept where DeptName =  'product'
go

--Update/Modify of a table name

update Dept
Set DeptName = 'Auditing'
where DeptID = 70

--Insert a row in a trable

begin Tran
insert into dept values (80,'asdf')
update Dept set DeptName = 'clone' where DeptID = 60

rollback / Commit

--To find the schema of a DB
sp_helpdb 'School'
go

-- Delete all rows
begin Tran
delete from Dept

rollback / commit


--Create EMP table
--Syntax
create table Emp
(
	eid			int				primary key,
	EmpName		varchar(200)	not null,
	Salary		money			not null check(Salary > 0),
	Gender		char(1)			not null check(Gender = 'M' or Gender = 'F'),
	DoB			datetime		not null,
	PhoneNo		char(10)		null unique,
	EmailID		char(100)		null unique,
	Passport	char(20)		not null unique,
	DeptID		INT				null foreign key references Dept(DeptID),
)
go

--Find Schema/ Meta Data
sp_help Emp
go
select*from Emp
select*from Dept

--insert

insert into emp values (1, 'Monkey.D.Luffy' ,	11000, 'M', '1996/11/09' , '9460330649' , 'monkeydluffy@yahoo.co.in' , 'A16487' , 10)
insert into emp values (2, 'Monkey.D.Garp' ,	12000, 'M', '1976/12/13' , '9142042569' , 'monkeydgarp@yahoo.co.in' , 'A14689' , 40)
insert into emp values (3, 'Portugas.D.Ace' ,   15000, 'M', '1995/01/09' , '9601342572' , 'ace143@yahoo.co.in' , 'B15764' , 50)
insert into emp values (4, 'Gol.D.Roger' ,		13000, 'M', '1956/07/08' , '8469779648' , 'roger@yahoo.co.in' , 'B14487' , 10)
insert into emp values (5, 'Roronova Zoro' ,	20000, 'M', '1996/07/08' , '8123481234' , 'zoro143@yahoo.co.in' , 'B14578' , 60)
insert into emp values (6, 'Nami' ,				19000, 'F', '1996/04/08' , '8469544648' , 'catbugler@yahoo.co.in' , 'B14087' , 70)
insert into emp values (7, 'Nico Robin' ,		14000, 'F', '1986/05/08' , '8469889648' , 'robin@yahoo.co.in' , 'B14784' ,30)
insert into emp values (8, 'God.D.Usoppu' ,		16000, 'M', '1996/08/08' , '6469776549' , 'usoppu@yahoo.co.in' , 'B14094' , 30)
insert into emp values (9, 'Iron Franky' ,		18000, 'M', '1968/05/09' , '6469779648' , 'franky@yahoo.co.in' , 'C14845' , 50)
insert into emp values (10, 'Chopper' ,			14000, 'M', '1998/12/08' , '824659478' , 'chopper@yahoo.co.in' , 'C14085' , 50)
insert into emp values (11, 'Brook' ,			17000, 'M', '1986/06/08' , '8143659874' , 'brook@yahoo.co.in' , 'C14486' , 70)



delete from Emp
go

begin Tran
delete from Emp where eid =  '11'
go


-------------------------------------------------------------
--identity,Delete & Truncate

use XyzCo
go

--create table Product

create table Product
(
	PID			int primary key		identity(1,1),
	ProdName	varchar(100)	not null,
	Qty			int			null	default(0),
	UnitPrice	money		not null,
)
go


sp_help 'Product'
go

--Read the table 
select * from Product
go

--Drop the table 
drop table Product
go

----inserting data

insert into Product values ('Pen', 2000, 20)
insert into Product values ('Pencil', 3000, 5)
insert into Product values ('Ereaser', 1000, 5)
insert into Product values ('Scale', 2000, 10)
insert into Product values ('Sharpner', 1500, 6)
insert into Product values ('Lux', 5000, 20)
insert into Product values ('Chintol', 8000, 48)
insert into Product values ('Chocolates', 10000, 25)
insert into Product values ('Perfumes', null, 1250)
insert into Product values ('Room Freshner', '', 25)


--Wrong Entry
insert into Product values ('Laptops', 25000)

--Explicit Insert 
insert into Product (ProdName, UnitPrice) values ('Laptop', 25000)
insert into Product (Qty, ProdName, UnitPrice, Rating) values (4000, 'Apple Iphone 14 Pro max', 1, 3)

--- For Manual insertion of Data

SET IDENTITY_INSERT Product OFF

insert into Product (PID, ProdName, Qty, UnitPrice) values (9, 'Milky Bar', 200, 10)

---Delete all rows
delete from Product 
go

-- Last inserted Identity valur
select @@IDENTITY

---Truncate the data Syntax

Truncate table Product
go

---Alter a table
alter table tablename
add colname datatype
go

alter table Product
add  Rating tinyint
go

---Drop from the table
alter table Product
drop column Rating
go

alter table Product
drop column Qty
go

---Update the data
update Product
set Rating = 4
where PID = 10

---Drop a Constraint
ALTER TABLE Product 
DROP CONSTRAINT DF__Product__Qty__5CD6CB2B
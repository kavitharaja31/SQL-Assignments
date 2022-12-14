create database SQLassignment;

create table OrderItem10
(
id int not null primary key,
OrderId int,
ProductId int,
UnitPrice decimal(12,2),
Quantity int 
)

create table Product10
(
id int not null primary key,
ProductName nvarchar(50),
UnitPrice decimal(12,2),
Package nvarchar(30),
CategoryName nvarchar(30),
Supply nvarchar(30),
IsDiscontinued bit
)

create table Orders10
(
Id int NOT NULL Primary key,
OrderDate datetime NOT NULL,
OrderNumber nvarchar(10),
ShipName nvarchar(50),
CustomerId int,
Phone nvarchar(30),
TotalAmount decimal(12,2),
ShippingCompany nvarchar(50)
 )

Create table Customer10 
(
Id int NOT NULL Primary key,
FirstName varchar(40) NOT NULL,
LastName varchar(40),
City varchar(40),
Country varchar(40),
Ordered varchar(40),
Phone varchar(40),
FaxNumber varchar(40),
orderid varchar(40)
 )

Create table Employees
(
Manager varchar(40),
EmpName varchar(40),
DeptName varchar(40),
Rating varchar(40),
Joindate varchar(40),
CompanyName varchar(50)
)

Create table Products1
(
ProductName varchar(40),
unitonorder varchar(40),
unitinstock varchar(40),
isdiscontinued bit,
category varchar(40),
suppliers varchar(30),
stock varchar(40)
)

alter table OrderItem10 add constraint orderitem10_orderid_FK1
foreign key (OrderId) references Orders10(Id)

alter table OrderItem10 add constraint orderitem10_productid_FK2
foreign key (ProductId) references Product10(Id)

alter table Orders10 add constraint orders10_customerid_FK
foreign key (CustomerId) references Customer10(Id)

insert into OrderItem10 (Id,Orderid,ProductId,UnitPrice,Quantity ) values (123,101,4567,5000,4);

insert into OrderItem10 (Id,Orderid,ProductId,UnitPrice,Quantity ) values (124,102,4568,17500,2);

insert into OrderItem10 (Id,Orderid,ProductId,UnitPrice,Quantity ) values (125,103,4561,5000,3);

insert into Product10 (Id,ProductName,UnitPrice,Package,IsDiscontinued,Supply) values(4567,'Exotic',500,'Ship',0,'Exotic Liquids')

insert into Product10(Id,ProductName,UnitPrice,Package,IsDiscontinued,Supply) values(4568,'Tv',17500,'Ship',1,'Samsung')

insert into Product10 (Id,ProductName,UnitPrice,Package,IsDiscontinued,Supply) values(4569,'Table',5000,'Ship',NULL,'Laptop Table')

insert into Orders10 (Id,OrderDate,OrderNumber,ShipName,CustomerId,TotalAmount) values (10,'14-03-2010',78901,'LA CORNE D ABONDANCE',1,20000);

insert into Orders10 (Id,OrderDate,OrderNumber,ShipName,CustomerId,TotalAmount ) values (11,'12-03-2011',78902,'LA CORNE D ABONDANCE',2,30000);

insert into Orders10 (Id,OrderDate,OrderNumber,ShipName,CustomerId,TotalAmount ) values (12,'1-02-2013',78903,'LA CORNE D ABONDANCE',3,5000);

insert into Customer10 (Id,FirstName,LastName,City,Country,Phone,FaxNumber ) values (1,'Swathi','Yashwanth','Coimbatore','INDIA',9087654312,2345678901);

insert into Customer10 (Id,FirstName,LastName,City,Country,Phone,FaxNumber ) values (2,'Nikitha','Nalin','Madurai','INDIA',8901234567,245789019);

insert into Customer10 (Id,FirstName,LastName,City,Country,Phone,FaxNumber ) values (3,'Adhila','Sreedharshan','Chennai','INDIA',6456908743,256789014);

select * from Product10;
select * from OrderItem10;
select * from Orders10;
select * from Customer10;

select country from Customer10 where firstname like 'A%';
select firstname from Customer10 where firstname like '__i%';

select * from Customer10 where country='germany';
select firstname +''+ lastname as CustomerName from Customer10;

select * from Customer10 where FaxNumber is not null;

select * from Customer10 where FirstName like '-u%';

select * from OrderItem10 where UnitPrice between 10 and 20;

select * from Orders10 ORDER BY OrderDate;

select * from Product10 where Supply='Exotic Liquids';

select avg(Quantity)as avgQuantity from OrderItem10 GROUP BY ProductId;

select ShipName,ShippingCompany from Orders10;

select * from Orders10 where ShipName='LA CORNE D ABONDANCE' AND (OrderDate between '2022-01-01' and '2022-04-01');

select * from Customer10;

select * from Product10 where CategoryName='seafood';

select * from Employees;
select * from Employees where Manager is not null;
select * from Customer10;

select Ordered from Customer10 where country != 'london';

select * from Customer10 where Ordered='chai';

select EmpName,DeptName,Rating from Employees;

alter table Employees

add JoiningDate datetime;

select top 1 * from Employees order by Joindate;

select top 1 * from Employees Order By Joindate DESC;

select top 1 Productname ,UnitPrice from Product10 order by UnitPrice  desc;
select top 1 Productname ,UnitPrice from Product10 order by UnitPrice  

select ProductName,stock from Products1 where stock='out of stock';

select ProductName,unitonorder,unitinstock from Products1 where unitinstock< unitonorder;

select category,suppliers from Products1

select CONCAT(a.firstname,a.lastname)as customer_name,b.id as orderid,b.OrderDate from Customer10 a, Orders10 b
where a.Id=b.CustomerId

select ID from Customer10 where substring(FirstName,len(FirstName)-1,2)='RA';

alter table Employees
add CompanyName nvarchar(50);

select Substring(CompanyName,1, (CHARINDEX(' ',companyname)-1))as FirstWord from Employees 

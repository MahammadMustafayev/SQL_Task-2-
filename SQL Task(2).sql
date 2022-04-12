CREATE DATABASE Work
USE Work

CREATE TABLE Workers
(
   Id int identity(1,1) PRIMARY KEY,
   [Name] nvarchar(50),
   Surname nvarchar(60),
   Fathername nvarchar(50),
   Salary float,
   PositionId int FOREIGN KEY references Position (Id)
)

CREATE TABLE Position
(
   Id int identity(1,1) PRIMARY KEY,
   [Name] nvarchar(50)
)

CREATE TABLE Branch
(
   Id int identity(1,1) PRIMARY KEY,
   [Name] nvarchar(50)
)

CREATE TABLE Products
(
  Id int identity(1,1) PRIMARY KEY,
  [Name] nvarchar(50),
  Buyprice float,
  Saleprice float
)

CREATE TABLE Sale
(
   Id int identity(1,1) PRIMARY KEY,
   ProductId int FOREIGN KEY references Products (Id),
   WorkerId int FOREIGN KEY references  Workers (Id),
   BranchId int FOREIGN KEY references Branch (Id),
   Salesdate date
)
INSERT INTO Workers(Name,Surname,Fathername,Salary)
VALUES ('Anar','Qandayev','Asif',999.99),
      ('Məhəmməd','Mustafayev','Vahid',4000),
	  ('İsmayıl','Əsədov','Tahir',1500),
	  ('Nigar','Elizade','Zaur',2349.99),
	  ('Cosqun','Qurbanov','Fuad',255.99)

INSERT INTO Position(Name)
VALUES ('Ceo'),
       ('Filial Muduru'),
       ('Satis muduru'),
	   ('Adminstrator'),
	   ('Satici')

INSERT INTO Branch(Name)
VALUES ('28 May'),
       ('Sahil'),
	   ('Azadliq'),
	   ('20 Yanvar'),
	   ('Babek')

INSERT INTO Products(Name,Buyprice,Saleprice)
VALUES ('Telefon',1000,1999.99),
       ('Airpods',100,199.99),
	   ('Airdots',25,49.99),
	   ('Notebook',1290,1750),
	   ('Tv',1750,2999.99)

INSERT INTO Sale(Salesdate)
VALUES ('2021-02-11'),
       ('2022-11-27'),
	   ('2012-09-23'),
	   ('2022-04-12'),
	   ('2009-11-25')
--1--
SELECT Sale.Id,Sale.BranchId,Sale.WorkerId,Sale.ProductId,Products.Buyprice,Products.Saleprice FROM Sale 
INNER JOIN Products
ON
Products.Id=Sale.Id
--2--
SELECT SUM(Saleprice) as 'Sum' FROM Products
--3--

--4--
SELECT COUNT(Id) as 'TOTAL' FROM Products 
--5--

--6--
SELECT Sale.Salesdate,Sale.ProductId FROM SALE 
ORDER BY Sale.ProductId DESC


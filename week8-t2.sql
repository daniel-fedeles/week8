--use[master]

--DROP DATABASE IF EXISTS [OnlineMagazine];
--1 Creati baza de date.
CREATE DATABASE [OnlineMagazine];


USE [OnlineMagazine];

begin transaction

DROP TABLE IF EXISTS [dbo].[Customer];
DROP TABLE IF EXISTS [dbo].[Employee];
DROP TABLE IF EXISTS [dbo].[Category];
DROP TABLE IF EXISTS [dbo].[Product];
DROP TABLE IF EXISTS [dbo].[OrderProduct];
DROP TABLE IF EXISTS [dbo].[Order];


--2 Creati scripturile pentru tabele necesare si legaturile dintre ele. 
CREATE TABLE [dbo].[Customer](
	[Id][int] primary key not null,
	[Nume][nvarchar](MAX)not null,
	[Email][nvarchar](MAX)not null,
	)
CREATE TABLE [dbo].[Empoyee](
	[Id][int] primary key not null,
	[Nume][nvarchar](MAX) not null,
	[Email][nvarchar](MAX) not null
	)
CREATE TABLE [dbo].[Category](
	[Id][int] primary key not null,
	[Nume][nvarchar](MAX)not null,
	[EmployeeId][int]not null,
	CONSTRAINT EmployeeIdKey
	FOREIGN KEY ([EmployeeId]) REFERENCES [Empoyee]([ID])
	)
CREATE TABLE [dbo].[Product](
	[Id][int] primary key not null,
	[Nume][nvarchar](MAX)not null,
	[CategoryId][int]not null,
	[Description][nvarchar](MAX),
	[Price][decimal](18, 0),
	CONSTRAINT CategoryIdKey
	FOREIGN KEY ([CategoryId]) REFERENCES [Category]([ID])
	)
CREATE TABLE [dbo].[Order](
	[Id][int] primary key not null,
	[Numar][int]not null,
	[Data][datetime],
	[CustomerId][int]not null,
	[Status][nvarchar](max) not null,
	[TotalPrice][decimal](18,0) --CHECK ([Status]='approved')
	CONSTRAINT CustomerIdKey FOREIGN KEY ([CustomerId]) REFERENCES [Customer]([ID])
	)
CREATE TABLE [dbo].[OrderProduct](
	[OrderId][int] not null,
	[ProductId][int] not null,
	[NumberOfProducts][int]not null,
	CONSTRAINT FKOrderId FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Order],
	CONSTRAINT FKProductId FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product],
	CONSTRAINT PK_OrderProduct PRIMARY KEY NONCLUSTERED ([OrderId], [ProductId])
	)
INSERT INTO [dbo].[Empoyee]
([Id],[Nume],[Email])
     VALUES
(1,'Vasile','ion.vasile@wantsome.com'),
(2,'Gigi','Kent.Gigi@bubu.com'),
(3,'Radu','Radu.vasile@msdn.com'),
(4,'Iulian','Iulian.vasile@google.com'),
(5,'Popescu','ion.popescu@yahoo.com'),
(6,'Ciobanu','ion.Ciobanu@wantsome.com')
INSERT INTO [dbo].[Category]
([Id],[Nume],[EmployeeId])
     VALUES
(1,'Detergent',1),
(2,'Masini de spalat',2),
(3,'Uscatoare',3),
(4,'Auto',4),
(5,'Retelistica',5),
(6,'Frigidere',6),
(7,'Telecomunicatii',1),
(8,'Jucarii',2),
(9,'Bricolaj',3),
(10,'Scule',4),
(11,'Componente pc',5),
(12,'Unitati',6),
(13,'Surse',1),
(14,'Servere',2),
(15,'Laptopuri',3),
(16,'Telefoane',4),
(17,'Tablete',5),
(18,'Televizoare',6),
(19,'Electrocasnice',1),
(20,'Aspiratoare',2),
(21,'Gradinarit',3),
(22,'Constructii',4),
(23,'Asigurari',5),
(24,'Gamming',6),
(25,'Carti',1),
(26,'Birotica si papetarie',2),
(27,'Alimente',3),
(28,'Climatizare',4)
INSERT INTO [dbo].[Customer]
([Id],[Nume],[Email])
     VALUES
(1,'Prelipcean','Prelipcean.Iosif@wantsome.com'),
(2,'Bodnar','gigikent@gmail.com'),
(3,'Arhire','hahaha@blablabla.com'),
(4,'Bucur','cucubau@wantsome.com'),
(5,'Cobzaru','bibibi@wantsome.com'),
(6,'Panaite','uhubuhu@yahoo.com'),
(7,'Popescu','popescupopescu@msdn.com'),
(8,'Ciobotariu','totulepunctcom@tot.com')
INSERT INTO [dbo].[Order]
([Id],[Numar],[Data],[CustomerId],[Status])
     VALUES
(1,12,'2018-11-21',1,'approved'),
(2,4,'2018-10-29',2,'pending'),
(3,20,'2017-11-21',3,'processing'),
(4,65,'2018-05-21',4,'delivered'),
(5,2,'2019-11-21',5,'return'),
(6,1,'2018-12-30',6,'approved'),
(7,36,'2018-11-21',7,'pending'),
(8,45,'2018-11-21',8,'processing')
INSERT INTO [dbo].[OrderProduct]
([OrderId],[ProductId],[NumberOfProducts])
     VALUES
(1,36,1),
(1,35,1),
(1,34,1),
(1,1,1),
(1,2,2),
(1,3,3),
(2,4,5),
(2,9,10),
(2,33,6),
(2,32,6),
(2,31,6),
(2,28,6),
(2,27,6),
(2,5,8),
(2,6,3),
(3,7,2),
(3,8,6),
(3,9,9),
(3,10,1),
(4,21,2),
(4,12,4),
(4,10,3),
(4,26,6),
(4,25,5),
(4,13,7),
(5,14,9),
(5,19,10),
(5,24,23),
(6,23,8),
(6,21,1),
(6,22,4),
(6,15,3),
(7,26,6),
(7,10,2),
(7,30,9),
(7,31,9),
(7,32,9),
(7,16,9),
(8,17,19),
(8,19,32),
(8,20,11),
(8,21,4),
(1,17,6),
(2,30,8),
(2,39,8),
(2,40,8),
(2,37,8)
INSERT INTO [dbo].[Product]
([Id],[Nume],[CategoryId],[Description],[Price])
     VALUES
(1,'Arctic',2,'7',1269)
,
(2,'Samsung',6,'dsfdcv',26)
,
(3,'DIGI',5,'',369)
,
(4,'OLX',4,'cvxccb',125)
,
(5,'JS',3,'dsfds',23.5)
,
(6,'Harvard',2,'opopo',85)
,
(7,'Autostrada',1,'dfgvc',999999)
,
(8,'un produs',8,'dfgdf',1)
,
(9,'alt produs',9,'',2)
,
(10,'vand telefon',10,'regdfgvdf',2)
,
(11,'Dacia',11,'fghdfhfgv',5)
,
(12,'Sandero',12,'',2)
,
(13,'Golan',13,'gbcv',9)
,
(14,'Logan',14,'kiui768gbf dfbvgdgh',6)
,
(15,'VW',15,'',250)
,
(16,'DELL',16,'ghgfhgf',1590)
,
(17,'HP',17,'',36.5)
,
(18,'Ariel',18,'',10)
,
(19,'Nu conteza',19,'fgvbg',999)
,
(20,'Carte alba',20,'htghr',1)
,
(21,'Vreau autostrada',21,'',999999.9)
,
(22,'Tastatura',22,'fhjk ghjtjt gfhnjdyh',25)
,
(23,'Mouse',5,'',65)
,
(24,'Card acces',6,'',125)
,
(25,'Parcare',7,'',96)
,
(26,'Ceas',8,'',45)
,
(27,'Balon',9,'dfbhhghr',36)
,
(28,'heliu',3,'',84)
,
(29,'arduino',10,'',23)
,
(30,'esp8266',11,'regrehrthrtg',66)
,
(31,'esp32',16,'',867.5)
,
(32,'ws2812b',15,'',26)
,
(33,'motor pas cu pas',9,'ggggggg',36)
,
(34,'actuator liniar',5,'reghrehfbdh',95)
,
(35,'microsoft windows 10',26,'rthtrtthr',25)
,
(36,'sticla',11,'rtre',15)
,
(37,'oglinda',6,'',4546)
,
(38,'amestec',22,'fhdf',125.458)
,
(39,'tutun',21,'fbddf',96)
,
(40,'antena cb',9,'dfgdf',126)
,
(41,'statie cb',5,'xasas',8569)

COMMIT
--3 Creati diagrama bazei de date. 
-- Nu merge sa fac diagrama pentru ca nu sunt admin pe laptop. Laptop de serviciu.

--4 Afisati toate produsele.
select [Id],[Nume],[CategoryId],[Description],[Price] from [dbo].[Product]

--5 Afisati toti clientii care au in continutul email-ului @wantsome.com.
select [id], [nume], [email] from [dbo].[Customer] where [email] like '%wantsome.com'

--6 Afisati suma preturilor pentru fiecare categorie in parte.
select sum(p.[Price]), p.CategoryId from [dbo].[Product] p group by CategoryId
--,[dbo].[Product] x  
--where p.CategoryId = x.CategoryId --group by p.CategoryId

--7 Afisati clientii care au mai mult de 10 comenzi.

select  c.nume from dbo.Customer c 
join dbo.[order] o on c.Id=o.CustomerId
where o.Numar>10;

--8 Creati un view care va afisa toti clientii si produsele comandate de acestia.
USE [OnlineMagazine]
CREATE VIEW [dbo].[CustomersWithOrders]
AS
SELECT        dbo.Customer.Id AS IDCUSTOMER, dbo.Customer.Nume AS NAMECUSTOMER, dbo.Customer.Email, dbo.[Order].Id AS IDORDER, dbo.[Order].Numar, dbo.[Order].Data, dbo.[Order].CustomerId, dbo.[Order].Status, 
                         dbo.[Order].TotalPrice, dbo.OrderProduct.OrderId, dbo.OrderProduct.ProductId, dbo.OrderProduct.NumberOfProducts, dbo.Product.Id, dbo.Product.Nume, dbo.Product.CategoryId, dbo.Product.Description
FROM            dbo.Customer INNER JOIN
                         dbo.[Order] ON dbo.Customer.Id = dbo.[Order].CustomerId INNER JOIN
                         dbo.OrderProduct ON dbo.[Order].Id = dbo.OrderProduct.OrderId INNER JOIN
                         dbo.Product ON dbo.OrderProduct.ProductId = dbo.Product.Id
GO
--9 Folositi view-ul de la punctul precedent pentru a afisa:
--10 Clientii care au comandat produse in primele trei luni ale anului.
select * from [dbo].[CustomersWithOrders] where [Data] between ('2019-01-01') and ('2019-03-31')
--11 Clientii care au comandat produse dintr-o anumita categorie.
select * from [dbo].[CustomersWithOrders] where [CategoryId] = 5
--12 Creati o procedura care va modifica statusul unui Order. 

--13 Aceasta procedura va updata si LastModifiedDate.

--14 Creati un raport (select cu group by) pentru a afisa vanzarile pentru fiecare produs in parte.

--15 Creati o functie care va calcula pretul total pentru o anumita comanda.

--16 Order Audit Table - OrderId, CustomerId, DateTime. - insert trigger
CREATE TRIGGER [dbo].[OrderAudit]
   ON  [dbo].[Order] 
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	IF EXISTS(SELECT [Id] FROM [dbo].[Order])
		BEGIN
		PRINT'Updates [Id]'
		END
	IF EXISTS(SELECT [CustomerId] FROM [dbo].[Order])
		BEGIN
		PRINT'Updates [CustomerId]'
		END
	IF EXISTS(SELECT [Data] FROM [dbo].[Order])
		BEGIN
		PRINT'Updates [Data]'
		END
	IF EXISTS(SELECT [Id],[CustomerId],[Data] FROM [dbo].[Order])
		BEGIN
		PRINT'Updates ID, Customer, Data'
		END

END
GO

ALTER TABLE [dbo].[Order] ENABLE TRIGGER [OrderAudit]
GO

--17 Order Audit - Cand order-ul are status approved = update pe coloana approvedat in audit table. update trigger

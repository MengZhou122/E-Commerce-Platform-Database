CREATE DATABASE t17;
USE t17;

/* Create tables */
CREATE TABLE Customer
(
       CustomerID varchar(5)  PRIMARY KEY,
       Firstname varchar(40) NOT NULL,
       Lastname varchar(40) NOT NULL,
       Birthday Datetime NOT NULL,
       Telephone varchar(20) NOT NULL
);
CREATE TABLE CustomerAddress
(
       AddressID varchar(5) NOT NULL PRIMARY KEY,
       Street varchar(40),
       City varchar(30),
       RoomNumber varchar(20),
       CustomerID varchar(5) NOT NULL REFERENCES Customer(CustomerID)
);
CREATE TABLE Card
(
       CardID varchar(5) NOT NULL PRIMARY KEY,
       CardNumber varchar(16),
       CustomerID varchar(5) NOT NULL REFERENCES Customer(CustomerID)
);
CREATE TABLE [Order]
(
       OrderID varchar(5) NOT NULL PRIMARY KEY,
       CustomerID varchar(5) NOT NULL REFERENCES Customer(CustomerID),
       AddressID varchar(5) NOT NULL REFERENCES CustomerAddress(AddressID),
       CurStates varchar(20),
       CardID varchar(5) NOT NULL REFERENCES Card(CardID)
);
CREATE TABLE Cart
(
       CartID varchar(5) NOT NULL PRIMARY KEY,
       CustomerID varchar(5) NOT NULL REFERENCES Customer(CustomerID)
);
CREATE TABLE Category
(
       CategoryID varchar(5) NOT NULL PRIMARY KEY,
       CategoryName varchar(20),
       Description varchar(60) 
);
CREATE TABLE CustomerService
(
       CustomerServiceID varchar(5) NOT NULL PRIMARY KEY,
       Telephone varchar(20),
       Website varchar(60) 
);
CREATE TABLE Brand
(
       BrandID varchar(5) NOT NULL PRIMARY KEY,
       BrandName varchar(40) ,
       CustomerServiceID varchar(5) NOT NULL REFERENCES CustomerService(CustomerServiceID)
);
CREATE TABLE Product
(
       ProductID varchar(5) NOT NULL PRIMARY KEY,
       ProductName varchar(40),
       BrandID varchar(5) NOT NULL REFERENCES Brand(BrandID),
       UnitPrice MONEY,
       CategoryID varchar(5) NOT NULL REFERENCES Category(CategoryID)
);
CREATE TABLE Favourite
(
       CustomerID varchar(5) NOT NULL REFERENCES Customer(CustomerID) PRIMARY KEY,  
       ProductID varchar(5) NOT NULL REFERENCES Product(ProductID) PRIMARY KEY
);
CREATE TABLE OrderItem
(
       OrderItemID varchar(5) NOT NULL PRIMARY KEY,
       OrderID varchar(5) NOT NULL REFERENCES [Order](OrderID),
       ProductID varchar(5) NOT NULL REFERENCES Product(ProductID),
       Quantity INT 
);
CREATE TABLE CartItem
(
       CartItemID varchar(5) NOT NULL PRIMARY KEY,
       CartID varchar(5) NOT NULL REFERENCES Cart(CartID),
       ProductID varchar(5) NOT NULL REFERENCES Product(ProductID),
       Quantity INT
);

/* Insert data */
--cu for Customer
--cd for CustomerAddress
--od for Order
--oi for OrderItem
--rd for Card
--ct for Cart
--pr for Product
--ci for CartItem
--ca for Category
--br for Brand
--cs for Customerservice
INSERT dbo.Customer VALUES ('cu001', 'Bob', 'White','1996-02-17','8392419337');
INSERT dbo.Customer VALUES ('cu002', 'Mary', 'Jane','1981-09-30','9648243656');
INSERT dbo.Customer VALUES ('cu003', 'Kobe', 'Decaprio','1984-04-02','9648243656');
INSERT dbo.Customer VALUES ('cu004', 'Walson', 'Hamilton','1976-11-18','9648243656');
INSERT dbo.Customer VALUES ('cu005', 'Joe', 'Edward','1967-12-11','9648243656');
INSERT dbo.Customer VALUES ('cu006', 'Malbury', 'Jane','1987-06-28','9648243656');
INSERT dbo.Customer VALUES ('cu007', 'Petter', 'Holmes','1990-12-13','9648243656');
INSERT dbo.Customer VALUES ('cu008', 'David', 'Lin','1998-01-02','9648243656');
INSERT dbo.Customer VALUES ('cu009', 'Clara', 'Brown','2001-12-25','9648243656');
INSERT dbo.Customer VALUES ('cu010', 'Emma', 'Green','2009-02-20','9648243656');
INSERT dbo.Customer VALUES ('cu011', 'Jonhson', 'Chan','2000-02-15','9648243656');
INSERT dbo.Customer VALUES ('cu012', 'Zacker', 'Roberts','1991-12-05','9648243656');
INSERT dbo.Customer VALUES ('cu013', 'Juan', 'Lee','1991-07-25','9648243656');
INSERT dbo.Customer VALUES ('cu014', 'Ann', 'Berry','1986-12-15','9648243656');
INSERT dbo.Customer VALUES ('cu015', 'Tomas', 'Anderson','2004-04-23','9648243656');
INSERT dbo.Customer VALUES ('cu016', 'Alex', 'Ford','1987-08-05','9648243656');
INSERT dbo.Customer VALUES ('cu017', 'Luke', 'Handsonberg','1990-04-20','9648243656');

INSERT dbo.CustomerAddress VALUES ('cd001', '333 Huntington Aveue', 'Boston','221','cu001');
INSERT dbo.CustomerAddress VALUES ('cd002', '329 Clearway Street', 'Boston','421','cu002');
INSERT dbo.CustomerAddress VALUES ('cd003', '4656 Market Street', 'San Jose','9','cu003');
INSERT dbo.CustomerAddress VALUES ('cd004', '121 Mission Street', 'Chigago','454','cu004');
INSERT dbo.CustomerAddress VALUES ('cd005', '35 4th Street', 'Los Angles','10','cu005');
INSERT dbo.CustomerAddress VALUES ('cd006', '9 El Camino Street', 'Seattle','401','cu006');
INSERT dbo.CustomerAddress VALUES ('cd007', '198 Tomas Street', 'Pleasanton','633','cu007');
INSERT dbo.CustomerAddress VALUES ('cd008', '156 Berry Street', 'San Jose','521','cu008');
INSERT dbo.CustomerAddress VALUES ('cd009', '132 2nd Street', 'Miami','2','cu009');
INSERT dbo.CustomerAddress VALUES ('cd010', '6 Foothill Street', 'New York','11','cu010');
INSERT dbo.CustomerAddress VALUES ('cd011', '26 Medallion Street', 'Santa Babara','452','cu011');
INSERT dbo.CustomerAddress VALUES ('cd012', '57 16th Street', 'New York','8','cu012');
INSERT dbo.CustomerAddress VALUES ('cd013', '176 Santos Ranch Street', 'San Jose','1','cu013');
INSERT dbo.CustomerAddress VALUES ('cd014', '364 Palomares Street', 'San Fransico','4','cu014');
INSERT dbo.CustomerAddress VALUES ('cd015', '278 Main Street', 'San Diego','102','cu015');
INSERT dbo.CustomerAddress VALUES ('cd016', '7 Huntwood Street', 'Huston','9044','cu016');
INSERT dbo.CustomerAddress VALUES ('cd017', '129 Creek Lake Street', 'Santa Cruz','9044','cu017');

INSERT dbo.Card VALUES('rd001','700045678923037','cu001');
INSERT dbo.Card VALUES('rd002','700048450910055','cu002');
INSERT dbo.Card VALUES('rd003','704524562848094','cu003');
INSERT dbo.Card VALUES('rd004','612762436223113','cu004');
INSERT dbo.Card VALUES('rd005','622112345484509','cu005');
INSERT dbo.Card VALUES('rd006','612743849569346','cu006');
INSERT dbo.Card VALUES('rd007','700059372528532','cu007');
INSERT dbo.Card VALUES('rd008','700598367364745','cu008');
INSERT dbo.Card VALUES('rd009','600049373638343','cu009');
INSERT dbo.Card VALUES('rd010','602928262423256','cu010');
INSERT dbo.Card VALUES('rd011','711163289047353','cu011');
INSERT dbo.Card VALUES('rd012','709038363453421','cu012');
INSERT dbo.Card VALUES('rd013','628393403833472','cu013');
INSERT dbo.Card VALUES('rd014','938236256263784','cu014');
INSERT dbo.Card VALUES('rd015','938236262373735','cu015');
INSERT dbo.Card VALUES('rd016','948362352363737','cu016');
INSERT dbo.Card VALUES('rd017','837363738484893','cu017');
-- customer 02, 07 and 12 has two cards
INSERT dbo.Card VALUES('rd018','559483762382382','cu012');
INSERT dbo.Card VALUES('rd019','723489574237328','cu007');
INSERT dbo.Card VALUES('rd020','700949347363637','cu002');

INSERT dbo.[Order] VALUES('od001','cu001','cd001','Processing','rd001');
INSERT dbo.[Order] VALUES('od002','cu002','cd002','Delivered','rd002');
INSERT dbo.[Order] VALUES('od003','cu007','cd007','Processing','rd007');
INSERT dbo.[Order] VALUES('od004','cu002','cd002','Processing','rd002');
INSERT dbo.[Order] VALUES('od005','cu003','cd003','Processing','rd003');
INSERT dbo.[Order] VALUES('od006','cu004','cd004','Processing','rd004');
INSERT dbo.[Order] VALUES('od007','cu008','cd008','Processing','rd008');
INSERT dbo.[Order] VALUES('od008','cu002','cd002','Processing','rd002');
INSERT dbo.[Order] VALUES('od009','cu009','cd002','Processing','rd002');
INSERT dbo.[Order] VALUES('od010','cu002','cd009','Processing','rd009');

INSERT dbo.Cart VALUES('ct001','cu001');
INSERT dbo.Cart VALUES('ct002','cu002');
INSERT dbo.Cart VALUES('ct003','cu003');
INSERT dbo.Cart VALUES('ct004','cu004');
INSERT dbo.Cart VALUES('ct005','cu005');
INSERT dbo.Cart VALUES('ct006','cu006');
INSERT dbo.Cart VALUES('ct007','cu007');
INSERT dbo.Cart VALUES('ct008','cu008');
INSERT dbo.Cart VALUES('ct009','cu009');
INSERT dbo.Cart VALUES('ct010','cu010');
INSERT dbo.Cart VALUES('ct011','cu012');

INSERT dbo.Category VALUES('ca001', 'medicine', 'Product for medicine');
INSERT dbo.Category VALUES('ca002', 'health care', 'Using for assisstant');
INSERT dbo.Category VALUES('ca003', 'elctronics', 'Household electronics');
INSERT dbo.Category VALUES('ca004', 'camera', 'digical camera');
INSERT dbo.Category VALUES('ca005', 'laptop', 'laotop computer');
INSERT dbo.Category VALUES('ca006', 'food & grocery', 'Grocery for daily cosuming');
INSERT dbo.Category VALUES('ca007', 'cellphone', 'Cellphone');
INSERT dbo.Category VALUES('ca008', 'drinks', 'Water and flavour drinks');
INSERT dbo.Category VALUES('ca009', 'clothing', 'clothing, dresses etc');
INSERT dbo.Category VALUES('ca010', 'household essentials', 'kitchen staff, light, house cleaningutensil');

INSERT dbo.CustomerService VALUES('cs001','4009876376','www.sonic.com/07/service/customers');
INSERT dbo.CustomerService VALUES('cs002','8790542794','www.samsung.com/service/customers');
INSERT dbo.CustomerService VALUES('cs003','8006927753','www.apple.com/service/customers');
INSERT dbo.CustomerService VALUES('cs004','4007009297','https://www.sony.com/electronics/support');
INSERT dbo.CustomerService VALUES('cs005','8452569271','www.coca-cola.com/service/customers');
INSERT dbo.CustomerService VALUES('cs006','5135669272','www.dove.sony.com/customersupport');
INSERT dbo.CustomerService VALUES('cs007','8047669251','www.dell.com/support');
INSERT dbo.CustomerService VALUES('cs008','800866927','www.bayer.com/en/contact.aspx');
INSERT dbo.CustomerService VALUES('cs009','8668952735','www.wholefoods360.com/support');
INSERT dbo.CustomerService VALUES('cs010','8239689577','www.kirkland-costco.com/support');
INSERT dbo.CustomerService VALUES('cs011','4005669273','www.Colgate.com/service/customers');

INSERT dbo.Brand VALUES('br001','Sonic','cs001');
INSERT dbo.Brand VALUES('br002','Samsung','cs002');
INSERT dbo.Brand VALUES('br003','Apple','cs003');
INSERT dbo.Brand VALUES('br004','Sony','cs004');
INSERT dbo.Brand VALUES('br005','Coca-cola','cs005');
INSERT dbo.Brand VALUES('br006','Dove','cs006');
INSERT dbo.Brand VALUES('br007','Dell','cs007');
INSERT dbo.Brand VALUES('br008','Bayer','cs008');
INSERT dbo.Brand VALUES('br009','wholefoods360','cs009');
INSERT dbo.Brand VALUES('br010','Kirkland','cs010');
INSERT dbo.Brand VALUES('br011','Colgate','cs011');

INSERT dbo.Product VALUES('pr001','sonicare earplug', 'br001', 59.99, 'ca002');
INSERT dbo.Product VALUES('pr002','soft earplug', 'br001', 6.99, 'ca002');
INSERT dbo.Product VALUES('pr003','6D MarkII Didical Camera', 'br003', 6000, 'ca004');
INSERT dbo.Product VALUES('pr004','AppleTV', 'br003', 1299, 'ca003');
INSERT dbo.Product VALUES('pr005','iMac', 'br003', 1389, 'ca003');
INSERT dbo.Product VALUES('pr006','4KPlasmaTV', 'br002', 698, 'ca003');
INSERT dbo.Product VALUES('pr007','13 inch laptop', 'br007', 899, 'ca003');
INSERT dbo.Product VALUES('pr008','15 inch laptop', 'br007', 999, 'ca003');
INSERT dbo.Product VALUES('pr009','eye drop', 'br008', 9.3, 'ca001');
INSERT dbo.Product VALUES('pr010','paly station', 'br004', 350, 'ca003');
INSERT dbo.Product VALUES('pr011','Purified water', 'br005', 5.6, 'ca008');
INSERT dbo.Product VALUES('pr012','T-shirt', 'br010', 5.6, 'ca009');
INSERT dbo.Product VALUES('pr013','Organic milk', 'br010', 2.3, 'ca006');
INSERT dbo.Product VALUES('pr014','Coca-cola', 'br005', 1.2, 'ca008');
INSERT dbo.Product VALUES('pr015','Fanta', 'br005', 1.3, 'ca008');

INSERT dbo.OrderItem VALUES('oi001','od001', 'pr001', 2);
INSERT dbo.OrderItem VALUES('oi002','od001', 'pr002', 1);
INSERT dbo.OrderItem VALUES('oi003','od002', 'pr006', 2);
INSERT dbo.OrderItem VALUES('oi004','od002', 'pr002', 3);
INSERT dbo.OrderItem VALUES('oi005','od002', 'pr004', 5);
INSERT dbo.OrderItem VALUES('oi006','od001', 'pr005', 3);
INSERT dbo.OrderItem VALUES('oi007','od001', 'pr008', 1);
INSERT dbo.OrderItem VALUES('oi008','od002', 'pr009', 1);
INSERT dbo.OrderItem VALUES('oi009','od001', 'pr010', 2);
INSERT dbo.OrderItem VALUES('oi010','od002', 'pr010', 3);

INSERT dbo.Favourite VALUES('cu001','pr001');
INSERT dbo.Favourite VALUES('cu002','pr001');
INSERT dbo.Favourite VALUES('cu012','pr013');
INSERT dbo.Favourite VALUES('cu003','pr007');
INSERT dbo.Favourite VALUES('cu017','pr005');
INSERT dbo.Favourite VALUES('cu007','pr013');
INSERT dbo.Favourite VALUES('cu011','pr003');
INSERT dbo.Favourite VALUES('cu011','pr006');
INSERT dbo.Favourite VALUES('cu008','pr004');
INSERT dbo.Favourite VALUES('cu005','pr005');
INSERT dbo.Favourite VALUES('cu009','pr007');
INSERT dbo.Favourite VALUES('cu012','pr009');
INSERT dbo.Favourite VALUES('cu014','pr008');
INSERT dbo.Favourite VALUES('cu013','pr012');
INSERT dbo.Favourite VALUES('cu004','pr003');

INSERT dbo.CartItem VALUES('ci001','ct001','pr001', 1);
INSERT dbo.CartItem VALUES('ci002','ct001','pr002', 1);
INSERT dbo.CartItem VALUES('ci003','ct002','pr015', 2);
INSERT dbo.CartItem VALUES('ci004','ct002','pr010', 1);
INSERT dbo.CartItem VALUES('ci005','ct003','pr015', 4);
INSERT dbo.CartItem VALUES('ci006','ct003','pr008', 3);
INSERT dbo.CartItem VALUES('ci007','ct004','pr005', 1);
INSERT dbo.CartItem VALUES('ci008','ct005','pr009', 1);
INSERT dbo.CartItem VALUES('ci009','ct003','pr015', 4);
INSERT dbo.CartItem VALUES('ci010','ct006','pr008', 3);
INSERT dbo.CartItem VALUES('ci011','ct006','pr004', 1);
INSERT dbo.CartItem VALUES('ci012','ct007','pr013', 1);



-- Table-level constraint check 
--DROP FUNCTION hasCompleteAddress;
CREATE FUNCTION hasCompleteAddress(@CustID varchar(5))
RETURNS SMALLINT
AS BEGIN
	DECLARE @compelete SMALLINT;
	SELECT @compelete = CASE WHEN EXISTS (
		SELECT *
		FROM CustomerAddress 
		WHERE CustomerID = @CustID
		AND Street IS NULL OR City IS NULL OR RoomNumber IS NULL
	)
	THEN 1
	ELSE 0
	END
	RETURN @compelete
END;

--check the output of the function
--SELECT dbo.hasCompleteAddress('cu017');

ALTER TABLE CustomerAddress ADD CONSTRAINT hasValidAddress CHECK (dbo.hasCompleteAddress(CustomerID) = 0);
--ALTER TABLE CustomerAddress DROP CONSTRAINT hasValidAddress;
	
--Failed due to the INSERT statement conflicted with the CHECK constraint "hasValidAddress"
INSERT dbo.CustomerAddress VALUES ('cd018', NULl, NULL ,'9044','cu018');
SELECT * FROM CustomerAddress;



-- Computed Column 
-- 1. Calculate CartItem Total Price
CREATE FUNCTION dbo.CalcuCartItemTotalPrice(@CartItemID VARCHAR(20))
RETURNS money
AS BEGIN
 DECLARE @total money = 0;
 SELECT @total = tmp.totalNum
 FROM(
  SELECT (p.UnitPrice * c.Quantity) AS totalNum
  FROM Product p
  JOIN CartItem c
  ON p.ProductID = c.ProductID
  WHERE c.CartItemID = @CartItemID
 ) AS tmp
RETURN @total
END;

ALTER TABLE dbo.CartItem
ADD TotalPrice AS([dbo].[CalcuCartItemTotalPrice](CartItemID));
--ALTER TABLE dbo.CartItem DROP COLUMN TotalPrice

-- check for result
SELECT TOP 3 *
FROM dbo.CartItem
ORDER BY TotalPrice DESC;


-- 2.Calculate Cart Total Price
CREATE FUNCTION dbo.CalcuCartTotalPrice(@CartID VARCHAR(20))
RETURNS MONEY
AS BEGIN
 DECLARE @total money = 
 (
       SELECT SUM(TotalPrice)
       FROM dbo.CartItem
       WHERE CartID = @CartID
 );
 SET @total = ISNULL(@total,0);
 RETURN @total
 END;
 
ALTER TABLE dbo.Cart ADD CartTotalPrice AS(dbo.CalcuCartTotalPrice(CartID));

-- check result
SELECT TOP 3 *
FROM dbo.Cart 
ORDER BY CartTotalPrice DESC;
 
-- 3. Calculate Age 
CREATE FUNCTION [dbo].[fn_CalcAge](@CustomerID varchar(5))
RETURNS INT
AS 
    BEGIN
        DECLARE @Age int
        DECLARE @Now datetime
        DECLARE @Birthday datetime =
            ( SELECT Birthday 
              FROM Customer
              WHERE CustomerID =@CustomerID
            );
        SET @Now=getdate();
       -- SELECT @Age= DATEDIFF(yy,@Birthday,@Now)
     SET @Age =DATEDIFF(yy,@Birthday,@Now);
        RETURN @Age
END;
 
ALTER TABLE dbo.Customer ADD Age AS([dbo].[fn_CalcAge](CustomerID));
 
-- check result
SELECT TOP 10 *
FROM dbo.Customer
ORDER BY Age DESC;
 
-- 4. Calculate OrderItem Total Price
CREATE FUNCTION [dbo].[CalcuOrderItemTotalPrice](@OrderItemID VARCHAR(20))
RETURNS money
AS BEGIN
 DECLARE @total money = 0;
 SELECT @total = tmp.totalNum
 FROM(
  SELECT (p.UnitPrice * OI.Quantity) AS totalNum
  FROM Product p
  JOIN OrderItem OI
  ON p.ProductID = OI.ProductID
  WHERE OI.OrderItemID = @OrderItemID
 ) AS tmp
RETURN @total
END;
 
ALTER TABLE dbo.OrderItem ADD TotalPrice AS([dbo].[CalcuOrderItemTotalPrice](OrderItemID));
 
-- check result
SELECT TOP 3 *
FROM dbo.OrderItem
ORDER BY TotalPrice DESC;

--DROP FUNCTION [dbo].[CalcuOrderItemTotalPrice]
--ALTER table OrderItem DROP COLUMN TotalPrice
--ALTER table dbo.Order DROP COLUMN OrderTotalPrice
 
-- 5. Calculate Order Total Price
CREATE FUNCTION [dbo].[CalcuOrderTotalPrice](@OrderID VARCHAR(20))
RETURNS MONEY
AS BEGIN
 DECLARE @total money = 
 (
        SELECT SUM(TotalPrice)
        FROM dbo.OrderItem
        WHERE OrderID = @OrderID
 );
 SET @total = ISNULL(@total,0);
 RETURN @total
 END;
  
ALTER TABLE dbo.[Order] ADD TotalPrice AS([dbo].[CalcuOrderTotalPrice](OrderID));
 
-- check result
SELECT TOP 3 *
FROM dbo.[Order]
ORDER BY OrderTotalPrice DESC;

--DROP FUNCTION [dbo].[CalcuOrderTotalPrice]
--ALTER table dbo.Order DROP COLUMN TotalPrice

-- View Part
-- userinfo view
CREATE VIEW vwUserInfo AS
    SELECT cu.CustomerID as [CustomerID], cu.FirstName as [FirstName], cu.LastName as [LastName],cu.Telephone as [Telephone], ca.Street as [Street], ca.City as [City], ca.RoomNumber as [RoomNumber]
    FROM dbo.Customer cu 
    INNER JOIN dbo.CustomerAddress ca 
    on cu.CustomerID = ca.CustomerID;
     
 
 -- userFavoriteInfo view
 CREATE VIEW vwFavoriteInfo AS
    SELECT cu.CustomerID as [CustomerID], cu.FirstName as [FirstName], cu.LastName as [LastName],fa.ProductID as[ProductID],pr.ProductName as[ProductName],pr.UnitPrice as[UnitPrice]
    FROM dbo.Customer cu 
    INNER JOIN dbo.favourite fa 
    on  cu.CustomerID = fa.CustomerID
    INNER JOIN dbo.Product pr
    on fa.ProductID = pr.ProductID;
   


   
-- Data Encryption
ALTER TABLE Customer 
ADD Password VARBINARY(255);
 
-- Create DMK
CREATE MASTER KEY 
ENCRYPTION BY PASSWORD = 'Group17P@ssword';
 
-- Create certificate to protect symmetric key
CREATE CERTIFICATE Group17_Certificate
WITH SUBJECT = 'Group17 Certificate',
EXPIRY_DATE = '2020-01-01';
 
-- Create symmetric key to encrypt data
CREATE SYMMETRIC KEY Group17_SymmetricKey
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE Group17_Certificate;
 
-- Open symmetric key
OPEN SYMMETRIC KEY Group17_SymmetricKey
DECRYPTION BY CERTIFICATE Group17_Certificate;

-- Insert new user
INSERT INTO Customer(CustomerId, FirstName, LastName, Telephone, Password, Birthday)
VALUES ('cu018','John', 'Smith', '678-234-5678', EncryptByKey(Key_GUID(N'Group17_SymmetricKey'), CONVERT(VARBINARY, 'PassWord1')), '1990-12-13');

-- test
SELECT * FROM Customer
 
-- Use decrypt function to see the original password
SELECT FirstName, LastName, CONVERT(VARCHAR, DecryptByKey(Password))  FROM Customer;
 
-- Drop the table
-- DROP TABLE Customer
 
-- Close the symmetric key
CLOSE SYMMETRIC KEY Group17_SymmetricKey;
 
-- Drop the symmetric key
DROP SYMMETRIC KEY Group17_SymmetricKey;
 
-- Drop the certificate 
DROP CERTIFICATE Group17_Certificate;
 
-- Drop the DMK
DROP MASTER KEY;
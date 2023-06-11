create database shoppingMall;
use shoppingMall;

CREATE TABLE Person(
ID VarChar(4) PRIMARY KEY,
Fname VarChar(20) not null,
Mname VarChar(20),
Lname VarChar(25) not null,
Gender char(1) not null,
Street VarChar(50) not null,
Zip int not null,
City VarChar(25) not null,
State VarChar(3) not null,
Age int not null,
DOB DATE not null
);

ALTER TABLE Person ADD CONSTRAINT Zip CHECK (Zip > 9999 AND Zip < 100000);

CREATE TABLE Employee (
EmployeeID char(4) not null PRIMARY KEY, 
JobType VarChar(20) not null,
StartDate DATE not null,
Salary Decimal(12, 2) not null,
FOREIGN KEY (EmployeeID) REFERENCES Person(ID)
);

ALTER TABLE Employee ADD CONSTRAINT EmployeeID CHECK (substr(EmployeeID, 1, 4) REGEXP 'E[0-9][0-9][0-9]');

CREATE TABLE Customer ( 
CustomerID char(4) PRIMARY KEY,
FOREIGN KEY (CustomerID) REFERENCES Person(ID)
);

CREATE TABLE PhoneNumber( 
PhoneNumber bigint PRIMARY KEY,
PersonID char(4) not null,
FOREIGN KEY (PersonID) REFERENCES Person(ID)
);

CREATE TABLE Manager( 
EmployeeID char(4) PRIMARY KEY,
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE FloorStaff (
EmployeeID Char(4) PRIMARY KEY,
ManagerID Char(4) not null,
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
FOREIGN KEY (ManagerID) REFERENCES Manager(EmployeeID)
);

CREATE TABLE Cashier( 
EmployeeID char(4) PRIMARY KEY,
FloorManagerID char(4) not null,
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
FOREIGN KEY (FloorManagerID) REFERENCES FloorStaff(EmployeeID)
);

CREATE TABLE Floors (
FloorNum int PRIMARY KEY
);


CREATE TABLE FloorLog (
FloorNum int  PRIMARY KEY,
M char(4) not null, 
T char(4) not null, 
W char(4) not null,
TH char(4) not null,
F char(4) not null,
SAT char(4) not null,
SUN char(4) not null,
FOREIGN KEY (FloorNum) REFERENCES Floors(FloorNum),
FOREIGN KEY (M) REFERENCES FloorStaff(EmployeeID),
FOREIGN KEY (T) REFERENCES FloorStaff(EmployeeID),
FOREIGN KEY (W) REFERENCES FloorStaff(EmployeeID),
FOREIGN KEY (TH) REFERENCES FloorStaff(EmployeeID),
FOREIGN KEY (F) REFERENCES FloorStaff(EmployeeID),
FOREIGN KEY (SAT) REFERENCES FloorStaff(EmployeeID),
FOREIGN KEY (SUN) REFERENCES FloorStaff(EmployeeID)
);

CREATE TABLE Store (
StoreID int PRIMARY KEY,
StoreName VarChar(45) not null,
Location Char(5) not null,
FloorNum int not null,
StoreType varChar(14) not null, 
FOREIGN KEY (FloorNum) REFERENCES Floors(FloorNum)
);

CREATE TABLE ScheduleTable(
StoreID int PRIMARY KEY,
OpenWeekDay TIME not null,
CloseWeekDay Time not null,
OpenWeekEnd Time not null,
CloseWeekEnd Time not null,
FOREIGN KEY (StoreID) REFERENCES Store(StoreID)
);

CREATE TABLE Orders (
OrderID int PRIMARY KEY,
Subtotal Decimal(10, 2) not null,
CustomerID char(4) not null,
OrderTime Time not null,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Payment (
OrderID int PRIMARY KEY,
CustomerID char(4) not null,
CashierID char(4) not null,
PaymentTime Time not null,
PaymentMethod varChar(10) not null,
Amount Decimal(10, 2) not null,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
FOREIGN KEY (CashierID) REFERENCES Cashier(EmployeeID)
);

CREATE TABLE Product (
ProductID int PRIMARY KEY,
StoreID int not null,
OrderID int not null,
ProductName char(60) not null,
Price Decimal(10, 2) not null,
DescriptionP varChar(100),
Quantity int not null,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (StoreID) REFERENCES Store(StoreID)
);

#beginning inserting data for person employee
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E414', 'Nye', 'Bertrando', 'Yukhnin', 'M', '4002 Anhalt Plaza', '98115', 'Seattle', 'WA', '1987-02-19', 36);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E994', 'Pepe', 'Dael', 'Giorgietto', 'M', '51 Monica Park', '94286', 'Sacramento', 'CA', '1957-02-16', 66);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E314', 'Toby', 'Dimitri', 'Coo', 'M', '4 Weeping Birch Terrace', '22301', 'Alexandria', 'VA', '1971-11-14', 51);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E321', 'Flossi', 'Cora', 'Woodhall', 'F', '99 Service Parkway', '20816', 'Bethesda', 'MD', '1998-04-26', 25);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E142', 'Wendye', 'Amandie', 'Chatters', 'F', '01 Superior Center', '80305', 'Boulder', 'CO', '1972-11-11', 50);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E164', 'Tabby', 'Barnie', 'Nicklin', 'M', '81 Schiller Plaza', '30045', 'Lawrenceville', 'GA', '1957-09-11', 65);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E373', 'Iain', 'Boycie', 'Baroche', 'M', '9 Mockingbird Road', '40586', 'Lexington', 'KY', '1974-08-31', 48);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E981', 'Perren', 'Greggory', 'Monelle', 'M', '27 Autumn Leaf Way', '80951', 'Colorado Springs', 'CO', '1954-12-05', 68);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E187', 'Annamaria', 'Daisie', 'Donovan', 'F', '0 Laurel Drive', '76305', 'Wichita Falls', 'TX', '1982-07-22', 40);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E002', 'Sid', 'Jimmy', 'Hizir', 'M', '74171 Jana Lane', '20918', 'Silver Spring', 'MD', '1965-04-19', 58);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E966', 'Ada', 'Rasla', 'Gomez', 'F', '2 Talmadge Plaza', '49510', 'Grand Rapids', 'MI', '1965-09-21', 57);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E027', 'Sammy', 'Welbie', 'Tomblett', 'M', '68 Kim Parkway', '68517', 'Lincoln', 'NE', '1976-09-12', 46);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E658', 'Salomon', 'Barnebas', 'Kew', 'M', '61663 Moulton Circle', '80915', 'Colorado Springs', 'CO', '1999-02-28', 24);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E748', 'Otto', 'Mozes', 'Rochell', 'M', '8 Westend Point', '32277', 'Jacksonville', 'FL', '1961-05-22', 61);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E283', 'Gorden', 'Corny', 'Thebe', 'M', '20 Jana Drive', '61635', 'Peoria', 'IL', '1985-06-05', 37);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E808', 'Alvira', 'Tybie', 'Essex', 'F', '8635 Dakota Park', '29220', 'Columbia', 'SC', '1982-03-30', 41);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E005', 'Donnell', 'Currey', 'Roskeilly', 'M', '3350 Fremont Way', '78744', 'Austin', 'TX', '1985-08-21', 37);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E585', 'Shawna', 'Babs', 'Ullock', 'F', '5 Schiller Crossing', '70116', 'New Orleans', 'LA', '1979-03-30', 44);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E422', 'Keven', 'Rawley', 'Turbayne', 'M', '48032 Dahle Terrace', '29625', 'Anderson', 'SC', '1996-06-27', 26);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E914', 'Caril', 'Yolande', 'Bolmann', 'F', '6 Colorado Plaza', '77305', 'Conroe', 'TX', '1965-06-19', 57);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E406', 'Maxie', 'Stanford', 'Scholtis', 'M', '6287 Ridgeview Parkway', '55123', 'Saint Paul', 'MN', '1956-01-12', 67);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E107', 'Gregg', 'Martin', 'Foden', 'M', '919 Crescent Oaks Alley', '15225', 'Pittsburgh', 'PA', '1975-10-26', 47);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E639', 'Claudius', 'Alick', 'Ferriday', 'M', '080 Fuller Center', '65211', 'Columbia', 'MO', '1955-01-02', 68);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, DOB, Age) values ('E859', 'Mile', 'Armand', 'Polino', 'M', '19 Bultman Point', '61614', 'Peoria', 'IL', '1952-12-22', 70);

#insert some people who will be customers
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, dob, Age) values ('C575', 'Bil', 'Timotheus', 'Yakubovich', 'M', '2 Hermina Alley', '48295', 'Detroit', 'MI', '2002-05-19', 20);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, dob, Age) values ('C729', 'Nollie', 'Gavin', 'Ruston', 'M', '08228 Norway Maple Terrace', '10115', 'New York City', 'NY', '1986-12-13', 36);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, dob, Age) values ('C627', 'Justina', 'Shelli', 'Stang-Gjertsen', 'F', '33 Summer Ridge Drive', '28815', 'Asheville', 'NC', '1992-07-15', 30);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, dob, Age) values ('C585', 'Piotr', 'Kimball', 'ffrench Beytagh', 'M', '563 Hoepker Parkway', '33111', 'Miami', 'FL', '1992-06-24', 30);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, dob, Age) values ('C422', 'Fawnia', 'Nan', 'Widdowson', 'F', '775 Logan Point', '78737', 'Austin', 'TX', '1980-01-10', 43);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, dob, Age) values ('C302', 'Erick', 'Phillipp', 'Nunns', 'M', '0 Susan Point', '80015', 'Aurora', 'CO', '1969-06-01', 53);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, dob, Age) values ('C431', 'Wells', 'El', 'Scaice', 'M', '575 Scott Court', '88006', 'Las Cruces', 'NM', '1981-10-26', 41);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, dob, Age) values ('C937', 'Cyb', 'Orelia', 'Franzoli', 'F', '082 Gina Junction', '15279', 'Pittsburgh', 'PA', '1975-05-25', 47);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, dob, Age) values ('C611', 'Adair', 'Urbain', 'Lemary', 'M', '116 Jackson Parkway', '89519', 'Reno', 'NV', '1997-03-08', 26);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, dob, Age) values ('C943', 'Verene', 'Tova', 'Lindenfeld', 'F', '05443 Montana Place', '53285', 'Milwaukee', 'WI', '1975-09-15', 47);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, dob, Age) values ('C996', 'Titus', 'Royal', 'Willmer', 'M', '128 Grasskamp Point', '16510', 'Erie', 'PA', '1999-01-29', 24);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, dob, Age) values ('C596', 'Malina', 'Hally', 'Clampe', 'F', '1499 Donald Terrace', '54305', 'Green Bay', 'WI', '1979-10-23', 43);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, dob, Age) values ('C652', 'Willyt', 'Madalena', 'Bucknell', 'F', '551 Mallard Parkway', '32277', 'Jacksonville', 'FL', '1977-05-15', 45);
insert into Person (ID, Fname, Mname, Lname, Gender, Street, Zip, City, State, dob, Age) values ('C985', 'Dulcine', 'Natala', 'Caherny', 'F', '5690 Pepper Wood Place', '16550', 'Erie', 'PA', '1954-04-22', 69);

#insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E414', 'Floor Staff', '2018-11-12', 65674.54);

select * from Person;

insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E414','Floor Staff', '2017-06-11', 55003.67);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E994', 'Manager','2017-09-22',73087.23);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E314', 'Cashier', '2021-11-23', 35876.90);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E321', 'Cashier', '2023-01-10', 43200.43);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E142', 'Manager', '2018-05-15', 69678.26);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E164', 'Floor Staff', '2021-09-26', 45696.09);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E373', 'Manager', '2019-07-21', 65034.28);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E981', 'Cashier', '2022-08-31', 41096.56);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E187', 'Cashier', '2018-02-25', 42310.76);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E002', 'Cashier', '2019-04-19', 48097.87);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E966', 'Floor Staff', '2022-09-21', 37579.23);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E027', 'Floor Staff','2020-01-12', 46987.67);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E658', 'Cashier', '2019-12-12', 34678.09);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E748', 'Cashier', '2022-06-05', 34678.09);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E283', 'Manager','2018-10-25', 65438.07);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E808', 'Manager','2018-05-27', 65432.03);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E005', 'Cashier', '2020-03-30', 32456.70);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E585', 'Floor Staff', '2022-04-20', 37579.23);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E422', 'Cashier','2018-11-07', 45789.98);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E914', 'Floor Staff','2019-06-27', 45789.98);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E406', 'Cashier', '2023-01-12', 37568.90);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E107', 'Floor Staff','2022-11-04', 47789.98);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E639', 'Manager','2018-01-23', 68235.76);
insert into Employee (EmployeeID, JobType, StartDate, Salary) values ('E859', 'Cashier', '2022-09-02', 37568.90);

#populate customer table
insert into Customer (CustomerID) values ('C575');
insert into Customer (CustomerID) values ('C729');
insert into Customer (CustomerID) values ('C627');
insert into Customer (CustomerID) values ('C585');
insert into Customer (CustomerID) values ('C422');
insert into Customer (CustomerID) values ('C302');
insert into Customer (CustomerID) values ('C431');
insert into Customer (CustomerID) values ('C937');
insert into Customer (CustomerID) values ('C611');
insert into Customer (CustomerID) values ('C943');
insert into Customer (CustomerID) values ('C996');
insert into Customer (CustomerID) values ('C596');
insert into Customer (CustomerID) values ('C652');
insert into Customer (CustomerID) values ('C985');

#populate manager table
insert into Manager (EmployeeID) values ('E994');
insert into Manager (EmployeeID) values ('E142');
insert into Manager (EmployeeID) values ('E373');
insert into Manager (EmployeeID) values ('E283');
insert into Manager (EmployeeID) values ('E808');
insert into Manager (EmployeeID) values ('E639');

#populate phone number table
#insert numbers for employees
insert into PhoneNumber (PhoneNumber, PersonID) values (4166280782, 'E414');
insert into PhoneNumber (PhoneNumber, PersonID) values (8779087865, 'E994');
insert into PhoneNumber (PhoneNumber, PersonID) values (5432345678,'E314');
insert into PhoneNumber (PhoneNumber, PersonID) values (2345678901, 'E321');
insert into PhoneNumber (PhoneNumber, PersonID) values (1234567890, 'E142');
insert into PhoneNumber (PhoneNumber, PersonID) values (6479265432, 'E164');
insert into PhoneNumber (PhoneNumber, PersonID) values (2045637890, 'E164');
insert into PhoneNumber (PhoneNumber, PersonID) values (2046785436, 'E373');
insert into PhoneNumber (PhoneNumber, PersonID) values (4161201205, 'E981');
insert into PhoneNumber (PhoneNumber, PersonID) values (4167000700, 'E187');
insert into PhoneNumber (PhoneNumber, PersonID) values (1234567899, 'E002');
insert into PhoneNumber (PhoneNumber, PersonID) values (1234567891, 'E966');
insert into PhoneNumber (PhoneNumber, PersonID) values (9726587654, 'E027');
insert into PhoneNumber (PhoneNumber, PersonID) values (8763214567, 'E658');
insert into PhoneNumber (PhoneNumber, PersonID) values (8976541111, 'E748');
insert into PhoneNumber (PhoneNumber, PersonID) values (9055223456, 'E283');
insert into PhoneNumber (PhoneNumber, PersonID) values (5432156789, 'E808');
insert into PhoneNumber (PhoneNumber, PersonID) values (67543216788, 'E005');
insert into PhoneNumber (PhoneNumber, PersonID) values (9054443333, 'E585');
insert into PhoneNumber (PhoneNumber, PersonID) values (9726587666, 'E422');
insert into PhoneNumber (PhoneNumber, PersonID) values (9726566666, 'E422');
insert into PhoneNumber (PhoneNumber, PersonID) values (2376548888, 'E914');
insert into PhoneNumber (PhoneNumber, PersonID) values (2376548889, 'E406');
insert into PhoneNumber (PhoneNumber, PersonID) values (2376548810, 'E107');
insert into PhoneNumber (PhoneNumber, PersonID) values (6676548777, 'E639');
insert into PhoneNumber (PhoneNumber, PersonID) values (8652222222, 'E859');

#insert  phone numbers for customers
insert into PhoneNumber (PhoneNumber, PersonID) values (4699286984, 'C575');
insert into PhoneNumber (PhoneNumber, PersonID) values (4699207010, 'C729');
insert into PhoneNumber (PhoneNumber, PersonID) values (4699287027, 'C627');
insert into PhoneNumber (PhoneNumber, PersonID) values (8708708700, 'C585');
insert into PhoneNumber (PhoneNumber, PersonID) values (8706544444, 'C422');
insert into PhoneNumber (PhoneNumber, PersonID) values (5014792345, 'C302');
insert into PhoneNumber (PhoneNumber, PersonID) values (5014797766, 'C431');
insert into PhoneNumber (PhoneNumber, PersonID) values (9207865400, 'C937');
insert into PhoneNumber (PhoneNumber, PersonID) values (5556432221, 'C611');
insert into PhoneNumber (PhoneNumber, PersonID) values (7030864678, 'C611');
insert into PhoneNumber (PhoneNumber, PersonID) values (2345690808, 'C943');
insert into PhoneNumber (PhoneNumber, PersonID) values (1239870808, 'C996');
insert into PhoneNumber (PhoneNumber, PersonID) values (5124577001, 'C596');
insert into PhoneNumber (PhoneNumber, PersonID) values (2145654555, 'C652');
insert into PhoneNumber (PhoneNumber, PersonID) values (9734567798, 'C985');
insert into PhoneNumber (PhoneNumber, PersonID) values (9734567998, 'C985');

#populate floor staff
insert into FloorStaff (EmployeeID, ManagerID) values ('E414','E994');
insert into FloorStaff (EmployeeID, ManagerID) values ('E164', 'E994');
insert into FloorStaff (EmployeeID, ManagerID) values ('E966', 'E142');
insert into FloorStaff (EmployeeID, ManagerID) values ('E027', 'E373');
insert into FloorStaff (EmployeeID, ManagerID) values ('E585', 'E283');
insert into FloorStaff (EmployeeID, ManagerID) values ('E914', 'E808');
insert into FloorStaff (EmployeeID, ManagerID) values ('E107', 'E639');

#populate cashier
insert into Cashier (EmployeeID,FloorManagerID) values ('E314', 'E414');
insert into Cashier (EmployeeID,FloorManagerID) values ('E321', 'E414');
insert into Cashier (EmployeeID,FloorManagerID) values ('E981', 'E164');
insert into Cashier (EmployeeID,FloorManagerID) values ('E187', 'E914');
insert into Cashier (EmployeeID,FloorManagerID) values ('E002', 'E107');
insert into Cashier (EmployeeID,FloorManagerID) values ('E658', 'E585');
insert into Cashier (EmployeeID,FloorManagerID) values ('E748', 'E107');
insert into Cashier (EmployeeID,FloorManagerID) values ('E005', 'E585');
insert into Cashier (EmployeeID,FloorManagerID) values ('E422', 'E027');
insert into Cashier (EmployeeID,FloorManagerID) values ('E406', 'E966');
insert into Cashier (EmployeeID,FloorManagerID) values ('E859', 'E966');

#populate floor
insert into Floors (FloorNum) values (1);
insert into Floors (FloorNum) values (2);
insert into Floors (FloorNum) values (3);
insert into Floors (FloorNum) values (4);
insert into Floors (FloorNum) values (5);

#populate floorLog 
insert into FloorLog (FloorNum, M, T, W, TH, F, SAT, SUN) values (1, 'E414', 'E027', 'E107', 'E164', 'E164', 'E966', 'E966');
insert into FloorLog (FloorNum, M, T, W, TH, F, SAT, SUN) values (2, 'E027', 'E414', 'E027', 'E585', 'E585', 'E914', 'E914');
insert into FloorLog (FloorNum, M, T, W, TH, F, SAT, SUN) values (3, 'E107', 'E107', 'E414', 'E414', 'E414', 'E164', 'E164');
insert into FloorLog (FloorNum, M, T, W, TH, F, SAT, SUN) values (4, 'E966', 'E966', 'E966', 'E027', 'E027', 'E585', 'E414');
insert into FloorLog (FloorNum, M, T, W, TH, F, SAT, SUN) values (5, 'E914', 'E914', 'E914', 'E107', 'E107', 'E414', 'E027');

#Populate store
insert into  Store (StoreID, StoreName, Location, FloorNum, StoreType) values (10, 'Sephora', 'AC', 1, 'Beauty');
insert into  Store (StoreID, StoreName, Location, FloorNum, StoreType) values (14, 'Barnes and Nobles', 'AB', 1, 'Books');
insert into  Store (StoreID, StoreName, Location, FloorNum, StoreType) values (12, 'Old Navy', 'AB', 1, 'Clothes');
insert into  Store (StoreID, StoreName, Location, FloorNum, StoreType) values (7, 'Pizza Place', 'AC', 2, 'Food');
insert into  Store (StoreID, StoreName, Location, FloorNum, StoreType) values (5, 'Nike', 'AA', '2', 'Shoes');
insert into  Store (StoreID, StoreName, Location, FloorNum, StoreType) values (1, 'Gap', 'AB', 2, 'Clothes');
insert into  Store (StoreID, StoreName, Location, FloorNum, StoreType) values (2, 'Forever 21', 'AA', 3, 'Clothes');
insert into  Store (StoreID, StoreName, Location, FloorNum, StoreType) values (15, 'Banana Republic', 'AB', 3, 'Clothes');
insert into  Store (StoreID, StoreName, Location, FloorNum, StoreType) values (4, 'ShareTea', 'AC', 3, 'Drink');
insert into  Store (StoreID, StoreName, Location, FloorNum, StoreType) values (3, 'The Phone Shop', 'AC', '4', 'Electronics');
insert into  Store (StoreID, StoreName, Location, FloorNum, StoreType) values (6, 'GameStop', 'AB', '4', 'Electronics');
insert into  Store (StoreID, StoreName, Location, FloorNum, StoreType) values (8, 'Sonic', 'AA', '4', 'Food');
insert into  Store (StoreID, StoreName, Location, FloorNum, StoreType) values (9, 'Morphe', 'AC', '5', 'Beauty');
insert into  Store (StoreID, StoreName, Location, FloorNum, StoreType) values (11, 'Starbucks', 'AB', '5', 'Drink');
insert into  Store (StoreID, StoreName, Location, FloorNum, StoreType) values (13, 'Macys', 'AA', '5', 'Clothes');

#Populatr schedule
insert into  ScheduleTable (StoreID, OpenWeekDay, CloseWeekDay, OpenWeekEnd, CloseWeekEnd)values (10, '09:00:00', '20:00:00', '11:00:00', '19:00:00');
insert into  ScheduleTable (StoreID, OpenWeekDay, CloseWeekDay, OpenWeekEnd, CloseWeekEnd)values (14, '09:00:00', '18:00:00', '09:00:00', '18:30:00');
insert into  ScheduleTable (StoreID, OpenWeekDay, CloseWeekDay, OpenWeekEnd, CloseWeekEnd)values (12, '10:00:00', '20:00:00', '11:00:00', '20:00:00');
insert into  ScheduleTable (StoreID, OpenWeekDay, CloseWeekDay, OpenWeekEnd, CloseWeekEnd)values (7, '10:00:00', '20:00:00', '09:00:00', '21:30:00');
insert into  ScheduleTable (StoreID, OpenWeekDay, CloseWeekDay, OpenWeekEnd, CloseWeekEnd)values (5, '09:00:00', '20:00:00', '11:00:00', '18:00:00');
insert into  ScheduleTable (StoreID, OpenWeekDay, CloseWeekDay, OpenWeekEnd, CloseWeekEnd)values (1, '09:00:00', '18:00:00', '09:00:00', '18:30:00');
insert into  ScheduleTable (StoreID, OpenWeekDay, CloseWeekDay, OpenWeekEnd, CloseWeekEnd)values (2, '09:00:00', '20:00:00', '11:00:00', '19:00:00');
insert into  ScheduleTable (StoreID, OpenWeekDay, CloseWeekDay, OpenWeekEnd, CloseWeekEnd)values (15, '09:00:00', '19:00:00', '09:00:00', '18:30:00');
insert into  ScheduleTable (StoreID, OpenWeekDay, CloseWeekDay, OpenWeekEnd, CloseWeekEnd)values (4, '10:00:00', '21:00:00', '11:00:00', '23:00:00');
insert into  ScheduleTable (StoreID, OpenWeekDay, CloseWeekDay, OpenWeekEnd, CloseWeekEnd)values (3, '09:00:00', '19:00:00', '09:00:00', '18:30:00');
insert into  ScheduleTable (StoreID, OpenWeekDay, CloseWeekDay, OpenWeekEnd, CloseWeekEnd)values (6, '10:00:00', '20:00:00', '11:00:00', '20:00:00');
insert into  ScheduleTable (StoreID, OpenWeekDay, CloseWeekDay, OpenWeekEnd, CloseWeekEnd)values (8, '10:00:00', '23:00:00', '11:00:00', '23:30:00');
insert into  ScheduleTable (StoreID, OpenWeekDay, CloseWeekDay, OpenWeekEnd, CloseWeekEnd)values (9, '09:00:00', '19:00:00', '10:00:00', '18:00:00');
insert into  ScheduleTable (StoreID, OpenWeekDay, CloseWeekDay, OpenWeekEnd, CloseWeekEnd)values (11, '05:30:00', '20:00:00', '07:00:00', '19:00:00');
insert into  ScheduleTable (StoreID, OpenWeekDay, CloseWeekDay, OpenWeekEnd, CloseWeekEnd)values (13, '09:00:00', '23:00:00', '11:00:00', '21:30:00');


#populate orders
insert into Orders (OrderID, Subtotal, CustomerID, OrderTime) values (1, 450.76,'C627', '10:23:07');
insert into Orders (OrderID, Subtotal, CustomerID, OrderTime) values (2, 234.34, 'C585', '23:12:22');
insert into Orders (OrderID, Subtotal, CustomerID, OrderTime) values (3, 23.76, 'C422','09:12:00');
insert into Orders (OrderID, Subtotal, CustomerID, OrderTime) values (4, 546.00, 'C302', '16:45:09');
insert into Orders (OrderID, Subtotal, CustomerID, OrderTime) values (5, 107.28, 'C302', '17:08:34');
insert into Orders (OrderID, Subtotal, CustomerID, OrderTime) values (6, 78.90, 'C937','01:33:21');
insert into Orders (OrderID, Subtotal, CustomerID, OrderTime) values (7, 233.06, 'C611', '10:00:34');
insert into Orders (OrderID, Subtotal, CustomerID, OrderTime) values (8, 109.67, 'C652', '14:09:08');
insert into Orders (OrderID, Subtotal, CustomerID, OrderTime) values (9, 89.97, 'C937', '15:41:54');
insert into Orders (OrderID, Subtotal, CustomerID, OrderTime) values (10, 29.81, 'C596', '12:56:09');
insert into Orders (OrderID, Subtotal, CustomerID, OrderTime) values (11, 340.03, 'C652', '23:12:22');
insert into Orders (OrderID, Subtotal, CustomerID, OrderTime) values (12, 44.00, 'C985', '04:06:52');


#populate payment
insert into Payment (OrderID, CustomerID, CashierID, PaymentTime, PaymentMethod, Amount) values (1,'C627', 'E314','10:23:56', 'Card', 466.76);
insert into Payment (OrderID, CustomerID, CashierID, PaymentTime, PaymentMethod, Amount) values (2, 'C585', 'E321', '23:12:45', 'Cash', 245.00);
insert into Payment (OrderID, CustomerID, CashierID, PaymentTime, PaymentMethod, Amount) values (3,'C422','E187','09:12:23','Card', 24.34);
insert into Payment (OrderID, CustomerID, CashierID, PaymentTime, PaymentMethod, Amount) values (4,'C302', 'E981', '16:45:29', 'Cash', 556.00);
insert into Payment (OrderID, CustomerID, CashierID, PaymentTime, PaymentMethod, Amount) values (5, 'C302', 'E002', '17:10:08', 'Card', 109.02);
insert into Payment (OrderID, CustomerID, CashierID, PaymentTime, PaymentMethod, Amount) values (6, 'C937', 'E658', '01:35:01', 'Card',  80.31);
insert into Payment (OrderID, CustomerID, CashierID, PaymentTime, PaymentMethod, Amount) values (7, 'C611', 'E859', '10:04:04', 'Card', 234.25);
insert into Payment (OrderID, CustomerID, CashierID, PaymentTime, PaymentMethod, Amount) values (8, 'C652', 'E002', '14:09:56', 'Card', 111.15);
insert into Payment (OrderID, CustomerID, CashierID, PaymentTime, PaymentMethod, Amount) values (9, 'C937', 'E748', '15:41:58', 'Cash', 92.07);
insert into Payment (OrderID, CustomerID, CashierID, PaymentTime, PaymentMethod, Amount) values (10,'C596', 'E005', '12:58:34', 'Cash', 30.97);
insert into Payment (OrderID, CustomerID, CashierID, PaymentTime, PaymentMethod, Amount) values (11,'C652', 'E406', '23:14:11', 'Card', 351.28);
insert into Payment (OrderID, CustomerID, CashierID, PaymentTime, PaymentMethod, Amount) values (12, 'C985', 'E422', '04:23:12', 'Card', 47.75);

#populate products
insert into Product (OrderID, StoreID, ProductID, ProductName, Price, DescriptionP, Quantity) values (1,10,456,'Matte FENTY Foundation', 41.00, 'A matte medium coverage foundation', 2);
insert into Product (OrderID, StoreID, ProductID, ProductName, Price, DescriptionP, Quantity) values (2,13,194,'Replica Beach Walk Perfume', 96.00, 'Eau de Parfum with notes of Lily', 2);
insert into Product (OrderID, StoreID, ProductID, ProductName, Price, Quantity) values (3,7,23,'Large Cheese Pizza', 23.00, 1);
insert into Product (OrderID, StoreID, ProductID, ProductName, Price, DescriptionP, Quantity) values (4,10,43,'Rose Lip Oil Dior', 65.00, 'Hydrating lip oil in a pink shade', 6);
insert into Product (OrderID, StoreID, ProductID, ProductName, Price, DescriptionP, Quantity) values (7,15,336,'Black Floral Dress', 227.00, 'Floor length silk a-line dress', 1);
insert into Product (OrderID, StoreID, ProductID, ProductName, Price, DescriptionP, Quantity) values (5,9,26,'Stay Palette', 21.00, 'A matte medium coverage foundation', 4);
insert into Product (OrderID, StoreID, ProductID, ProductName, Price, DescriptionP, Quantity) values (6,5,17,'High Top Sneakers', 65.00, 'Red Air Force Style', 1);
insert into Product (OrderID, StoreID, ProductID, ProductName, Price, Quantity) values (8,3,16,'UBC Charger', 55.00, 1);
insert into Product (OrderID, StoreID, ProductID, ProductName, Price, Quantity) values (8,3,123,'32GB USB', 10.00, 3);
insert into Product (OrderID, StoreID, ProductID, ProductName, Price, DescriptionP, Quantity) values (9,11,208,'Mocha Frappe', 8.00, 'Mocha and Coffee blended with Ice', 5);
insert into Product (OrderID, StoreID, ProductID, ProductName, Price, DescriptionP, Quantity) values (9,11,210,'Caramel Frappe', 8.00, 'Caramel and Coffee blended with Ice', 1);
insert into Product (OrderID, StoreID, ProductID, ProductName, Price, Quantity) values (10,6,45,'Call of Duty Zombie', 23.00, 1);
insert into Product (OrderID, StoreID, ProductID, ProductName, Price, DescriptionP, Quantity) values (11,14,217,'Data Structures for CS', 165.00, '3rd edition', 2);
insert into Product (OrderID, StoreID, ProductID, ProductName, Price, DescriptionP, Quantity) values (12, 8,300, 'Cheeseburger', 12.00, 'A smash burger with american cheese and onions', 3);


#view for most popular product
CREATE VIEW PopularProduct AS 
	SELECT Product.ProductID, Product.ProductName, SUM(Product.Quantity) AS TotalSales 
	FROM Product
	INNER JOIN Orders ON Product.OrderID = Orders.OrderID
	WHERE Orders.OrderTime >= DATE_SUB(NOW(), INTERVAL 1 MONTH)
	GROUP BY Product.ProductID
	ORDER BY TotalSales DESC
	LIMIT 1;
    
select * from PopularProduct;


CREATE VIEW GoldStore AS
 SELECT Store.StoreID, Store.StoreName, COUNT(DISTINCT Orders.CustomerID) AS TotalCustomers
	FROM Store
	INNER JOIN Product ON Store.StoreID = Product.StoreID
	INNER JOIN Orders ON Product.OrderID = Orders.OrderID
	WHERE Orders.OrderTime >= DATE_SUB(NOW(), INTERVAL 1 MONTH)
	GROUP BY Store.StoreID
	ORDER BY TotalCustomers DESC
    limit 1;
    
    select * from GoldStore;
    
    CREATE VIEW Top_Quarter_Cashier AS
		SELECT p.CashierID as CashierID, COUNT(p.OrderID) as OrdersProccessed, c.Fname, c.Mname, c.Lname
		FROM Payment p, Person c
        Where p.CashierID = c.ID
		GROUP BY CashierID
		ORDER BY OrdersProccessed DESC
		LIMIT 1;
        
	select * from Top_Quarter_Cashier;


#getting employees and employee types and average salary
SELECT e.JobType, COUNT(e.EmployeeID) AS NumberOfEmployees, Round(AVG(e.Salary), 2) AS AverageSalary
FROM Employee e
JOIN Person p ON e.EmployeeID = p.ID
GROUP BY e.JobType;

#average orders
SELECT AVG(OrderCount) AS AverageOrders
FROM (
	SELECT Count(OrderID) AS OrderCount, CustomerID As CustomerID
	FROM Orders
	GROUP BY CustomerID
)AS OrderCountsByCustomer;

#get customer id of whoever purchased the popular product
SELECT CustomerID
FROM Orders
WHERE(Orders.OrderID =
	(SELECT P.OrderID
	FROM PopularProduct PP, Product P
	WHERE PP.ProductID = P.ProductID)
);

#store with most distinct products 
SELECT StoreID
FROM Product
GROUP BY StoreID
HAVING COUNT(DISTINCT ProductID) = (
	SELECT MAX(DistinctProductCount)
	FROM (
		SELECT COUNT(DISTINCT ProductID) AS DistinctProductCount
		FROM Product
		GROUP BY StoreID
	) AS DistinctProductCountsByStore
);

#select products and their information and what stores are selling it
SELECT Product.ProductID, Product.ProductName, Store.StoreID, Store.StoreName, Product.Price
FROM Product
INNER JOIN Store ON Product.StoreID = Store.StoreID
GROUP BY Product.ProductID, Store.StoreID;

#max store floors
SELECT FLoorNum, COUNT(StoreID) AS NumStores
FROM Store
GROUP BY FloorNum
ORDER BY NumStores DESC
LIMIT 1;

#goldstore timings
SELECT s.OpenWeekDay, s.CloseWeekDay, s.OpenWeekEnd, s.CloseWeekEnd
FROM ScheduleTable s, GoldStore
Where GoldStore.StoreID = s.StoreID;

#manager with most floor staff
SELECT ManagerID, COUNT(EmployeeID) AS numStaffs
FROM FloorStaff
GROUP BY ManagerID
Order BY numStaffs DESC
LIMIT 1;

#most sales
Select StoreID, StoreName
From(
	Select p.StoreID, Count(p.OrderID) as NumSales, s.StoreName
	From Product p, Store s
	Where p.StoreID = s.StoreID
	Group BY p.StoreID
	Order By NumSales DESC
	Limit 1) As Sales;


#employee who managed all floors
SELECT FloorLog.M
FROM FloorLog
WHERE FloorLog.M IN (
	SELECT FloorLog.T 
	FROM FloorLog
	WHERE FloorLog.T IN(
		SELECT FloorLog.W 
        FROM FloorLog
        WHERE FloorLog.W IN(
			SELECT FloorLog.TH
            FROM FloorLog
            WHERE FloorLog.TH IN(
				SELECT FloorLog.F
                FROM FloorLog
                WHERE FloorLog.F IN(
					SELECT FloorLog.SAT
                    FROM FloorLog
                    WHERE FloorLog.SAT IN(
						SELECT FloorLog.SUN
                        FROM FloorLog))))));
        


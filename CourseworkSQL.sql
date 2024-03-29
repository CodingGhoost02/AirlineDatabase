use coursework;
/*
Student name:Mohammad Faisal               
Student username:  adgj374           
*/

/* SECTION 1 - CREATE TABLE STATEMENTS */
create table adgj374_Passenger(Passenger_ID int  auto_increment key not null,
first_name char(20) not null,
last_name char(20) not null,
passport_number varchar(20) not null,
phone_number int not null);

CREATE TABLE adgj374_Airline(Airlines_Code VARCHAR(5) PRIMARY KEY, AirlinesName CHAR(10) NOT NULL);



create table adgj374_Airports(AirportCode varchar(5) primary key, AirportName char(255) not null, City char(255) not null,Country char(255) not null);



CREATE TABLE adgj374_Flights(FlightNumber INT PRIMARY KEY, 
DepartureCode varchar(5),
ArrivalCode varchar(5) ,
ArrivalDate int(6) not null,
DepartureDate int(6) not null,
AirlineCode varchar(5),
 FOREIGN KEY (DepartureCode) REFERENCES adgj374_Airports(AirportCode),
    FOREIGN KEY (ArrivalCode) REFERENCES adgj374_Airports(AirportCode),
    FOREIGN KEY (AirlineCode) REFERENCES adgj374_Airline(Airlines_Code));
  
  
CREATE TABLE adgj374_Bookings (
BookingID INT AUTO_INCREMENT PRIMARY KEY,
    FlightNumber int,
    PassengerID INT,
    BookingDate integer(6) NOT NULL,
    SeatNumber VARCHAR(10) NOT NULL,
    FOREIGN KEY (FlightNumber) REFERENCES adgj374_Flights(FlightNumber),
    FOREIGN KEY (PassengerID) REFERENCES adgj374_Passenger(Passenger_ID)
);


CREATE TABLE  adgj374_Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate integer(6) NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES adgj374_Bookings(BookingID)
    );
    

 





/* SECTION 2 - INSERT STATEMENTS */
INSERT INTO adgj374_Passenger VALUES(48237,"Olivia","Smith", 38592774106,41578912345),
(74918,"Ethan","Johnson",6921485037,20245678901 ),
(62105,"Sophia","Williams",6921485037,71389023456),
(89342,"Jackson","Brown",4502987613,91734567890),
(15678,"Ava","Davis",1635978240,60256789012),
(30459,"Ava","Garcia",7491083265,30567890123),
(82014,"Ava","Rodriguez",2058341976,81789012345),
(93567,"Aiden","Martinez",6314729850,40890123456),
(40728,"Mia","Jackson",8942065137,31234567890),
(56291,"Lucas","White",5723164890,50345678901),
(18954,"Harper","Taylor",1069357248,61556789012),
(67320,"Noah","Anderson",2847613905,70467890123);

INSERT INTO adgj374_Airline VALUES ('AA', 'American Airlines'),
('DL', 'Delta Air Lines'),
 ('UA', 'United Airlines'),
 ('BA', 'British Airways'),
 ('LH', 'Lufthansa'),
 ('AF', 'Air France'),
 ('SQ', 'Singapore Airlines'),
 ('EK', 'Emirates'),
 ('QF', 'Qantas'),
 ('TK', 'Turkish Airlines'),
 ('CX', 'Cathay Pacific'),
('NH', 'All Nippon Airways');

INSERT INTO  adgj374_Airports VALUES ('JFK','John F Kennedy International Airport','New York','USA'),
('LHR', 'London Heathrow Airport', 'London', 'UK'),
('SFO', 'San Francisco International Airport', 'San Francisco', 'USA'),
('CDG', 'Charles de Gaulle Airport', 'Paris', 'France'),
('ICN', 'Incheon International Airport', 'Incheon', 'South Korea'),
 ('DXB', 'Dubai International Airport', 'Dubai', 'UAE'),
 ('PEK', 'Beijing Capital International Airport', 'Beijing', 'China'),
 ('AMS', 'Amsterdam Airport Schiphol', 'Amsterdam', 'Netherlands'),
 ('MEX', 'Mexico City International Airport', 'Mexico City', 'Mexico'),
('IST', 'Istanbul Airport', 'Istanbul', 'Turkey'),
('DEL', 'Indira Gandhi International Airport', 'Delhi', 'India'),
('SYD', 'Sydney Kingsford Smith Airport', 'Sydney', 'Australia');

/* DATE IS IN THE FORMAT DDMMYY */

INSERT INTO adgj374_Flights VALUES (34567,'LHR','JFK',221223,211223,'DL'),
(78910,'MEX','JFK',010323,010323,'UA'),
(21356,'JFK','LHR',251222,241222,'LH'),
(31256,'DEL','LHR',030921,020921,'BA'),
(90126,'IST','JFK',010120,311219,'AF'),
(80564,'SFO','MEX',031015,021015,'SQ'),
(54698,'ICN','CDG',010319,010319,'EK'),
(12650,'CDG','LHR',020518,020518,'SQ'),
(11002,'SYD','PEK',021123,011123,'TK'),
(56892,'DXB','DEL',201023,201023,'CX'),
(74569,'DEL','JFK',221122,211122,'NH'),
(98745,'ICN','JFK',020219,010219,'DL');


INSERT INTO adgj374_Bookings VALUES(2112,98745,48237,010119,'25A'),
(3113,74569,74918,011022,'32A'),
(4114,56892,62105,300923,'01B'),
(5115,11002,89342,010923,'40E'),
(8118,12650,15678,010318,'40F'),
(9119,54698,30459,010219,'36E'),
(6116,80564,82014,020915,'10F'),
(7117,31256,93567,020821,'11E'),
(1001,90126,40728,011219,'35F'),
(1111,21356,56291,241122,'36E'),
(9218,78910,18954,010223,'37A'),
(1028,34567,67320,211123,'39D');
/* The prices are in $ */
INSERT INTO adgj374_Payments VALUES(01,2112,950,010119),
(02,3113,750,011022),
(03,4114,250,300923),
(04,5115,1100,010923),
(05,8118,183,010318),
(06,9119,600,010219),
(07,6116,900,020915),
(08,7117,600,020821),
(09,1001,650,011219),
(10,1111,580,241122),
(11,9218,500,010223),
(12,1028,800,211123);

                    
/* SECTION 3 - UPDATE STATEMENTS */
UPDATE adgj374_Passenger SET last_name = 'Thompson' where passport_number=38592774106;
UPDATE adgj374_Bookings SET SeatNumber='26A' WHERE BookingID=1111;




/* SECTION 4 - SINGLE TABLE SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs*/

/* 1) Retrieve information on flights where either the departure or arrival airport is London Heathrow Airport (LHR)*/

SELECT * FROM adgj374_Flights WHERE DepartureCode='LHR' or ArrivalCode='LHR';

/* 
2) Calculates the average payment amount made for bookings.

*/

SELECT AVG(Amount) AS AveragePayment FROM adgj374_Payments;

/* 
3)Retrieves the information about Flights where the airline code is 'DL'

*/
SELECT * FROM adgj374_Flights WHERE AirlineCode='DL';


/* 
4) List the details of all customers whose first names starts with 'A'
  

*/

SELECT * FROM adgj374_Passenger WHERE first_name like 'A%';


/* 
5)  Lists all the Airports in USA

*/
SELECT * FROM adgj374_Airports WHERE Country='USA';


/* 
6)  List all the information of flights taking off in 2023

*/
SELECT * FROM adgj374_Flights WHERE DepartureDate like '%23';



/* SECTION 5 - MULTIPLE TABLE SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs */


/* 
1)  

*/



/* 
2)  

*/



/* 
3)  

*/


 

/* 
4)  

*/



/* 
5)  

*/




/* 
6)  

*/



/* SECTION 6 - DELETE ROWS (make sure the SQL is commented out in this section)
DELETE FROM adgj374_Passenger WHERE first_name='Ava' && last_name='Garcia';
DELETE FROM adgj374_Flights WHERE DepartureCode='LHR';



*/

/* SECTION 7 - DROP TABLES (make sure the SQL is commented out in this section)



*/

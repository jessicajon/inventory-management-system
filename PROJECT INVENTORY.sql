CREATE TABLE Company (
    Company_ID INT PRIMARY KEY,
    Company_Name VARCHAR(100)
);

insert into Company Values(001, 'Pantene');
insert into Company Values(202, 'Kellogs');
insert into Company Values(305, 'Parle');
insert into Company values(220, 'Samsung');
insert into Company values (101, 'Puma');
Transaction_ID

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(200),
    Recieved_Amt INT,
    Shipped_Amt INT,
    On_Hand INT,
    Price_per_piece INT,
    Minimum_Stock INT,
    Company_ID INT,
    FOREIGN KEY (Company_ID)
        REFERENCES Company (Company_ID)
);
INSERT INTO Product VALUES(10, 'Pantene Lively Clean Shampoo',2500, 500, 2000, 190, 100, 001);
INSERT INTO Product VALUES(11, 'Pantene Anti-Dandruff Shampoo',1260, 100, 11600, 195, 100, 001);
INSERT INTO Product VALUES(12, 'Pantene Anti-Dandruff Conditioner',1000, 200, 800, 100, 100, 001);
INSERT INTO Product VALUES(22, 'Kelloggs Corn Flakes',200, 90, 110, 100, 100, 202);
INSERT INTO Product VALUES(25, 'Kelloggs Chocos',800, 250, 550, 125, 100, 202);
INSERT INTO Product VALUES(33, 'Parle G',1450, 700, 750, 10, 500, 305);
INSERT INTO Product VALUES(35, 'Hide & Seek',1200, 600, 600, 25, 500, 305);
INSERT INTO Product VALUES(44, 'Samsung Galaxy A53',750, 250, 500, 25000 , 60, 220);
INSERT INTO Product VALUES(45, 'Samsung M31',775, 350, 550, 475, 60, 220);
INSERT INTO Product VALUES(110, 'Unisex Solid Baseball Cap',400, 250, 650, 400, 50, 101);
INSERT INTO Product VALUES(113, 'Shoulder Bag',200, 250, 450, 489, 50, 101);



CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    First_Name VARCHAR(200),
    Middle_Name VARCHAR(200),
    Last_Name VARCHAR(200),
    Contact_Number INT,
    Email VARCHAR(200),
    Address VARCHAR(200) UNIQUE
);
INSERT INTO Customer VALUES (4,'Hayley', 'T.', 'Meyer',165325,'hay80@google.edu', '570 8156 Ultricies St.');
INSERT INTO Customer VALUES (18,'Margaret', 'H.', 'Durham',15153188,'margaam156@outlook.com','Ap Vitae Street');
INSERT INTO Customer VALUES (86,'Cassidy', 'A.', 'Finley',2193323,'cassidy@hotmail.ca','9380 Adipiscing Road');
INSERT INTO Customer VALUES (10,'Dominique','W.', 'Cote',16194357,'dominie@yahoo.edu','Ap Cras Rd.');
INSERT INTO Customer VALUES (27,'Lyle', 'F.', 'Hoffman',11323244,'lylefh25@hotmail.com','824-Dis St.');


CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Product_ID INT,
    Delivery_Date DATE,
    Customer_ID INT,
    FOREIGN KEY (Product_ID)
        REFERENCES Product (Product_ID),
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer (Customer_ID)
);
INSERT INTO ORDERS VALUES(23,11,'01-JAN-2022',86);
INSERT INTO ORDERS VALUES(24,22,'01-FEB-2022',86);
INSERT INTO ORDERS VALUES(25,110,'01-MARCH-2022',86);
INSERT INTO ORDERS VALUES(26,45,'01-APRIL-2022',86);
INSERT INTO ORDERS VALUES(27,44,'01-JAN-2022',86);
INSERT INTO ORDERS VALUES(28,44,'01-APRIL-2022',86);
INSERT INTO ORDERS VALUES(29,33,'01-MARCH-2022',86);
INSERT INTO ORDERS VALUES(30,11,'01-JAN-2022',86);


CREATE TABLE Bill (
    Transaction_ID INT PRIMARY KEY,
    Order_ID INT,
    Date_of_payment DATE,
    Mode_of_payment VARCHAR(200),
    Total_price INT,
    Customer_ID INT,
    FOREIGN KEY (Order_ID)
        REFERENCES Orders (Order_ID),
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer (Customer_ID)
);
INSERT INTO BILL VALUES(1234,23,'25-DEC-2021','Cash on Delivery',250,86);
INSERT INTO BILL VALUES(1235,24,'26-DEC-2021','UPI',100,18);
INSERT INTO BILL VALUES(1236,25,'27-DEC-2021','Cash on Delivery',399,10);
INSERT INTO BILL VALUES(1237,26,'28-DEC-2021','Net Banking',250,27);
INSERT INTO BILL VALUES(1238,27,'29-DEC-2021','DEBIT',2999,4);
INSERT INTO BILL VALUES(1241,28,'30-DEC-2021','UPI',750,86);
INSERT INTO BILL VALUES(1242,29,'31-DEC-2021','UPI',5000,86);
INSERT INTO BILL VALUES(1243,30,'24-DEC-2021','Cash on Delivery',250,10);


CREATE TABLE Shipment (
    Tracking_number INT Primary key,
    Address VARCHAR(200),
    Dispatch_date DATE,
    Delivered_date DATE,
    Order_ID INT,
    Delivery_Agency VARCHAR(200),
    FOREIGN KEY (Order_ID)
        REFERENCES Orders (Order_ID),
    CONSTRAINT FK_CustomerAddress FOREIGN KEY (Address)
    REFERENCES Customer(Address)
);
select * from shipment;
INSERT INTO SHIPMENT VALUES(999,'570 8156 Ultricies St.','31-DEC-2021','01-JAN-2022',23,'Shiprocket');
INSERT INTO SHIPMENT VALUES(1010,'Ap Vitae Street','31-DEC-2021','01-FEB-2022',24,'Blue Dart');
INSERT INTO SHIPMENT VALUES(2020,'570 8156 Ultricies St.','31-DEC-2021','01-MARCH-2022',25,'FedEX');
INSERT INTO SHIPMENT VALUES(3030,'9380 Adipiscing Road','31-DEC-2021','01-APRIL-2022',26,'Delhivery');
INSERT INTO SHIPMENT VALUES(4040,'Ap Cras Rd.','31-DEC-2021','01-JAN-2022',27,'Shiprocket');
INSERT INTO SHIPMENT VALUES(5050,'Ap Cras Rd.','31-DEC-2021','01-APRIL-202',28,'Bluedart');
INSERT INTO SHIPMENT VALUES(6060,'824-Dis St.','31-DEC-2021','01-MARCH-2022',29,'FedEx');
INSERT INTO SHIPMENT VALUES(7070,'Ap Vitae Street','31-DEC-2021','01-JAN-2022',30,'Delhivery');


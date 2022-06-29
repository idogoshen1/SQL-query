
-- סעיף א
Create table Supplier
(sid          int,
 sname        varchar (30),
 address      varchar (50),
 phone        numeric(9,0),
 primary key (sid));

Create table Product
 (code       int,
  pname      varchar (30),
  descr      varchar (50),
  utype      varchar (30),
  uprice     float,
  manu       varchar (30),
  sid        int,
  primary key (code),
  Foreign key (sid) references Supplier(sid));

Create table Brunch
(bid         int,
 bname       varchar (30),
 baddress    varchar (50),
 primary key (bid));

Create table Stock
(code         int, 
 bid          int, 
 units        float,
 primary key (code, bid),
 Foreign key (code) references Product,
 Foreign key (bid) references Brunch);
 
 Create table Receipt 
(bid          int,
 rdate        date,
 rtime        time,
 ptype        varchar (30),
 total        float DEFAULT 0,
 primary key (bid, rdate, rtime),
 Foreign key (bid) references Brunch);

 Create table Purchase
(bid          int,
 rdate        date,
 rtime        time,
 code         int,
 units        float,
 primary key (bid, rdate, rtime, code),
 Foreign key (bid,rdate, rtime) references Receipt(bid,rdate, rtime),
 Foreign key (code) references Product);
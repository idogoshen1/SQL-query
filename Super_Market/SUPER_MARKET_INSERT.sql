

-- סעיף ג
insert into supplier values
(111,	'Supplier1',	'Lishansky 1 tel aviv'	,123456789),
(222,	'Supplier2',	'Barbar 2 jerusalem',234567890),
(333,	'Supplier3',	'Beit 3 Kfar Saba',	122122122);
 insert into Product values
 (123, 'Tomatoes', 'Vegetable','Kg', 6.99, 'manufacturer1', 111),
 (234, 'Cucumbers', 'Vegetable', 'Kg', 3.99, 'manufacturer2', 222),
 (345, 'Cornflakes', 'Cornflakes', 'Box', 17.9, 'manufacturer3', 333);
insert into Brunch values
 (999, 'tel aviv', 'Lishansky 1 tel aviv'),
 (888, 'jerusalem', 'Barbar 2 jerusalem'),
 (777, 'Kfar Saba', 'Beit 3 Kfar Saba');
 insert into Stock values
 (123, 999, 50),
 (234, 888, 75),
 (345, 777, 100);
insert into Receipt values
(999, date '18-3-2020',time '22:17:02', 'Cash', 1234),
(888,date '16-7-2020',time '22:18:49', 'Credit', 2345),
(777,date '15-7-2020' ,time '22:18:49', 'Pay Pal', 3456);
insert into Purchase values
(999,date '18-3-2020' , time '22:17:02' , 123, 5),
(888,date '16-7-2020',time '22:18:49', 345, 23),
(777, date '15-7-2020' , time '22:18:49' ,234, 4);
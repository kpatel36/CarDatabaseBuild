-- CAR DEALERSHIP ERD
-- LEVEL 1 TABLES: 
	-- SALESPERSON - salesperson_id, first_name, last_name
	-- CAR - car_id,vin, make, model, color, yr, 
	-- PART INVENTORY - parts_id, part_name, brand
	-- MECHANICS - mechanic_id, first_name, last_name
-- LEVEL 2 TABLES 
	-- INVOICE - invoice_id, car_id, salesperson_id, invoice_date, price
	-- CUSTOMER - customer_id, car_id, first_name, last_name, email, phone
	-- SERVICE TICKET - service_id, car_id, parts_id, service_date, service_done, price
-- LEVEL 3 TABLES 
	-- MECHANICS SERVICE - service_id, mechanic_id

-- table 2/8 - car (car_id, vin, make, model, color, year, vehicle_type)
-- table 3/8 - part_inventory (part_id, part_name, brand)
-- table 4/8 - mechanics (mechanic_id, first_name, last_name)
-- table 5/8 - invoice (invoice_id, car_id, salesperson_id, invoice_date, price)
-- table 6/8 - customer (customer_id, car_id, first_name, last_Name, email, phone)
-- table 7/8 - service_ticket (service_id, car_id, parts_id, service_date, service_door, price)
-- table 8/8 - mechanics_service - service_id, mechanic_id

create table salesperson(
	salesperson_id serial primary key,
	first_name varchar(100) not null ,
	last_name varchar(100) not null
);

select * from salesperson;

create table car(
	car_id serial primary key, 
	make varchar (120),
	vehicle_type varchar(20),
	model varchar(120),
	color varchar(120),
	year char (4),
	VIN varchar(22)
);

select * from car;

create table parts_inventory( 
	part_id serial primary key,
	part_name varchar(120), 
	brand varchar (120)
);

select * from parts_inventory;

create table mechanics(
	mechanic_ID serial primary key, 
	first_name varchar (120) not null, 
	last_name varchar(120) not null
	);
	
select * from mechanics;

create table invoice(
	invoice_id serial primary key,
	car_id integer,
	foreign key (car_id) references car(car_id),
	salesperson_id integer,
	foreign key (salesperson_id) references salesperson(salesperson_id),
	invoice_date date not null, 
	price numeric (8,2)
);

select* from invoice;
	
create table customer (
	customer_id serial primary key,
	car_id integer,
	foreign key (car_id) references car(car_id),
	first_name varchar(120) not null,
	last_name varchar(120) not null,
	email varchar(120),
	address varchar(120),
	city varchar(120),
	state varchar(10),
	zip char (5),
	phone varchar(20)
);

select* from customer;

create table service_ticket(
	service_id serial primary key, 
	car_id integer,
	foreign key (car_id) references car(car_id),
	part_id integer,
	foreign key (part_id) references parts_inventory (part_id), 
	service_date date not null,
	service_done varchar(120), 
	price numeric (7,2)
);

select * from service_ticket;


create table mechanics_service(
	service_id integer,
	foreign key (service_id) references service_ticket (service_id),
	mechanic_id integer,
	foreign key (mechanic_id) references mechanics(mechanic_id)
);

select * from mechanics_service;


-- adding values to SALESPERSON table (1/8)
-- 6 salespeople - Bob Currie, Dean Boland, Beth Boland, Harry Wormwood, Daniel LaRusso, Dan Scott
insert into salesperson (first_name,last_name)
values
('Bob', 'Currie'),
('Dean', 'Boland'),
('Beth', 'Boland'),
('Harry', 'Wormwood'),
('Daniel', 'LaRusso'),
('Dan', 'Scott');
select* from salesperson

-- table 2/8 - car (car_id, vin, make, model, color, yr, vehicle_type)
insert into car (vin, make, model, color, year, vehicle_type)
values 
('2G1FA1E32D9232987', 'Chevrolet', 'Camaro', 'Navy', 2013, 'Coupe'),
('2G11Z5S36K9105121', 'Chevrolet', 'Impala', 'Blue', 2019, 'Sedan'),
('SALYB2EX4LA242236', 'Land-Rover', 'Range Rover Velar', 'Gray', 2020, 'SUV'),
('WAUB8GFF9G1078133', 'Audi', 'A3', 'Silver', 2016, 'Sedan'),
('KMHRB8A38LU028124', 'Hyundai', 'Venue', 'Black', 2020, 'SUV'),
('2GNALBEK8E6191123', 'Chevrolet', 'Equinox', 'Red', 2022, 'SUV'),
('WAUANAF46HN024505', 'Audi', 'A4', 'Silver', 2017, 'Sedan'),
('2C3CCAEGXHH662133', 'Chrysler', '300', 'Silver', 2017,'Sedan'),
('1G1ZD5ST7KF180231', 'Chevrolet', 'Malibu', 'Black', 2019, 'Sedan'),
('JA4AZ3A38LZ036540', 'Mistubishi', 'Outlander', 'Blue', 2020, 'SUV'),
('1G1ZC5ST5LF001211', 'Chevrolet', 'Malubu', 'Silver', 2020, 'Sedan'),
('SALWG2RK5KA419457', 'Land Rover', 'Range Rover Sport', 'Black', 2018, 'SUV'),
('1C4PJMCBXKD288003', 'Jeep', 'Cherokee', 'White', 2019, 'SUV'),
('KNDJ23AU0L7119852', 'Kia', 'Soul', 'Black', 2020, 'Wagon'),
('1C6SRFJT3MN687133', 'Ram', '2500', 'Burgundy', 2021, 'Truck'),
('2G1FB3D37E9162616', 'Chevrolet', 'Camaro', 'Blue', 2019, 'Convertible'),
('KMHH35LE3KU102215', 'Hyundai', 'Elantra GT', 'Blue', 2020, 'Hatchback'),
('WBALM5C52BE378131', 'BMW', 'X4', 'Blue', 2015, 'Convertible'),
('1GC4YNE78LF347711', 'Chevrolet', 'Silverado 2500 HD Crew Cab', 'Red', 2019, 'Truck'),
('ML32AUHJ0MH001154', 'Mitsubishi', 'Mirage', 'Red', 2021, 'Hatchback'),
('KMHH35LE8KU097285', 'Hyundai', 'Elantra GT', 'White', 2020, 'Hatchback');
select* from car;

-- table 3/8 - part_inventory (part_id, part_name, brand)
insert into parts_inventory (part_name, brand)
values
('Brake Pads', 'Duralast'),
('Wiper Blades - 22 inch (2 pack)', 'Bosch'),
('Wiper Blades - 20 inch (2 pack)', 'Bosch'),
('Wiper Blades - 24 inch (2 pack)', 'Bosch'),
('Battery Size 24f', 'Duralast'),
('Battery Size 35H', 'Duralast'),
('Battery Size 27f', 'Duralast'),
('Universal Alternator', 'Duralast'),
('Universal Alternator with Internal Regulator', 'Proform'),
('Air Filter Type 1', 'STP'),
('Air Filter Type 2', 'STP'),
('Air Filter Type 3', 'STP'),
('Extended Life Oil Filter 1', 'STP'),
('Extended Life Oil Filter 2', 'STP'),
('Extended Life Oil Filter 3', 'STP'),
('Belt and Pulley Kit 1', 'Duralast'),
('Belt and Pulley Kit 2', 'Duralast'),
('Engine Oil High Mileage Conventional, 1 Qt', 'STP'),
('Dexron Automatic Transmission Fluid, 1 Qt', 'STP');

select * from parts_inventory 

-- table 4/8 - mechanics (mechanic_id, first_name, last_name)
insert into mechanics(first_name, last_name)
values 
('Dominic', 'Toretto'),
('Brian', 'O''Connor'),
('Happy', 'Quinn'),
('Gypsy', 'Gilmore'),
('Keith', 'Scott');
select* from mechanics; 


-- table 5/8 - invoice (invoice_id, car_id, salesperson_id, invoice_date, price)
insert into invoice(car_id, salesperson_id, invoice_date,price)
values
(1,5,'2021-11-15', 25000),
(2,4, '2021-11-15', 23990),
(3,2, '2021-11-15', 66000),
(4,2, '2021-11-15', 22000),
(5,4, '2021-11-15', 25990),
(11,1, '2021-11-15', 24990),
(12,3, '2021-11-15', 66990),
(13,1, '2021-11-15', 23450),
(14,2, '2021-11-16', 22490),
(15,3, '2021-11-16', 66990);

-- table 6/8 - customer (customer_id, car_id, first_name, last_Name, email, phone)
insert into customer(car_id, first_name, last_name, email, address, city, state, zip, phone)
values
(1, 'Hector', 'Calderon', 'hcalderon@spyzone.com', '3233 La Cienga Blvd', 'Echo Park', 'CA', '90255', '1-914-454-8165'),
(2, 'Ken', 'Adams', 'kadams@aol.com', '34234 N Cliff St.', 'Los Angeles', 'CA', '35422', '1-242-546-1546'),
(3, 'Regina', 'Phalange', 'reginap@hotmail.com', '2424 Larson Ave','Pasadena', 'CA', '14345', '1-353-523-3256'),
(4, 'Michael', 'Bluth', 'mbluth@hotmai.com', '24552 Green St', 'Glendale','CA','25523','1-423-352-5255'),
(5, 'Tobias', 'Funke', 'tfunfe@thebluemangroup.com', '2442 Ivy Ridge Rd', 'Glendale', 'CA', '1443', '1-352-235-6478'),
(6, 'Burt', 'Macklin', 'burtmacklin@aol.com', '4134 Waffle Ave.', 'Pawnee', 'CA', '92258','1-314-323-2654'),
(7, 'Charlie', 'Charles', 'charliecharles@aol.com', '2344 Echo Ave.', 'Los Angeles', 'CA', '90111', '1-424-444-1142'),
(8, 'Howard', 'Wallowitz','walowitztheastronaut@nasa.com', '1654 Euclid Ave', 'Altadena', 'CA', '24345', '1-981-143-5253'),
(9, 'Doug', 'Judy', 'pontiacbandit@aol.com', '2464 Pontiac Blvd', 'Pasadena', 'CA', '10006', '1-614-466-7894'),
(10, 'Bart', 'Barley', 'bbarley@gmail.com', '2434 Austin Ave', 'Pasadena', 'CA', '46578', '1-434-223-3245')
-- table 7/8 - service_ticket (service_id, car_id, part_id, service_date, service_door, price)
insert into service_ticket (car_id, part_id, service_date,  service_done, price)
values
(6, 3, '2021-11-25', 'Wiper Pads Replaced', 35),
(7, 5, '2021-11-25', 'Battery Replacement', 135),
(8, 1, '2021-11-25', 'Brake Pad Replacement', 35),
(9, 6, '2021-11-26', 'Battery Replacement', 125),
(10,4, '2021-11-26', 'Wiper Blade Replacement', 25);
select* from service_ticket


insert into customer(car_id, first_name, last_name, email, address, city, state, zip, phone)
values
(11, 'Sharon', 'Oswald', 'soswald@aol.com', '1546 Magnolia Ave', 'Altadena', 'CA', '45466', '1-914-464-2667'),
(12, 'Matthew', 'Roberts','mroberts45@gmail.com', '1433 Lavender Lane', 'Butler', 'CA', '96488', '1-556-312-7984'),
(13, 'Cal', 'Newport', null, '154 Harlem Ave', 'Brayburn', 'CA', '92461', '1-972-641-6544');

insert into service_ticket (car_id, part_id, service_date,  service_done, price)
values
(17, 12, '2021-11-26', '2021-11-26', 35), --'Air Filter Replaced'
(14, 13, '2021-11-26', '2021-11-26', 175), --'Alternator Replacement'
(15, 1, '2021-11-27', '2021-11-27', 35), -- 'Brake Pad Replacement'
(20, null, '2021-11-27', '2021-11-27', 45); -- 'Tire Rotation, Brake Inspection'

-- data type for service_ticket.service_corrected from data type date to varchar
update service_ticket set service_done = 'Air Filter Replacement' where service_id = '6';
update service_ticket set service_done = 'Alternator Replacement' where service_id = '7';
update service_ticket set service_done = 'Brake Pad Replacement' where service_id = '8';
update service_ticket set service_done = 'Tire Rotation, Brake Inspection' where service_id = '9';
select* from service_ticket 

insert into invoice (car_id, salesperson_id, invoice_date, price)
values 
(18, 5, '2021-11-27', 32990),
(19, 3, '2021-11-27', 56550),
(21, 3, '2021-11-28', 23990);

insert into car(vin, make, model, color, year, vehicle_type)
values
('KM8J2CA44LU227456', 'Hyundai', 'Tucson', 'Red', 2020, 'SUV'),
('5NMJF3AE9NH001800', 'Hyundai', 'Santa Fe', 'Gray', 2021, 'SUV'),
('KM8K62AA6MU628615', 'Hyundai', 'Kona', 'Green', 2021, 'SUV'),
('KM8J2CA44LU227564', 'Hyundai', 'Elantra', 'Silver', 2021, 'Sedan')


insert into customer(car_id, first_name, last_name, email, address, city, state, zip, phone)
values
(14, 'Robin', 'Sparkles', 'letsgotothemall@aol.com', '3545 Canada Way', 'Los Angeles', 'CA', '90210', '1-466-154-1654'),
(15, 'Tobias', 'Funke', 'tfunfe@thebluemangroup.com', '2442 Ivy Ridge Rd', 'Glendale', 'CA', '1443', '1-352-235-6478'),
(16, 'Donna', 'Spencer', 'dspencer@gmail.com', '1564 Davis St', 'Echo Park', 'CA', '90516', '1-684-151-6540'),
(17, 'Melanie', 'Morris', 'mmorris@gmail.com', '1314 Ivy Rd', 'Glendale', 'CA', '90522','1-256-252-8097'),
(18, 'Burt', 'Macklin', 'burtmacklin@aol.com', '4134 Waffle Ave.', 'Pawnee', 'CA', '92258','1-314-323-2654'),
(19, 'Ken', 'Adams', 'kadams@aol.com', '34234 N Cliff St.', 'Los Angeles', 'CA', '35422', '1-242-546-1546'),
(21, 'Regina', 'Phalange', 'reginap@hotmail.com', '2424 Larson Ave','Pasadena', 'CA', '14345', '1-353-523-3256'),
(20, 'Fiona', 'Fancy', 'ffancy@toprealty.com', '24353 Elmdale Ave', 'Pasadena', 'CA', '90251', '1-914-151-1643'),
(22, 'Ben', 'Barnes', 'bbarnes@gmail.com', '1424 Oak Ave', 'Santa Monica', 'CA', '92593', '1-352-245-2535'),
(23, 'Godric', 'Griffin', 'ggriffin@gmail.com', '1435 Hollow Ave', 'Sherman Oaks', 'CA', '91432', '1-242-414-1478'),
(24, 'Mike', 'Ross', 'mross@hotmail.com', '2411 Elm St', 'Los Angeles', 'CA', '90145', '1-242-021-3564'),
(25, 'Nick', 'Fury', 'nfury@gmail.com', '1 Avengers Way', 'Los Angeles', 'CA', '91435', '1-975-154-2654');
-- customers from 14-25
select first_name, last_name, car.make, car.model from customer join car on customer.car_id = car.car_id 


-- assign mechanics
-- table 8/8 - mechanics_service - service_id, mechanic_id
insert into mechanics_service (service_id, mechanic_id)
values
(1,2),
(2,3),
(3,4),
(4,3),
(5,2),
(6,1),
(7,5),
(8,2);

select* from salesperson -- 6 rows added in
select* from car -- 21 cars added in
select* from parts_inventory -- 17 rows added in
select* from mechanics -- 5 rows added in
select* from invoice 
select* from customer
select* from service_ticket 
select * from mechanics_service 

select * from mechanics_service 
join service_ticket on mechanics_service.service_id = service_ticket.service_id 
join mechanics on mechanics_service.mechanic_id = mechanics.mechanic_id 

select * from service_ticket join parts_inventory on service_ticket.part_id = parts_inventory.part_id ;
select * from invoice;
select salesperson.first_name, salesperson.last_name, invoice.car_id, car.make, car.model from invoice join car on invoice.car_id = car.car_id join salesperson on invoice.salesperson_id = salesperson.salesperson_id 
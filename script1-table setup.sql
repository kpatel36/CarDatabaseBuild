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
	VIN varchar(22),
	make varchar (120),
	model varchar(120),
	color varchar(120),
	year numeric (4)
);

alter table car
add column 	vehicle_type varchar(20);

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
	car_id integer
	foreign key (car_id) references car(car_id),
	salesperson_id integer,
	foreign key (salesperson_id) references salesperson(salesperson_id),
	invoice_date date not null, 
	price numeric (8,2)
);

select* from invoice;
	
create table invoice (
	customer_id serial primary key,
	car_id integer,
	foreign key car_id references car(car_id),
	first_name varchar(120) not null,
	last_name varchar(120) not null,
	email varchar(120),
	address varchar(120),
	city varchar(120),
	state varchar(10),
	zip numeric(5),
	phone varchar(20)
);

select* from invoice;

create table service_ticket(
	service_id serial primary key, 
	car_id integer,
	foreign key car_id references car(car_id),
	part_id integer,
	foreign key part_id references parts_inventory (part_id), 
	service_date date not null,
	service_done date not null, 
	price numeric (7,2)
),

select * from service_ticket;



create table mechanics_service(
	service_id integer,
	foreign key service_id references service_ticket (service_id),
	mechanic_id integer,
	foreign key mechanic_id references mechanics(mechanic_id)
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
('Belt and Pulley Kit 2', 'Duralast');

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


-- table 6/8 - customer (customer_id, car_id, first_name, last_Name, email, phone)


-- table 7/8 - service_ticket (service_id, car_id, parts_id, service_date, service_door, price)


-- table 8/8 - mechanics_service - service_id, mechanic_id

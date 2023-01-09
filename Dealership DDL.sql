create table Car(
	car_id serial primary key,
	car_make varchar(15) not null,
	car_model varchar(20) not null,
	car_year integer not null,
	car_mileage integer not null,
	car_price numeric(8,2)
);

create table Sales_Person(
	salesman_id serial primary key,
	first_name varchar(25) not null,
	last_name varchar(25) not null,
	salesman_number varchar(15) not null
);


create table Customer(
	customer_id serial primary key,
	first_name varchar(25) not null,
	last_name varchar(25) not null,
	credit_check boolean default false,
	customer_email varchar(50) 
);
	
create table Mechanic(
	mechanic_id serial primary key,
	first_name varchar(25) not null,
	last_name varchar(25) not null,
	badge_number varchar(10) not null,
	phone_number varchar(10) not null
); 

create table Service_Ticket(
	ticket_id serial primary key,
	service_done varchar(25) not null,
	service_description varchar(200),
	service_cost numeric(7,2),
	customer_id integer not null,
	foreign key(customer_id) references customer(customer_id),
	car_id integer not null,
	foreign key(car_id) references car(car_id),
	mechanic_id integer not null,
	foreign key(mechanic_id) references mechanic(mechanic_id)
);

select * from service_ticket;

create table Invoice(
	invoice_id serial primary key,
	final_sales_price numeric(8,2),
	payment_method varchar(40),
	customer_id integer not null,
	foreign key(customer_id) references customer(customer_id),
	salesman_id integer not null,
	foreign key(salesman_id) references sales_person(salesman_id),
	car_id integer not null,
	foreign key(car_id) references car(car_id)
);
create or replace procedure add_car(car_make varchar(15), car_model varchar(20), car_year integer, car_mileage integer, car_price numeric(8,2))
language plpgsql
as 
$$
begin 
	insert into car(car_make, car_model, car_year, car_mileage, car_price)
	values(car_make, car_model, car_year, car_mileage, car_price);
end;
$$;

select * from car;

call add_car('Mercedes-Benz', 'E-350', 2011, 90000, 15000);
call add_car('Ford', 'Focus', 2012, 30000, 8000);
call add_car('Toyota', 'RAV4', 2020, 50000, 24999);

insert into car(
	car_make,
	car_model,
	car_year,
	car_mileage 
) values (
	'Chevy',
	'Tracker',
	2003,
	80000
);

create or replace procedure add_customer(first_name varchar(25), last_name varchar(25), credit_check boolean, customer_email varchar(50))
language plpgsql
as 
$$
begin 
	insert into customer(first_name, last_name, credit_check, customer_email)
	values(first_name, last_name, credit_check, customer_email);
end;
$$;

call add_customer('Latte', 'Liu', false, 'latteliu@2048.com');
call add_customer('Barry', 'Weickert', true, 'barry@weickert.com');
call add_customer('Serge', 'Azenarok', false, 'serge.azenarok@gmail.com');

select * from customer;

create or replace procedure add_mechanic(first_name varchar(25), last_name varchar(25), badge_number varchar(10), phone_number varchar(10))
language plpgsql
as 
$$
begin 
	insert into mechanic(first_name, last_name, badge_number, phone_number)
	values(first_name, last_name, badge_number, phone_number);
end;
$$;

call add_mechanic('Nick', 'Tu', 'ABC123', '4085645215');
call add_mechanic('Gary', 'Tu', 'CDE456', '5104521525');
call add_mechanic('Mark', 'Lee', 'GFE345', '4552525478');

create or replace procedure add_salesman(first_name varchar(25), last_name varchar(25), salesman_number varchar(15))
language plpgsql
as 
$$
begin 
	insert into sales_person(first_name, last_name, salesman_number)
	values(first_name, last_name, salesman_number);
end;
$$;

call add_salesman('Jennifer', 'Liu', '5485482414');
call add_salesman('Amy', 'Liu', '5445544555');
call add_salesman('Emily', 'Nguyen', '4554522511');


create or replace procedure create_invoice(final_sales_price numeric(8,2), payment_method varchar(40), customer_id integer, salesman_id integer, car_id integer)
language plpgsql
as 
$$
begin 
	insert into invoice(final_sales_price, payment_method, customer_id, salesman_id, car_id)
	values(final_sales_price, payment_method, customer_id, salesman_id, car_id);
end;
$$;
select * from car;
call create_invoice(40000, '20000 down payment, 5 year period', 1, 1, 1);
call create_invoice(30000, '15000 down, 4 year period', 3, 1, 3);

select * from invoice;

create or replace procedure service_ticket(service_done varchar(25), service_description varchar(200), service_cost numeric(7,2), customer_id integer, car_id integer, mechanic_id integer)
language plpgsql
as 
$$ 
begin 
	insert into service_ticket(service_done, service_description, service_cost, customer_id, car_id, mechanic_id)
	values(service_done, service_description, service_cost, customer_id, car_id, mechanic_id);
end;
$$;

call service_ticket('CV axel replacement', 'Passenger side CV AXEL replacement', 600, 3, 6, 1);
call service_ticket('All brakes replacement', 'Brakes worn down 70-80%', 750, 1, 1, 3);

select * from service_ticket;


select first_name, last_name, count (*)
from invoice i
join sales_person sp 
on i.salesman_id = sp.salesman_id
group by sp.salesman_id;





-- Eric Olsson bootcamp project

create schema KC_CAR_FLEET_DLL authorization mkonyxsg;

--- Create tables

-- Table 1
create table KC_CAR_FLEET_DLL.parent_corp_table (
	par_corp_id varchar(10) not null, --PK	
	corp_name varchar(100) not null,
	constraint par_corp_id_PK primary key(par_corp_id)
);

-- Table 2
create table KC_CAR_FLEET_DLL.make_table (
	make_id varchar(10) not null, --PK	
	par_corp_id varchar(10) not null, --FK (var syntax is the same as other table)
	make_name varchar(100) not null,
	constraint make_id_PK primary key(make_id) 
);

-- Table 2 FK1
alter table kc_car_fleet_dll.make_table
add constraint par_corp_id_FK foreign key (par_corp_id)
references kc_car_fleet_dll.parent_corp_table(par_corp_id) 
-- Success

-- Table 3
create table kc_car_fleet_dll.model_table (
	model_id varchar(10) not null, --PK	
	make_id varchar(10) not null, --FK
	model_name varchar(100) not null,
	constraint model_id_PK primary key(model_id) 
);

drop table kc_car_fleet_dll.model_table; -- EO: drop complete due to: constraint model_id_PK primary key(make_id) error  
 
-- Table 2 FK2
alter table kc_car_fleet_dll.make_table -- Should this have been .model_table?? block below added w/o problem
add constraint make_id_FK foreign key(make_id)
references kc_car_fleet_dll.make_table(make_id) 

alter table kc_car_fleet_dll.make_table -- Drop constraint https://www.w3schools.com/sql/sql_ref_drop_constraint.asp
drop constraint make_id_FK 
-- Drop successfull 


--Table 3 FK
alter table kc_car_fleet_dll.model_table
add constraint make_id_FK foreign key(make_id)
references kc_car_fleet_dll.make_table(make_id)
-- Success

--- Load table 1, 2 and 3
insert into kc_car_fleet_dll.parent_corp_table (par_corp_id, corp_name) values('1','Honda');
insert into kc_car_fleet_dll.parent_corp_table (par_corp_id, corp_name) values('2','VW');
insert into kc_car_fleet_dll.parent_corp_table (par_corp_id, corp_name) values('3','GM');
insert into kc_car_fleet_dll.make_table (make_id, par_corp_id, make_name) values('1','1','Honda');
insert into kc_car_fleet_dll.make_table (make_id, par_corp_id, make_name) values('2','1','Acura');
insert into kc_car_fleet_dll.make_table (make_id, par_corp_id, make_name) values('3','2','Audi');
insert into kc_car_fleet_dll.make_table (make_id, par_corp_id, make_name) values('4','2','Bently');
insert into kc_car_fleet_dll.make_table (make_id, par_corp_id, make_name) values('5','3','Buick');
insert into kc_car_fleet_dll.make_table (make_id, par_corp_id, make_name) values('6','3','Cadillac');
insert into kc_car_fleet_dll.make_table (make_id, par_corp_id, make_name) values('7','3','Chevorlet');
insert into kc_car_fleet_dll.model_table (model_id, make_id, model_name) values('1','1','Accord');
insert into kc_car_fleet_dll.model_table (model_id, make_id, model_name) values('2','1','Civic');
insert into kc_car_fleet_dll.model_table (model_id, make_id, model_name) values('3','2','MDX');
insert into kc_car_fleet_dll.model_table (model_id, make_id, model_name) values('4','2','TLX');
insert into kc_car_fleet_dll.model_table (model_id, make_id, model_name) values('5','3','A4');
insert into kc_car_fleet_dll.model_table (model_id, make_id, model_name) values('6','3','A5');
insert into kc_car_fleet_dll.model_table (model_id, make_id, model_name) values('7','4','Continental GT');
insert into kc_car_fleet_dll.model_table (model_id, make_id, model_name) values('8','4','Flying Spur');
insert into kc_car_fleet_dll.model_table (model_id, make_id, model_name) values('9','5','Enclave');
insert into kc_car_fleet_dll.model_table (model_id, make_id, model_name) values('10','5','Encore');
insert into kc_car_fleet_dll.model_table (model_id, make_id, model_name) values('11','6','Escalade');
insert into kc_car_fleet_dll.model_table (model_id, make_id, model_name) values('12','6','XT5');
insert into kc_car_fleet_dll.model_table (model_id, make_id, model_name) values('13','7','Corvette');
insert into kc_car_fleet_dll.model_table (model_id, make_id, model_name) values('14','7','Camero');
-- Success loading of all tables

--- Run query
select * from kc_car_fleet_dll.parent_corp_table
select * from kc_car_fleet_dll.make_table
-- Success

-- Join parent co w/ make, hide columns
select parcorp.corp_name , make.make_name -- EO: Must use 'space'...','...'space'
	  from kc_car_fleet_dll.make_table 			make 
inner join kc_car_fleet_dll.parent_corp_table 	parcorp
using (par_corp_id) -- on make.par_corp_id = parcorp.par_corp_id -- EO: alternate way in comment
--- success


select * from kc_car_fleet_dll.parent_corp_table parcorp
select make.make_name from kc_car_fleet_dll.make_table make
select * from kc_car_fleet_dll.model_table

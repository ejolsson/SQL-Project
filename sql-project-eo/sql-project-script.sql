-- Eric Olsson bootcamp project

create schema KC_CAR_FLEET_DLL authorization mkonyxsg;

-- Parent Corp
create table kc_car_fleet_dll.parent_corp_table (par_corp_id varchar(10) not null, corp_name varchar(100) not null, constraint par_corp_id_PK primary key(par_corp_id)); 
 insert into kc_car_fleet_dll.parent_corp_table (par_corp_id, corp_name) values('1','Honda');
 insert into kc_car_fleet_dll.parent_corp_table (par_corp_id, corp_name) values('2','VW');
 insert into kc_car_fleet_dll.parent_corp_table (par_corp_id, corp_name) values('3','GM');
select * from kc_car_fleet_dll.parent_corp_table

-- Make
create table kc_car_fleet_dll.make_table (make_id varchar(10) not null, par_corp_id varchar(10) not null, make_name varchar(100) not null, constraint make_id_PK primary key(make_id));
 alter table kc_car_fleet_dll.make_table add constraint par_corp_id_FK foreign key (par_corp_id) references kc_car_fleet_dll.parent_corp_table(par_corp_id);
 insert into kc_car_fleet_dll.make_table (make_id, par_corp_id, make_name) values('1','1','Honda');
 insert into kc_car_fleet_dll.make_table (make_id, par_corp_id, make_name) values('2','1','Acura');
 insert into kc_car_fleet_dll.make_table (make_id, par_corp_id, make_name) values('3','2','Audi');
 insert into kc_car_fleet_dll.make_table (make_id, par_corp_id, make_name) values('4','2','Bently');
 insert into kc_car_fleet_dll.make_table (make_id, par_corp_id, make_name) values('5','3','Buick');
 insert into kc_car_fleet_dll.make_table (make_id, par_corp_id, make_name) values('6','3','Cadillac');
 insert into kc_car_fleet_dll.make_table (make_id, par_corp_id, make_name) values('7','3','Chevorlet');
select * from kc_car_fleet_dll.make_table -- Success
select make.make_name from kc_car_fleet_dll.make_table make -- success

-- Model 
create table kc_car_fleet_dll.model_table (model_id varchar(10) not null, make_id varchar(10) not null, model_name varchar(100) not null, constraint model_id_PK primary key(model_id));
 alter table kc_car_fleet_dll.model_table add constraint make_id_FK foreign key(make_id) references kc_car_fleet_dll.make_table(make_id); -- Success
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
 insert into kc_car_fleet_dll.model_table (model_id, make_id, model_name) values('14','7','Camero'); -- success

-- Color
create table kc_car_fleet_dll.color_table (color_id varchar(10) not null, color_name varchar(100) not null, constraint color_id_PK primary key(color_id)); -- Success
 insert into kc_car_fleet_dll.color_table (color_id, color_name) values('1','white');
 insert into kc_car_fleet_dll.color_table (color_id, color_name) values('2','black');
 insert into kc_car_fleet_dll.color_table (color_id, color_name) values('3','blue');
 insert into kc_car_fleet_dll.color_table (color_id, color_name) values('4','red');
select * from kc_car_fleet_dll.color_table -- success

-- Insurance Company
create table kc_car_fleet_dll.insurance_company_table (ins_co_id varchar(10) not null, ins_company_name varchar(100) not null, constraint ins_co_id_pk primary key(ins_co_id)); --success
 insert into kc_car_fleet_dll.insurance_company_table (ins_co_id, ins_company_name) values('1','AXA');
 insert into kc_car_fleet_dll.insurance_company_table (ins_co_id, ins_company_name) values('2','Banco de Sabadell');
 insert into kc_car_fleet_dll.insurance_company_table (ins_co_id, ins_company_name) values('3','Caser Seguros');
 insert into kc_car_fleet_dll.insurance_company_table (ins_co_id, ins_company_name) values('4','Catalana Occidente');
 insert into kc_car_fleet_dll.insurance_company_table (ins_co_id, ins_company_name) values('5','Eurocenter');
 insert into kc_car_fleet_dll.insurance_company_table (ins_co_id, ins_company_name) values('6','Linea Directa'); -- success

-- Currency
create table kc_car_fleet_dll.currency_table (curr_id varchar(10) not null, currency_name varchar(100) not null, constraint curr_id_pk primary key(curr_id)); --success
 insert into kc_car_fleet_dll.currency_table (curr_id, currency_name) values('1','USD');
 insert into kc_car_fleet_dll.currency_table (curr_id, currency_name) values('2','EUR');
 insert into kc_car_fleet_dll.currency_table (curr_id, currency_name) values('3','JPY'); --success

-- Registration 
create table kc_car_fleet_dll.registration_table (license_plate_id varchar(10) not null, car_id varchar(100) not null, dt_reg_start date not null, dt_reg_end date not null, registration_amount varchar(100) not null, curr_id varchar(100) not null, constraint license_plate_id_pk primary key(license_plate_id));
 alter table kc_car_fleet_dll.registration_table add constraint car_id_FK foreign key (car_id) references kc_car_fleet_dll.car_table(car_id); -- Success 20230201 23:06:17 
 alter table kc_car_fleet_dll.registration_table add constraint curr_id_FK foreign key (curr_id) references kc_car_fleet_dll.currency_table(curr_id); --success
 insert into kc_car_fleet_dll.registration_table (license_plate_id, car_id, dt_reg_start, dt_reg_end, registration_amount, curr_id) values('BGM937','1','2022-10-30','2023-10-29','167','2');
 insert into kc_car_fleet_dll.registration_table (license_plate_id, car_id, dt_reg_start, dt_reg_end, registration_amount, curr_id) values('TYC246','2','2022-06-08','2023-06-07','156','2');
 insert into kc_car_fleet_dll.registration_table (license_plate_id, car_id, dt_reg_start, dt_reg_end, registration_amount, curr_id) values('VXK5925','3','2022-05-10','2023-05-09','214','1');
 insert into kc_car_fleet_dll.registration_table (license_plate_id, car_id, dt_reg_start, dt_reg_end, registration_amount, curr_id) values('UQO8298','4','2022-12-01','2023-11-30','123','2');
 insert into kc_car_fleet_dll.registration_table (license_plate_id, car_id, dt_reg_start, dt_reg_end, registration_amount, curr_id) values('ELO2020','5','2022-07-17','2023-07-16','240','1');
 insert into kc_car_fleet_dll.registration_table (license_plate_id, car_id, dt_reg_start, dt_reg_end, registration_amount, curr_id) values('ZTW2748','6','2022-01-05','2023-01-04','155','2');
 insert into kc_car_fleet_dll.registration_table (license_plate_id, car_id, dt_reg_start, dt_reg_end, registration_amount, curr_id) values('RSP6195','7','2022-02-28','2023-02-27','261','2');
 insert into kc_car_fleet_dll.registration_table (license_plate_id, car_id, dt_reg_start, dt_reg_end, registration_amount, curr_id) values('LUH4314','8','2022-12-11','2023-12-10','114','3');
 insert into kc_car_fleet_dll.registration_table (license_plate_id, car_id, dt_reg_start, dt_reg_end, registration_amount, curr_id) values('HZI6923','9','2022-03-07','2023-03-06','178','1');
 insert into kc_car_fleet_dll.registration_table (license_plate_id, car_id, dt_reg_start, dt_reg_end, registration_amount, curr_id) values('ZLO5123','10','2022-08-09','2023-08-08','199','1');
select * from kc_car_fleet_dll.registration_table --success	

-- Insurance Policy
create table kc_car_fleet_dll.insurance_policy_table (ins_pol_id varchar(10) not null, car_id varchar(100) not null, ins_co_id varchar(100)  not null, dt_ins_start date not null, dt_ins_end date not null, constraint ins_pol_id_pk primary key(ins_pol_id)); --success 20230201 09:25:31 
alter table kc_car_fleet_dll.insurance_policy_table add constraint ins_co_id_FK foreign key (ins_co_id) references kc_car_fleet_dll.insurance_company_table(ins_co_id);
insert into kc_car_fleet_dll.insurance_policy_table (ins_pol_id, car_id, ins_co_id, dt_ins_start, dt_ins_end) values('P83723','2','3','2022-08-02','2023-08-01');
insert into kc_car_fleet_dll.insurance_policy_table (ins_pol_id, car_id, ins_co_id, dt_ins_start, dt_ins_end) values('P32508','10','2','2022-01-19','2023-01-18');
insert into kc_car_fleet_dll.insurance_policy_table (ins_pol_id, car_id, ins_co_id, dt_ins_start, dt_ins_end) values('P25409','8','3','2022-11-13','2023-11-12');
insert into kc_car_fleet_dll.insurance_policy_table (ins_pol_id, car_id, ins_co_id, dt_ins_start, dt_ins_end) values('P71722','9','1','2022-01-14','2023-01-13');
insert into kc_car_fleet_dll.insurance_policy_table (ins_pol_id, car_id, ins_co_id, dt_ins_start, dt_ins_end) values('P36494','7','2','2022-07-25','2023-07-24');
insert into kc_car_fleet_dll.insurance_policy_table (ins_pol_id, car_id, ins_co_id, dt_ins_start, dt_ins_end) values('P31162','1','2','2022-07-25','2023-07-24');
insert into kc_car_fleet_dll.insurance_policy_table (ins_pol_id, car_id, ins_co_id, dt_ins_start, dt_ins_end) values('P73660','3','2','2022-01-29','2023-01-28');
insert into kc_car_fleet_dll.insurance_policy_table (ins_pol_id, car_id, ins_co_id, dt_ins_start, dt_ins_end) values('P85940','4','2','2022-07-28','2023-07-27');
insert into kc_car_fleet_dll.insurance_policy_table (ins_pol_id, car_id, ins_co_id, dt_ins_start, dt_ins_end) values('P43571','6','3','2022-02-08','2023-02-07');
insert into kc_car_fleet_dll.insurance_policy_table (ins_pol_id, car_id, ins_co_id, dt_ins_start, dt_ins_end) values('P31802','5','2','2022-08-14','2023-08-13');--Success 20230201 09:27:08 
select * from kc_car_fleet_dll.insurance_policy_table --success

-- Service
create table kc_car_fleet_dll.service_table (service_id varchar(10) not null, car_id varchar(10) not null, odometer_km varchar(10) not null, dt_service date not null, service_amount varchar(100) not null, curr_id varchar(10) not null, constraint service_id_pk primary key(service_id));--success
alter table kc_car_fleet_dll.service_table add constraint curr_id_FK foreign key (curr_id) references kc_car_fleet_dll.currency_table(curr_id); -- Success 20230201 10:38:58 
insert into kc_car_fleet_dll.service_table (service_id, car_id, odometer_km, dt_service, service_amount, curr_id) values('S009','1','38229','2022-08-30','564','3');
insert into kc_car_fleet_dll.service_table (service_id, car_id, odometer_km, dt_service, service_amount, curr_id) values('S007','2','50016','2022-11-01','266','2');
insert into kc_car_fleet_dll.service_table (service_id, car_id, odometer_km, dt_service, service_amount, curr_id) values('S008','3','39177','2022-06-25','201','2');
insert into kc_car_fleet_dll.service_table (service_id, car_id, odometer_km, dt_service, service_amount, curr_id) values('S010','4','75250','2022-06-20','213','1');
insert into kc_car_fleet_dll.service_table (service_id, car_id, odometer_km, dt_service, service_amount, curr_id) values('S002','5','46870','2022-08-14','568','3');
insert into kc_car_fleet_dll.service_table (service_id, car_id, odometer_km, dt_service, service_amount, curr_id) values('S006','6','46120','2022-10-15','590','2');
insert into kc_car_fleet_dll.service_table (service_id, car_id, odometer_km, dt_service, service_amount, curr_id) values('S004','7','61918','2022-09-22','343','1');
insert into kc_car_fleet_dll.service_table (service_id, car_id, odometer_km, dt_service, service_amount, curr_id) values('S005','8','41353','2022-10-13','296','1');
insert into kc_car_fleet_dll.service_table (service_id, car_id, odometer_km, dt_service, service_amount, curr_id) values('S003','9','28804','2022-05-26','499','2');
insert into kc_car_fleet_dll.service_table (service_id, car_id, odometer_km, dt_service, service_amount, curr_id) values('S001','10','36878','2022-11-29','201','1');--success
select * from kc_car_fleet_dll.service_table --success

--Car
create table kc_car_fleet_dll.car_table (car_id varchar(10) not null, dt_purchased date not null, model_id varchar(10) not null, color_id varchar(10) not null, license_plate_id varchar(100) not null, ins_pol_id varchar(100) not null, service_id varchar(10) not null, total_km varchar(10) not null, constraint car_id_pk primary key(car_id));
 alter table kc_car_fleet_dll.car_table add constraint model_id_FK foreign key (model_id) references kc_car_fleet_dll.model_table(model_id);
 alter table kc_car_fleet_dll.car_table add constraint color_id_FK foreign key (color_id) references kc_car_fleet_dll.color_table(color_id);
 alter table kc_car_fleet_dll.car_table add constraint license_plate_id_FK foreign key (license_plate_id) references kc_car_fleet_dll.registration_table(license_plate_id);
 alter table kc_car_fleet_dll.car_table add constraint ins_pol_id_FK foreign key (ins_pol_id) references kc_car_fleet_dll.insurance_policy_table(ins_pol_id);
 alter table kc_car_fleet_dll.car_table add constraint service_id_FK foreign key (service_id) references kc_car_fleet_dll.service_table(service_id);
 insert into kc_car_fleet_dll.car_table (car_id, dt_purchased, model_id, color_id, license_plate_id, ins_pol_id, service_id, total_km) values('1','2018-10-26','10','4','BGM937','P31162','S009','49657');
 insert into kc_car_fleet_dll.car_table (car_id, dt_purchased, model_id, color_id, license_plate_id, ins_pol_id, service_id, total_km) values('2','2018-05-29','7','2','TYC246','P83723','S007','64896');
 insert into kc_car_fleet_dll.car_table (car_id, dt_purchased, model_id, color_id, license_plate_id, ins_pol_id, service_id, total_km) values('3','2018-09-10','5','4','VXK5925','P73660','S008','52524');
 insert into kc_car_fleet_dll.car_table (car_id, dt_purchased, model_id, color_id, license_plate_id, ins_pol_id, service_id, total_km) values('4','2018-03-13','6','2','UQO8298','P85940','S010','77935');
 insert into kc_car_fleet_dll.car_table (car_id, dt_purchased, model_id, color_id, license_plate_id, ins_pol_id, service_id, total_km) values('5','2016-03-22','7','1','ELO2020','P31802','S002','49589');
 insert into kc_car_fleet_dll.car_table (car_id, dt_purchased, model_id, color_id, license_plate_id, ins_pol_id, service_id, total_km) values('6','2018-06-23','2','3','ZTW2748','P43571','S006','66840');
 insert into kc_car_fleet_dll.car_table (car_id, dt_purchased, model_id, color_id, license_plate_id, ins_pol_id, service_id, total_km) values('7','2020-02-02','2','1','RSP6195','P36494','S004','79469');
 insert into kc_car_fleet_dll.car_table (car_id, dt_purchased, model_id, color_id, license_plate_id, ins_pol_id, service_id, total_km) values('8','2016-11-10','8','2','LUH4314','P25409','S005','42893');
 insert into kc_car_fleet_dll.car_table (car_id, dt_purchased, model_id, color_id, license_plate_id, ins_pol_id, service_id, total_km) values('9','2019-08-09','7','1','HZI6923','P71722','S003','31526');
 insert into kc_car_fleet_dll.car_table (car_id, dt_purchased, model_id, color_id, license_plate_id, ins_pol_id, service_id, total_km) values('10','2016-02-26','9','2','ZLO5123','P32508','S001','37321');
select * from kc_car_fleet_dll.car_table

-- Join parent co w/ make, hide columns
select parcorp.corp_name , make.make_name -- EO: Must use 'space'...','...'space'
	  from kc_car_fleet_dll.make_table 			make 
inner join kc_car_fleet_dll.parent_corp_table 	parcorp
using (par_corp_id) -- on make.par_corp_id = parcorp.par_corp_id -- EO: alternate way in comment
--- success

--- Join make & model
select make.make_name , model.model_name
from kc_car_fleet_dll.model_table model
inner join kc_car_fleet_dll.make_table make
using (make_id)
--- success


--drop table kc_car_fleet_dll.name_of_table; 
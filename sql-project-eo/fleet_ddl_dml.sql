/*Eric Olsson
This project is KeepCoding Bootcamp project
XV Bootcamp Mobile - Development of Mobile Applications
https://www.keepcoding.io
Eric Olsson
5 Feb 2023*/

create schema fleet_dll authorization mkonyxsg;

-- Create tables
create table fleet_dll.group (group_id varchar(10) not null, name varchar(100) not null, constraint group_id_PK primary key(group_id));
create table fleet_dll.make (make_id varchar(10) not null, group_id varchar(10) not null, name varchar(100) not null, constraint make_id_PK primary key(make_id));
create table fleet_dll.model (model_id varchar(10) not null, make_id varchar(10) not null, name varchar(100) not null, constraint model_id_PK primary key(model_id));
create table fleet_dll.color (color_id varchar(10) not null, name varchar(100) not null, constraint color_id_PK primary key(color_id));
create table fleet_dll.insurance_co (ins_co_id varchar(10) not null, name varchar(100) not null, constraint ins_co_id_pk primary key(ins_co_id));
create table fleet_dll.currency (curr_id varchar(10) not null, name varchar(100) not null, constraint curr_id_pk primary key(curr_id));
create table fleet_dll.registration (license_plate_id varchar(10) not null, car_id varchar(100) not null, reg_st_dt date not null, reg_end_dt date not null, reg_amt varchar(100) not null, curr_id varchar(100) not null, constraint license_plate_id_pk primary key(license_plate_id));
create table fleet_dll.insurance_pol (ins_pol_id varchar(10) not null, car_id varchar(100) not null, ins_co_id varchar(100)  not null, ins_st_dt date not null, ins_end_dt date not null, constraint ins_pol_id_pk primary key(ins_pol_id));
create table fleet_dll.service (service_id varchar(10) not null, car_id varchar(10) not null, odometer_km varchar(10) not null, service_dt date not null, service_amt varchar(100) not null, curr_id varchar(10) not null, constraint service_id_pk primary key(service_id));
create table fleet_dll.car (car_id varchar(10) not null, purchase_dt date, model_id varchar(10), color_id varchar(10), license_plate_id varchar(100), ins_pol_id varchar(100), service_id varchar(10), total_km varchar(10), constraint car_id_pk primary key(car_id));

-- Create FKs
alter table fleet_dll.make add constraint group_id_FK foreign key (group_id) references fleet_dll.group(group_id);
alter table fleet_dll.model add constraint make_id_FK foreign key(make_id) references fleet_dll.make(make_id);
alter table fleet_dll.registration add constraint car_id_FK foreign key (car_id) references fleet_dll.car(car_id);
alter table fleet_dll.registration add constraint curr_id_FK foreign key (curr_id) references fleet_dll.currency(curr_id); 
alter table fleet_dll.insurance_pol add constraint ins_co_id_FK foreign key (ins_co_id) references fleet_dll.insurance_co(ins_co_id);
alter table fleet_dll.insurance_pol add constraint car_id_FK foreign key (car_id) references fleet_dll.car(car_id);
alter table fleet_dll.service add constraint curr_id_FK foreign key (curr_id) references fleet_dll.currency(curr_id);
alter table fleet_dll.car add constraint model_id_FK foreign key (model_id) references fleet_dll.model(model_id);
alter table fleet_dll.car add constraint color_id_FK foreign key (color_id) references fleet_dll.color(color_id);
alter table fleet_dll.car add constraint license_plate_id_FK foreign key (license_plate_id) references fleet_dll.registration(license_plate_id);
alter table fleet_dll.car add constraint ins_pol_id_FK foreign key (ins_pol_id) references fleet_dll.insurance_pol(ins_pol_id);
alter table fleet_dll.car add constraint service_id_FK foreign key (service_id) references fleet_dll.service(service_id);

-- Load data
insert into fleet_dll.group (group_id, name) values('1','Honda');
insert into fleet_dll.group (group_id, name) values('2','VW');
insert into fleet_dll.group (group_id, name) values('3','GM');
insert into fleet_dll.make (make_id, group_id, name) values('1','1','Honda');
insert into fleet_dll.make (make_id, group_id, name) values('2','1','Acura');
insert into fleet_dll.make (make_id, group_id, name) values('3','2','Audi');
insert into fleet_dll.make (make_id, group_id, name) values('4','2','Bently');
insert into fleet_dll.make (make_id, group_id, name) values('5','3','Buick');
insert into fleet_dll.make (make_id, group_id, name) values('6','3','Cadillac');
insert into fleet_dll.make (make_id, group_id, name) values('7','3','Chevorlet');
insert into fleet_dll.model (model_id, make_id, name) values('1','1','Accord');
insert into fleet_dll.model (model_id, make_id, name) values('2','1','Civic');
insert into fleet_dll.model (model_id, make_id, name) values('3','2','MDX');
insert into fleet_dll.model (model_id, make_id, name) values('4','2','TLX');
insert into fleet_dll.model (model_id, make_id, name) values('5','3','A4');
insert into fleet_dll.model (model_id, make_id, name) values('6','3','A5');
insert into fleet_dll.model (model_id, make_id, name) values('7','4','Continental GT');
insert into fleet_dll.model (model_id, make_id, name) values('8','4','Flying Spur');
insert into fleet_dll.model (model_id, make_id, name) values('9','5','Enclave');
insert into fleet_dll.model (model_id, make_id, name) values('10','5','Encore');
insert into fleet_dll.model (model_id, make_id, name) values('11','6','Escalade');
insert into fleet_dll.model (model_id, make_id, name) values('12','6','XT5');
insert into fleet_dll.model (model_id, make_id, name) values('13','7','Corvette');
insert into fleet_dll.model (model_id, make_id, name) values('14','7','Camero');
insert into fleet_dll.color (color_id, name) values('1','white');
insert into fleet_dll.color (color_id, name) values('2','black');
insert into fleet_dll.color (color_id, name) values('3','blue');
insert into fleet_dll.color (color_id, name) values('4','red');
insert into fleet_dll.insurance_co (ins_co_id, name) values('1','AXA');
insert into fleet_dll.insurance_co (ins_co_id, name) values('2','Banco de Sabadell');
insert into fleet_dll.insurance_co (ins_co_id, name) values('3','Caser Seguros');
insert into fleet_dll.insurance_co (ins_co_id, name) values('4','Catalana Occidente');
insert into fleet_dll.insurance_co (ins_co_id, name) values('5','Eurocenter');
insert into fleet_dll.insurance_co (ins_co_id, name) values('6','Linea Directa');
insert into fleet_dll.currency (curr_id, name) values('1','USD');
insert into fleet_dll.currency (curr_id, name) values('2','EUR');
insert into fleet_dll.currency (curr_id, name) values('3','JPY');
insert into fleet_dll.car (car_id, purchase_dt, model_id, color_id, total_km) values('1','2018-10-26','10','4','49657');
insert into fleet_dll.car (car_id, purchase_dt, model_id, color_id, total_km) values('2','2018-05-29','7','2','64896');
insert into fleet_dll.car (car_id, purchase_dt, model_id, color_id, total_km) values('3','2018-09-10','5','4','52524');
insert into fleet_dll.car (car_id, purchase_dt, model_id, color_id, total_km) values('4','2018-03-13','6','2','77935');
insert into fleet_dll.car (car_id, purchase_dt, model_id, color_id, total_km) values('5','2016-03-22','7','1','49589');
insert into fleet_dll.car (car_id, purchase_dt, model_id, color_id, total_km) values('6','2018-06-23','2','3','66840');
insert into fleet_dll.car (car_id, purchase_dt, model_id, color_id, total_km) values('7','2020-02-02','2','1','79469');
insert into fleet_dll.car (car_id, purchase_dt, model_id, color_id, total_km) values('8','2016-11-10','8','2','42893');
insert into fleet_dll.car (car_id, purchase_dt, model_id, color_id, total_km) values('9','2019-08-09','7','1','31526');
insert into fleet_dll.car (car_id, purchase_dt, model_id, color_id, total_km) values('10','2016-02-26','9','2','37321'); 
insert into fleet_dll.registration (license_plate_id, car_id, reg_st_dt, reg_end_dt, reg_amt, curr_id) values('BGM1937','1','2022-10-30','2023-10-29','167','2');
insert into fleet_dll.registration (license_plate_id, car_id, reg_st_dt, reg_end_dt, reg_amt, curr_id) values('TYC1246','2','2022-06-08','2023-06-07','156','2');
insert into fleet_dll.registration (license_plate_id, car_id, reg_st_dt, reg_end_dt, reg_amt, curr_id) values('VXK5925','3','2022-05-10','2023-05-09','214','1');
insert into fleet_dll.registration (license_plate_id, car_id, reg_st_dt, reg_end_dt, reg_amt, curr_id) values('UQO8298','4','2022-12-01','2023-11-30','123','2');
insert into fleet_dll.registration (license_plate_id, car_id, reg_st_dt, reg_end_dt, reg_amt, curr_id) values('ELO2020','5','2022-07-17','2023-07-16','240','1');
insert into fleet_dll.registration (license_plate_id, car_id, reg_st_dt, reg_end_dt, reg_amt, curr_id) values('ZTW2748','6','2022-01-05','2023-01-04','155','2'); -- Car 6 should fail active test
insert into fleet_dll.registration (license_plate_id, car_id, reg_st_dt, reg_end_dt, reg_amt, curr_id) values('RSP6195','7','2022-02-28','2023-02-27','261','2');
insert into fleet_dll.registration (license_plate_id, car_id, reg_st_dt, reg_end_dt, reg_amt, curr_id) values('LUH4314','8','2022-12-11','2023-12-10','114','3');
insert into fleet_dll.registration (license_plate_id, car_id, reg_st_dt, reg_end_dt, reg_amt, curr_id) values('HZI6923','9','2022-03-07','2023-03-06','178','1');
insert into fleet_dll.registration (license_plate_id, car_id, reg_st_dt, reg_end_dt, reg_amt, curr_id) values('ZLO5123','10','2022-08-09','2023-08-08','199','1');
insert into fleet_dll.insurance_pol (ins_pol_id, car_id, ins_co_id, ins_st_dt, ins_end_dt) values('P83723','2','3','2022-08-02','2023-08-01');
insert into fleet_dll.insurance_pol (ins_pol_id, car_id, ins_co_id, ins_st_dt, ins_end_dt) values('P32508','10','2','2022-01-19','2023-01-18'); -- Car 10 should fail active test
insert into fleet_dll.insurance_pol (ins_pol_id, car_id, ins_co_id, ins_st_dt, ins_end_dt) values('P25409','8','3','2022-11-13','2023-11-12');
insert into fleet_dll.insurance_pol (ins_pol_id, car_id, ins_co_id, ins_st_dt, ins_end_dt) values('P71722','9','1','2022-01-14','2023-01-13'); -- Car 9 should fail active test
insert into fleet_dll.insurance_pol (ins_pol_id, car_id, ins_co_id, ins_st_dt, ins_end_dt) values('P36494','7','2','2022-07-25','2023-07-24');
insert into fleet_dll.insurance_pol (ins_pol_id, car_id, ins_co_id, ins_st_dt, ins_end_dt) values('P31162','1','2','2022-07-25','2023-07-24');
insert into fleet_dll.insurance_pol (ins_pol_id, car_id, ins_co_id, ins_st_dt, ins_end_dt) values('P73660','3','2','2022-01-29','2023-01-28'); -- Car 3 should fail active test
insert into fleet_dll.insurance_pol (ins_pol_id, car_id, ins_co_id, ins_st_dt, ins_end_dt) values('P85940','4','2','2022-07-28','2023-07-27');
insert into fleet_dll.insurance_pol (ins_pol_id, car_id, ins_co_id, ins_st_dt, ins_end_dt) values('P43571','6','3','2022-02-08','2023-02-07');
insert into fleet_dll.insurance_pol (ins_pol_id, car_id, ins_co_id, ins_st_dt, ins_end_dt) values('P31802','5','2','2022-08-14','2023-08-13');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S009','1','38229','2022-08-30','564','3'); 
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S011','1','48350','2022-10-30','402','3'); 
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S012','1','50355','2022-11-15','118','3');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S007','2','50016','2022-11-01','266','2');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S008','3','39177','2022-06-25','201','2');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S010','4','75250','2022-06-20','213','1');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S002','5','46870','2022-08-14','568','3');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S006','6','46120','2022-10-15','590','2');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S004','7','61918','2022-09-22','343','1');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S005','8','41353','2022-10-13','296','1');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S003','9','28804','2022-05-26','499','2');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S001','10','36878','2022-11-29','201','1');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S013','2','51016','2022-12-01','156','2');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S014','3','40177','2022-07-25','151','2');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S015','4','76250','2022-07-20','203','1');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S016','5','47870','2022-09-14','508','3');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S017','6','47120','2022-11-15','500','2');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S018','7','62918','2022-10-22','263','1');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S019','8','42353','2022-11-13','146','1');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S020','9','29804','2022-06-26','369','2');
insert into fleet_dll.service (service_id, car_id, odometer_km, service_dt, service_amt, curr_id) values('S021','10','37878','2022-12-29','401','1');
update fleet_dll.car set license_plate_id = 'BGM1937', ins_pol_id = 'P31162', service_id = 'S009' where car_id = '1';
update fleet_dll.car set license_plate_id = 'TYC1246', ins_pol_id = 'P83723', service_id = 'S007' where car_id = '2';
update fleet_dll.car set license_plate_id = 'VXK5925', ins_pol_id = 'P73660', service_id = 'S008' where car_id = '3';
update fleet_dll.car set license_plate_id = 'UQO8298', ins_pol_id = 'P85940', service_id = 'S010' where car_id = '4';
update fleet_dll.car set license_plate_id = 'ELO2020', ins_pol_id = 'P31802', service_id = 'S002' where car_id = '5';
update fleet_dll.car set license_plate_id = 'ZTW2748', ins_pol_id = 'P43571', service_id = 'S006' where car_id = '6';
update fleet_dll.car set license_plate_id = 'RSP6195', ins_pol_id = 'P36494', service_id = 'S004' where car_id = '7';
update fleet_dll.car set license_plate_id = 'LUH4314', ins_pol_id = 'P25409', service_id = 'S005' where car_id = '8';
update fleet_dll.car set license_plate_id = 'HZI6923', ins_pol_id = 'P71722', service_id = 'S003' where car_id = '9';
update fleet_dll.car set license_plate_id = 'ZLO5123', ins_pol_id = 'P32508', service_id = 'S001' where car_id = '10';

--select c.car_id as "Car", m2.name as "Make" , m1.name as "Model" , g.name as "Group" , purchase_dt as "Purchase Date" , 
--c.license_plate_id as "License Plate", c2.name as "Color" , 
--total_km as "Total KM" , ic.name as "Insurer" , ip.ins_pol_id as "Policy Number" , 
--s.service_id as "Service ID", max(s.service_dt) as "Most recent service" , s.odometer_km as "Odometer at last service"
--from fleet_dll.car c 
--join fleet_dll.model         m1 on   m1.model_id = c.model_id
--join fleet_dll.make          m2 on    m2.make_id = m1.make_id 
--join fleet_dll.group          g on    g.group_id = m2.group_id 
--join fleet_dll.insurance_pol ip on ip.ins_pol_id = c.ins_pol_id 
--join fleet_dll.insurance_co  ic on  ic.ins_co_id = ip.ins_co_id 
--join fleet_dll.color         c2 on   c2.color_id =  c.color_id 
--join fleet_dll.registration   r on r.license_plate_id = c.license_plate_id 
--join fleet_dll.service        s on      s.car_id = c.car_id
--join (select car_id, max(service_dt) service_dt
--      from fleet_dll.service s2 
--      group by car_id) SubQ 
--on SubQ.car_id = s.car_id and SubQ.service_dt = s.service_dt
--where ins_end_dt >= now() and reg_end_dt >= now() -- Registration and insurance end dates must be in the future to be active. Cars 3, 6, 9 and 10 should not appear.
--group by c.car_id, m2.name, m1.name, g.name, purchase_dt, c.license_plate_id, c2.name, total_km, ic.name, ip.ins_pol_id, s.service_id , s.service_dt, s.odometer_km
--order by c.car_id asc
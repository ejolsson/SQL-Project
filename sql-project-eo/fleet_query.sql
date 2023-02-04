/*Eric Olsson
This project is KeepCoding Bootcamp project
XV Bootcamp Mobile - Development of Mobile Applications
https://www.keepcoding.io
Eric Olsson
5 Feb 2023

Generate an SQL query to get the following list of active cars in keepcoding:
- Model name, brand and group of cars (the names of all)
- Date of purchase
- License plate
- Car color name
- Total kilometers
- Name of the company that is insured the car
- Policy number*/


select c.car_id as "Car", m2.name as "Make" , m1.name as "Model" , g.name as "Group" , purchase_dt as "Purchase Date" , 
c.license_plate_id as "License Plate", c2.name as "Color" , 
total_km as "Total KM" , ic.name as "Insurer" , ip.ins_pol_id as "Policy Number" , 
s.service_id as "Service ID", max(s.service_dt) as "Most recent service" , s.odometer_km as "Odometer at last service"
from fleet_dll.car c 
join fleet_dll.model         m1 on   m1.model_id = c.model_id
join fleet_dll.make          m2 on    m2.make_id = m1.make_id 
join fleet_dll.group          g on    g.group_id = m2.group_id 
join fleet_dll.insurance_pol ip on ip.ins_pol_id = c.ins_pol_id 
join fleet_dll.insurance_co  ic on  ic.ins_co_id = ip.ins_co_id 
join fleet_dll.color         c2 on   c2.color_id =  c.color_id 
join fleet_dll.registration   r on r.license_plate_id = c.license_plate_id 
join fleet_dll.service        s on      s.car_id = c.car_id
join (select car_id, max(service_dt) service_dt
      from fleet_dll.service s2 
      group by car_id) SubQ 
on SubQ.car_id = s.car_id and SubQ.service_dt = s.service_dt
where ins_end_dt >= now() and reg_end_dt >= now() -- Registration and insurance end dates must be in the future to be active. Cars 3, 6, 9 and 10 should not appear.
group by c.car_id, m2.name, m1.name, g.name, purchase_dt, c.license_plate_id, c2.name, total_km, ic.name, ip.ins_pol_id, s.service_id , s.service_dt, s.odometer_km
order by c.car_id asc
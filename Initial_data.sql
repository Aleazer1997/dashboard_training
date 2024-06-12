insert into DASHBOARD.facility(name, address, latitude, longitude, contact_no, email_id)
values
('Community centre', '123 park ave, white field', 12.7548, 77.54564, 458454879, 'contact@cummnitycentre.com'),
( 'Health care', '45 street', 12.23454, 76.5545, 4571111547, 'info@gmail.com');


Insert into DASHBOARD.building(building_id,name, address, facility_id) values 
(1, 'Building 1', 'white field, bangalore', 
(select id from  DASHBOARD.facility where name = 'Community centre'));

Insert into DASHBOARD.building(building_id,name, address, facility_id) values (2, 'Building 2', 'white field, bangalore', 2);

Insert into DASHBOARD.floor(floor_id, name, building_id) values (1, 'Floor 1', 1);
Insert into DASHBOARD.floor(floor_id, name, building_id) values (2, 'Floor 2', 2);

Insert into DASHBOARD.company(name, floor_id) values ( 'Company 1', 1);
Insert into DASHBOARD.company(name, floor_id) values ('Company 2', 2);
Insert into DASHBOARD.company( name, floor_id) values ('Company 2', 1);

INSERT INTO whitefield_bangalore.sensor_data (value, received_time, sensor_id)
SELECT
    whitefield_bangalore.GET_RANDOM_NUMBER(15,30),
    generate_series('2024-01-01 00:00:00'::timestamp, '2024-05-01 23:59:00'::timestamp, '30 seconds'),
    whitefield_bangalore.GET_RANDOM_NUMBER(1,4);
CREATE SCHEMA DASHBOARD;

CREATE TABLE IF NOT EXISTS DASHBOARD.facility(
	id serial primary key,
	name varchar(50),
	address varchar(150),
	latitude real,
	longitude real,
	contact_no bigint,
  	email_id varchar(256)
);

CREATE TABLE IF NOT EXISTS DASHBOARD.building
(
    building_id integer PRIMARY KEY,
    name varchar(50),
    address varchar(100) ,
    facility_id int references DASHBOARD.facility(id)
);

Create table IF NOT EXISTS DASHBOARD.floor
(
  floor_id integer NOT NULL,
  name character varying(50) COLLATE pg_catalog."default" NOT NULL,
  building_id integer NOT NULL references DASHBOARD.building(building_id),
  CONSTRAINT floor_pkey PRIMARY KEY (floor_id)
);


DROP TABLE IF EXISTS DASHBOARD.company  CASCADE;
(
company_id serial PRIMARY KEY,
name varchar(50) NOT NULL,
floor_id integer NOT NULL references DASHBOARD.floor(floor_id)
);


CREATE TABLE IF NOT EXISTS DASHBOARD.zone(
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(50),
    FLOOR_ID INT REFERENCES DASHBOARD.FLOOR(FLOOR_ID)
);

CREATE TABLE IF NOT EXISTS DASHBOARD.sensor(
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(50),
    ZONE_ID INT REFERENCES DASHBOARD.zone(id)
);

CREATE TABLE IF NOT EXISTS DASHBOARD.sensor_data(
    ID SERIAL PRIMARY KEY,
    VALUE REAL,
    RECEIVED_TIME TIMESTAMP,
    SENSOR_ID INT REFERENCES DASHBOARD.sensor(id)
);



CREATE TABLE IF NOT EXISTS DASHBOAD.REPORTS(
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(50),
    IS_REAL_TIME BOOLEAN,
    QUERY_INTERVAL TEXT,
    START_TIME TIMESTAMP,
    END_TIME TIMESTAMP,
    FLOOR_ID INT REFERENCES DASHBOARD.floor(floor_id)
)


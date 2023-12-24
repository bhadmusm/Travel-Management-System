DROP DATABASE IF EXISTS TravelBookingSystem;
CREATE DATABASE TravelBookingSystem;
USE TravelBookingSystem;

################################TABLES##########################################
CREATE TABLE TRAVELLER (
    traveller_ID INT PRIMARY KEY,
    address VARCHAR(255),
    phone VARCHAR(20),
    t_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE TRAVEL_AGENCY (
    agency_ID INT PRIMARY KEY,
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255),
    ta_name VARCHAR(100),
    service_type VARCHAR(50)
);

CREATE TABLE TRANSPORTATION (
    transport_ID INT PRIMARY KEY,
    cost DECIMAL(10, 2),
    departure DATETIME,
    arrival DATETIME,
    t_mode VARCHAR(50),
    destination VARCHAR(255)
);

CREATE TABLE ACCOMMODATION (
    accommodation_ID INT PRIMARY KEY,
    location VARCHAR(255),
    accom_name VARCHAR(100),
    cost_per_night DECIMAL(10, 2),
    a_type VARCHAR(50),
    availability BOOLEAN
);


CREATE TABLE PREFERENCES (
    preference_ID INT PRIMARY KEY,
    accommodation_type VARCHAR(50),
    min_budget DECIMAL(10, 2),
    max_budget DECIMAL(10, 2),
    transport_mode VARCHAR(50),
    food_pref VARCHAR(50),
    language_pref VARCHAR(50),
    traveller_ID INT,
    agency_ID INT,
    FOREIGN KEY (traveller_ID) REFERENCES traveller(traveller_ID),
    FOREIGN KEY (agency_ID) REFERENCES travel_agency(agency_ID),
    UNIQUE (traveller_ID)
    
);

CREATE TABLE BOOKING (
    booking_ID INT PRIMARY KEY,
    b_date DATE,
    b_status VARCHAR(50),
    total_cost DECIMAL(10, 2),
    preference_ID INT,
    agency_ID INT,
    transport_ID INT,
    accommodation_ID INT,
    FOREIGN KEY (preference_ID) REFERENCES preferences(preference_ID),
    FOREIGN KEY (agency_ID) REFERENCES travel_agency(agency_ID),
    FOREIGN KEY (transport_ID) REFERENCES transportation(transport_ID),
    FOREIGN KEY (accommodation_ID) REFERENCES accommodation(accommodation_ID)
);


###############################ALTERING#####################################
ALTER TABLE PREFERENCES
DROP COLUMN commission_rate;

ALTER TABLE ACCOMMODATION
RENAME COLUMN a_type TO accom_type;

ALTER TABLE TRAVEL_AGENCY
MODIFY COLUMN phone VARCHAR(15);

ALTER TABLE TRAVEL_AGENCY
DROP COLUMN preference_ID;
###############################POPULATING TABLES#######################################

INSERT INTO traveller (traveller_ID, address, phone, t_name, email)
VALUES
    (1, '9362 Buell Place', '487-298-1107', 'Mabelle Marages', 'mmarages0@netvibes.com'),
    (2, '6 Mallory Center', '807-380-3239', 'Denise Proske', 'dproske1@fotki.com'),
    (3, '819 Dahle Trail', '211-707-1315', 'Ansley Drewitt', 'adrewitt2@mayoclinic.com'),
    (4, '8 Atwood Court', NULL, 'Farrel Sayton', 'fsayton3@upenn.edu'),
    (5, '154 Mendota Park', '741-164-5431', 'Bordy Basill', NULL),
    (6, '5 Bellgrove Circle', '101-414-6216', 'Melisandra Pashan', 'mpashan5@usa.gov'),
    (7, '225 Riverside Parkway', '809-681-3850', 'Tabbatha Forsard', 'tforsard6@smh.com.au'),
    (8, '162 Green Ridge Trail', '919-347-6859', 'Claresta Stebbins', 'cstebbins7@un.org'),
    (9, '4 Dakota Plaza', '613-442-8440', 'Davon Blasgen', 'dblasgen8@yale.edu'),
    (10, '151 Valley Edge Point', '188-275-6430', 'Gun Collis', 'gcollis9@merriam-webster.com')
;


INSERT INTO transportation (transport_ID, cost, departure, arrival, t_mode, destination)
VALUES
    (201, 50.00, '2023-01-01 08:00:00', '2023-01-01 10:00:00', 'Bus', 'Amsterdam'),
    (202, 100.00, '2023-02-15 12:00:00', '2023-02-15 15:00:00', 'Train', 'London'),
    (203, 75.00, '2023-07-30 16:00:00', '2023-07-30 17:00:00', 'Taxi', 'Tokyo'),
    (204, 50.00, '2023-08-04 21:00:00', '2023-09-04 07:00:00', 'Airplane', 'Lagos'),
    (205, 100.00, '2023-09-12 20:00:00', '2023-09-12 14:00:00', 'Ferry', 'Dublin')
    ;
    
INSERT INTO travel_agency (agency_ID, email, phone, address, ta_name, service_type)
VALUES
    (101, 'info@agency1.com', '555-1111', '321 Agency St', 'Travel Experts', 'Full-Service'),
    (102, 'info@agency2.com', '555-2222', '654 Agency Ave', 'Adventure Tours', 'Adventure'),
    (103, 'info@agency3.com', '555-3333', '987 Agency Blvd', 'Budget Travel', 'Budget-Friendly'),
    (104, 'info@agency4.com', '555-4444', '1234 Agency Ln', 'Luxury Escapes', 'Luxury'),
    (105, 'info@agency5.com', '555-5555', '567 Agency Rd', 'Cruise Masters', 'Cruise')
    ;


INSERT INTO accommodation (accommodation_ID, location, accom_name, cost_per_night, a_type, availability)
VALUES
    (301, 'Downtown', 'Luxury Hotel', 300.00, 'Hotel', true),
    (302, 'Suburb', 'Cozy Apartment', 50.00, 'Apartment', true),
    (303, 'City Center', 'Budget Hostel', 30.00, 'Hostel', true),
    (304, 'Downtown', 'Amazing Villa', 500.00, 'Villa', true),
    (305, 'Suburb', 'Super Mansion', 1000.00, 'Mansion', true)
    ;

INSERT INTO preferences (preference_ID, accommodation_type, min_budget, max_budget, transport_mode, food_pref, language_pref, traveller_ID, agency_ID)
VALUES
    (1, 'Hotel',     100.00,  200.00, 'Airplane',  'Vegetarian', 'English', 1, 101),
    (2, 'Apartment', 150.00,  300.00, 'Train',     'Halal', 'French',       2, 101),
	(3, 'Hostel',    50.00,   100.00, 'Bus',       'None', 'Spanish',       3, 102),
	(4, 'Villa',     1200.00, 2000.00, 'Taxi',     'Vegetarian', 'English', 4, 102),
	(5, 'Apartment', 350.00,  500.00, 'Airplane',  'Vegan', 'Yoruba',       5, 103),
	(6, 'Hostel',    200.00,  250.00, 'Bus',       'None', 'Spanish',       6, 103),
	(7, 'Hotel',     500.00,  600.00, 'Airplane',  'Vegetarian', 'Arabic',  7, 104),
	(8, 'Apartment', 150.00,  300.00, 'Train',     'Vegan', 'French',       8, 104),
	(9, 'Hostel',    50.00,   100.00, 'Bus',       'Halal', 'Hindu',        9, 105),
	(10, 'Mansion',  3000.00, 5000.00 ,'Ferry', 'Vegetarian', 'English',    10, 105)
;

INSERT INTO booking (booking_ID, b_date, b_status, total_cost, preference_ID, agency_ID, transport_ID, accommodation_ID)
VALUES
    (1, '2023-01-01', 'Confirmed', 500.00, 1, 101, 204, 305),
    (2, '2023-02-15', 'Pending', 700.00, 2, 101, 202, 302),
    (3, '2023-03-04', 'Cancelled', 400.00, 3, 102, 201, 303),
    (4, '2023-09-20', 'Cancelled', 2500.00, 4, 102, 203, 304),
    (5, '2023-02-15', 'Confirmed', 750.00, 5, 103, 204, 302),
    (6, '2023-05-17', 'Confirmed', 600.00, 6, 103, 205, 303),
	(7, '2023-07-01', 'Confirmed', 900.00, 7, 104, 204, 301),
	(8, '2023-06-15', 'Pending', 500.00, 8, 104, 202, 302),
	(9, '2023-01-29', 'Cancelled', 300.00, 9, 105, 201, 303),
	(10, '2023-12-30', 'Confirmed', 6500.00, 10, 105, 205, 305)
    ;

####################################VIEWS#################################

CREATE VIEW traveller_view AS
SELECT * FROM traveller;

CREATE VIEW preferences_view AS
SELECT * FROM preferences;

CREATE VIEW booking_view AS
SELECT * FROM booking;

CREATE VIEW travel_agency_view AS
SELECT * FROM travel_agency;

CREATE VIEW transport_view AS
SELECT * FROM transportation;

CREATE VIEW accommodation_view AS
SELECT * FROM accommodation;

####################################RETRIEVING#################################
SELECT DISTINCT phone
WHERE traveller_ID <= 3;

SELECT DISTINCT phone
FROM travel_agency;

SELECT *
FROM transportation
WHERE arrival > '2023-08-01';

SELECT *
FROM transportation
WHERE cost >= '75.00' OR t_mode = 'Train';

SELECT *
FROM preferences
WHERE NOT (max_budget > '500.00' OR accommodation_type = 'Hotel');

SELECT *
FROM booking
WHERE b_status IN ('Pending', 'Confirmed');

SELECT *
FROM booking
WHERE total_cost BETWEEN 550 AND 1000;

SELECT *
FROM traveller
WHERE t_name LIKE "d%";

SELECT *
FROM traveller
WHERE t_name LIKE "d%";

SELECT *
FROM traveller
WHERE email REGEXP '[q-s]a';

SELECT *
FROM traveller
WHERE phone IS NULL;

SELECT *
FROM traveller
ORDER BY t_name ASC, email ASC;

SELECT *
FROM accommodation
LIMIT 3;

SELECT preference_ID, t_name, phone, min_budget, max_budget, accommodation_type
FROM preferences
JOIN traveller
	ON preferences.traveller_ID = traveller.traveller_ID;

SELECT p.preference_ID, t_name AS Traveller_Name, phone, min_budget, max_budget, accommodation_type
FROM preferences p
JOIN traveller t
	ON p.traveller_ID = t.traveller_ID;
    
SELECT b.booking_ID, accommodation_type, transport_mode, destination, total_cost, b_status
FROM booking b
JOIN preferences p
	ON b.preference_ID = p.preference_ID
JOIN transportation tr
	ON b.transport_ID = tr.transport_ID 
JOIN accommodation a
	ON b.accommodation_ID = a.accommodation_ID;
    
SELECT p.preference_ID, t_name AS Traveller_Name, phone, min_budget, max_budget, accommodation_type
FROM preferences p
LEFT JOIN traveller t
	USING (traveller_ID)
LEFT JOIN booking b
	USING (preference_ID)
ORDER BY p.traveller_ID;

SELECT b.booking_ID, p.food_pref
FROM booking b
NATURAL JOIN preferences p;

SELECT b.accommodation_ID AS accom, p.transport_mode AS transport
FROM booking b
CROSS JOIN preferences p
ORDER BY b.accommodation_ID

-- ###############################################TRIGGERS#################################################
-- Trigger for Data Integrity
DELIMITER //
CREATE TRIGGER check_budget
BEFORE INSERT ON PREFERENCES
FOR EACH ROW
BEGIN
    IF NEW.min_budget > NEW.max_budget THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Minimum budget cannot be greater than maximum budget';
    END IF;
END;
//
DELIMITER ;

INSERT INTO PREFERENCES (preference_ID, accommodation_type, min_budget, max_budget, transport_mode, food_pref, language_pref, traveller_ID, agency_ID)
VALUES
    (11, 'Hotel', 300.00, 200.00, 'Airplane', 'Vegetarian', 'English', 1, 101);

-- ----------------------------------------------------------------------------------------------------------
-- Trigger for Automated Tasks:
DELIMITER //

CREATE TRIGGER update_availability
AFTER INSERT ON booking
FOR EACH ROW
BEGIN
    IF NEW.b_status = 'Confirmed' THEN
        UPDATE accommodation
        SET availability = false
        WHERE accommodation_ID = NEW.accommodation_ID;
    ELSEIF NEW.b_status = 'Cancelled' THEN
        UPDATE accommodation
        SET availability = true
        WHERE accommodation_ID = NEW.accommodation_ID;
    END IF;
END;
//
DELIMITER ;

-- Inserting a Cancelled booking 
INSERT INTO booking (booking_ID, b_date, b_status, total_cost, preference_ID, agency_ID, transport_ID, accommodation_ID)
VALUES
    (12, '2023-12-31', 'Cancelled', 0.00, NULL, 102, 203, 304);

-- Checking accommodation availability
SELECT accommodation_ID, accom_name, availability
FROM accommodation
WHERE accommodation_ID = 304;

-- -------------------------------------------------------------------------------------------------

###############################################SECURITY################################################
-- Create users
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin_password';
CREATE USER 'staff'@'localhost' IDENTIFIED BY 'staff_password';
CREATE USER 'traveller'@'localhost' IDENTIFIED BY 'traveller_password';

-- Grant permissions
GRANT ALL PRIVILEGES ON TravelBookingSystem.* TO 'admin'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON TravelBookingSystem.* TO 'staff'@'localhost';
GRANT SELECT ON TravelBookingSystem.* TO 'traveller'@'localhost';

-- Create roles
CREATE ROLE 'admin_role';
CREATE ROLE 'staff_role';
CREATE ROLE 'traveller_role';

-- Grant roles to users
GRANT 'admin_role' TO 'admin'@'localhost';
GRANT 'staff_role' TO 'staff'@'localhost';
GRANT 'traveller_role' TO 'traveller'@'localhost';

-- Grant table permissions for TRAVELLER
GRANT SELECT, INSERT, UPDATE, DELETE ON TravelBookingSystem.TRAVELLER TO 'staff_role';
GRANT SELECT ON TravelBookingSystem.TRAVELLER TO 'traveller_role';

-- Grant table permissions for TRAVEL_AGENCY
GRANT SELECT, INSERT, UPDATE, DELETE ON TravelBookingSystem.TRAVEL_AGENCY TO 'staff_role';
GRANT SELECT ON TravelBookingSystem.TRAVEL_AGENCY TO 'traveller_role';

-- Grant table permissions for TRANSPORTATION
GRANT SELECT, INSERT, UPDATE, DELETE ON TravelBookingSystem.TRANSPORTATION TO 'staff_role';
GRANT SELECT ON TravelBookingSystem.TRANSPORTATION TO 'traveller_role';

-- Grant table permissions for ACCOMMODATION
GRANT SELECT, INSERT, UPDATE, DELETE ON TravelBookingSystem.ACCOMMODATION TO 'staff_role';
GRANT SELECT ON TravelBookingSystem.ACCOMMODATION TO 'traveller_role';

-- Grant table permissions for PREFERENCES
GRANT SELECT, INSERT, UPDATE, DELETE ON TravelBookingSystem.PREFERENCES TO 'staff_role';
GRANT SELECT ON TravelBookingSystem.PREFERENCES TO 'traveller_role';

-- Grant table permissions for BOOKING
GRANT SELECT, INSERT, UPDATE, DELETE ON TravelBookingSystem.BOOKING TO 'staff_role';
GRANT SELECT ON TravelBookingSystem.BOOKING TO 'traveller_role';

SHOW GRANTS FOR 'admin'@'localhost';
SHOW GRANTS FOR 'staff'@'localhost';
SHOW GRANTS FOR 'traveller'@'localhost';
########################################ADDITINOAL FEATURES###############################

-- Audit booking table for logging changes
CREATE TABLE audit_booking (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_ID INT,
    b_date DATE,
    b_status VARCHAR(50),
    total_cost DECIMAL(10, 2),
    preference_ID INT,
    agency_ID INT,
    transport_ID INT,
    accommodation_ID INT,
    action_type VARCHAR(50),
    action_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the trigger to log changes to the BOOKING table
DELIMITER //
CREATE TRIGGER booking_audit_trigger
AFTER INSERT ON BOOKING
FOR EACH ROW
BEGIN
    INSERT INTO audit_booking (booking_ID, b_date, b_status, total_cost, preference_ID, agency_ID, transport_ID, accommodation_ID, action_type)
    VALUES (NEW.booking_ID, NEW.b_date, NEW.b_status, NEW.total_cost, NEW.preference_ID, NEW.agency_ID, NEW.transport_ID, NEW.accommodation_ID, 'INSERT');
END;
//
DELIMITER ;

-- Inserting new tuple into booking
INSERT INTO booking (booking_ID, b_date, b_status, total_cost, preference_ID, agency_ID, transport_ID, accommodation_ID)
VALUES (15, '2024-01-01', 'Confirmed', 800.00, NULL, 101, 201, 301);
    
SELECT * FROM audit_booking;

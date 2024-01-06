
//ALL CODE EXECUTED IN MONGODB SHELL

use TravelBookingSystem;

// Create collections for the TMS
db.createCollection("travellers");
db.createCollection("travel_agencies");
db.createCollection("transportations");
db.createCollection("accommodations");
db.createCollection("preferences");
db.createCollection("bookings");

// Inserting documents with sample data 
db.travellers.insertMany([
    { traveller_ID: 1, address: '9362 Buell Place', phone: '487-298-1107', t_name: 'Mabelle Marages', email: 'mmarages0@netvibes.com' },
    { traveller_ID: 2, address: '6 Mallory Center', phone: '807-380-3239', t_name: 'Denise Proske', email: 'dproske1@fotki.com' },
    { traveller_ID: 3, address: '819 Dahle Trail', phone: '211-707-1315', t_name: 'Ansley Drewitt', email: 'adrewitt2@mayoclinic.com' },
    { traveller_ID: 4, address: '8 Atwood Court', phone: null, t_name: 'Farrel Sayton', email: 'fsayton3@upenn.edu' },
    { traveller_ID: 5, address: '154 Mendota Park', phone: '741-164-5431', t_name: 'Bordy Basill', email: null },
    { traveller_ID: 6, address: '5 Bellgrove Circle', phone: '101-414-6216', t_name: 'Melisandra Pashan', email: 'mpashan5@usa.gov' },
    { traveller_ID: 7, address: '225 Riverside Parkway', phone: '809-681-3850', t_name: 'Tabbatha Forsard', email: 'tforsard6@smh.com.au' },
    { traveller_ID: 8, address: '162 Green Ridge Trail', phone: '919-347-6859', t_name: 'Claresta Stebbins', email: 'cstebbins7@un.org' },
    { traveller_ID: 9, address: '4 Dakota Plaza', phone: '613-442-8440', t_name: 'Davon Blasgen', email: 'dblasgen8@yale.edu' },
    { traveller_ID: 10, address: '151 Valley Edge Point', phone: '188-275-6430', t_name: 'Gun Collis', email: 'gcollis9@merriam-webster.com' }
]);


db.travel_agencies.insertMany([
    { agency_ID: 101, email: 'info@agency1.com', phone: '555-1111', address: '321 Agency St', ta_name: 'Travel Experts', service_type: 'Full-Service' },
    { agency_ID: 102, email: 'info@agency2.com', phone: '555-2222', address: '654 Agency Ave', ta_name: 'Adventure Tours', service_type: 'Adventure' },
    { agency_ID: 103, email: 'info@agency3.com', phone: '555-3333', address: '987 Agency Blvd', ta_name: 'Budget Travel', service_type: 'Budget-Friendly' },
    { agency_ID: 104, email: 'info@agency4.com', phone: '555-4444', address: '1234 Agency Ln', ta_name: 'Luxury Escapes', service_type: 'Luxury' },
    { agency_ID: 105, email: 'info@agency5.com', phone: '555-5555', address: '567 Agency Rd', ta_name: 'Cruise Masters', service_type: 'Cruise' }
]);


db.transportations.insertMany([
    { transport_ID: 201, cost: 50.00, departure: ISODate('2023-01-01T08:00:00Z'), arrival: ISODate('2023-01-01T10:00:00Z'), t_mode: 'Bus', destination: 'Amsterdam' },
    { transport_ID: 202, cost: 100.00, departure: ISODate('2023-02-15T12:00:00Z'), arrival: ISODate('2023-02-15T15:00:00Z'), t_mode: 'Train', destination: 'London' },
    { transport_ID: 203, cost: 75.00, departure: ISODate('2023-07-30T16:00:00Z'), arrival: ISODate('2023-07-30T17:00:00Z'), t_mode: 'Taxi', destination: 'Tokyo' },
    { transport_ID: 204, cost: 50.00, departure: ISODate('2023-08-04T21:00:00Z'), arrival: ISODate('2023-09-04T07:00:00Z'), t_mode: 'Airplane', destination: 'Lagos' },
    { transport_ID: 205, cost: 100.00, departure: ISODate('2023-09-12T20:00:00Z'), arrival: ISODate('2023-09-12T14:00:00Z'), t_mode: 'Ferry', destination: 'Dublin' }
]);

db.accommodations.insertMany([
    { accommodation_ID: 301, location: 'Downtown', accom_name: 'Luxury Hotel', cost_per_night: 300.00, accom_type: 'Hotel', availability: true },
    { accommodation_ID: 302, location: 'Suburb', accom_name: 'Cozy Apartment', cost_per_night: 50.00, accom_type: 'Apartment', availability: true },
    { accommodation_ID: 303, location: 'City Center', accom_name: 'Budget Hostel', cost_per_night: 30.00, accom_type: 'Hostel', availability: true },
    { accommodation_ID: 304, location: 'Downtown', accom_name: 'Amazing Villa', cost_per_night: 500.00, accom_type: 'Villa', availability: true },
    { accommodation_ID: 305, location: 'Suburb', accom_name: 'Super Mansion', cost_per_night: 1000.00, accom_type: 'Mansion', availability: true }
]);


db.preferences.insertMany([
    { preference_ID: 1, accommodation_type: 'Hotel', min_budget: 100.00, max_budget: 200.00, transport_mode: 'Airplane', food_pref: 'Vegetarian', language_pref: 'English', traveller_ID: 1, agency_ID: 101 },
    { preference_ID: 2, accommodation_type: 'Apartment', min_budget: 150.00, max_budget: 300.00, transport_mode: 'Train', food_pref: 'Halal', language_pref: 'French', traveller_ID: 2, agency_ID: 101 },
    { preference_ID: 3, accommodation_type: 'Hostel', min_budget: 50.00, max_budget: 100.00, transport_mode: 'Bus', food_pref: 'None', language_pref: 'Spanish', traveller_ID: 3, agency_ID: 102 },
    { preference_ID: 4, accommodation_type: 'Villa', min_budget: 1200.00, max_budget: 2000.00, transport_mode: 'Taxi', food_pref: 'Vegetarian', language_pref: 'English', traveller_ID: 4, agency_ID: 102 },
    { preference_ID: 5, accommodation_type: 'Apartment', min_budget: 350.00, max_budget: 500.00, transport_mode: 'Airplane', food_pref: 'Vegan', language_pref: 'Yoruba', traveller_ID: 5, agency_ID: 103 },
    { preference_ID: 6, accommodation_type: 'Hostel', min_budget: 200.00, max_budget: 250.00, transport_mode: 'Bus', food_pref: 'None', language_pref: 'Spanish', traveller_ID: 6, agency_ID: 103 },
    { preference_ID: 7, accommodation_type: 'Hotel', min_budget: 500.00, max_budget: 600.00, transport_mode: 'Airplane', food_pref: 'Vegetarian', language_pref: 'Arabic', traveller_ID: 7, agency_ID: 104 },
    { preference_ID: 8, accommodation_type: 'Apartment', min_budget: 150.00, max_budget: 300.00, transport_mode: 'Train', food_pref: 'Vegan', language_pref: 'French', traveller_ID: 8, agency_ID: 104 },
    { preference_ID: 9, accommodation_type: 'Hostel', min_budget: 50.00, max_budget: 100.00, transport_mode: 'Bus', food_pref: 'Halal', language_pref: 'Hindu', traveller_ID: 9, agency_ID: 105 },
    { preference_ID: 10, accommodation_type: 'Mansion', min_budget: 3000.00, max_budget: 5000.00, transport_mode: 'Ferry', food_pref: 'Vegetarian', language_pref: 'English', traveller_ID: 10, agency_ID: 105 }
]);



db.bookings.insertMany([
    { booking_ID: 1, b_date: ISODate('2023-01-01'), b_status: 'Confirmed', total_cost: 500.00, preference_ID: 1, agency_ID: 101, transport_ID: 204, accommodation_ID: 305 },
    { booking_ID: 2, b_date: ISODate('2023-02-15'), b_status: 'Pending', total_cost: 700.00, preference_ID: 2, agency_ID: 101, transport_ID: 202, accommodation_ID: 302 },
    { booking_ID: 3, b_date: ISODate('2023-03-04'), b_status: 'Cancelled', total_cost: 400.00, preference_ID: 3, agency_ID: 102, transport_ID: 201, accommodation_ID: 303 },
    { booking_ID: 4, b_date: ISODate('2023-09-20'), b_status: 'Cancelled', total_cost: 2500.00, preference_ID: 4, agency_ID: 102, transport_ID: 203, accommodation_ID: 304 },
    { booking_ID: 5, b_date: ISODate('2023-02-15'), b_status: 'Confirmed', total_cost: 750.00, preference_ID: 5, agency_ID: 103, transport_ID: 204, accommodation_ID: 302 },
    { booking_ID: 6, b_date: ISODate('2023-05-17'), b_status: 'Confirmed', total_cost: 600.00, preference_ID: 6, agency_ID: 103, transport_ID: 205, accommodation_ID: 303 },
    { booking_ID: 7, b_date: ISODate('2023-07-01'), b_status: 'Confirmed', total_cost: 900.00, preference_ID: 7, agency_ID: 104, transport_ID: 204, accommodation_ID: 301 },
    { booking_ID: 8, b_date: ISODate('2023-06-15'), b_status: 'Pending', total_cost: 500.00, preference_ID: 8, agency_ID: 104, transport_ID: 202, accommodation_ID: 302 },
    { booking_ID: 9, b_date: ISODate('2023-01-29'), b_status: 'Cancelled', total_cost: 300.00, preference_ID: 9, agency_ID: 105, transport_ID: 201, accommodation_ID: 303 },
    { booking_ID: 10, b_date: ISODate('2023-12-30'), b_status: 'Confirmed', total_cost: 6500.00, preference_ID: 10, agency_ID: 105, transport_ID: 205, accommodation_ID: 305 }
]);

// Create indexes to improve query performance
db.travellers.createIndex({ traveller_ID: 1 });
db.travel_agencies.createIndex({ agency_ID: 1 });
db.transportations.createIndex({ transport_ID: 1 });
db.accommodations.createIndex({ accommodation_ID: 1 });
db.preferences.createIndex({ preference_ID: 1 });
db.bookings.createIndex({ booking_ID: 1 });


// Some examples of queries that can be executed
db.travellers.find({ traveller_ID: { $lte: 3 } }, { phone: 1, _id: 0 });

db.travel_agencies.distinct('phone');

db.transportations.find({ arrival: { $gt: ISODate('2023-08-01') } });

db.transportations.find({ $or: [{ cost: { $gte: 75.00 } }, { t_mode: 'Train' }] });

db.preferences.find({ $nor: [{ max_budget: { $gt: 500.00 } }, { accommodation_type: 'Hotel' }] });

db.bookings.find({ b_status: { $in: ['Pending', 'Confirmed'] } });

db.bookings.find({ total_cost: { $gte: 550, $lte: 1000 } });

db.travellers.find({ t_name: /^d/i });



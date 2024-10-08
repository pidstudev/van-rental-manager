-- Drop existing tables if they exist
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS van_manager_app;
DROP TABLE IF EXISTS rentals;

-- Create table for users
CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    email TEXT NOT NULL,
    phone_number TEXT
);

-- Create table for van rental manager app
CREATE TABLE van_manager_app (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    rental_date_from DATETIME NOT NULL,
    rental_date_to DATETIME NOT NULL,
    client_contact TEXT NOT NULL,
    pickup_location TEXT NOT NULL,
    destination TEXT NOT NULL,
    agreed_price REAL NOT NULL,
    completed BOOLEAN NOT NULL DEFAULT 0,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- Create table for rentals (for notifications)
CREATE TABLE rentals (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT NOT NULL,
    rental_date DATE NOT NULL,
    email_notification_time TIMESTAMP
);

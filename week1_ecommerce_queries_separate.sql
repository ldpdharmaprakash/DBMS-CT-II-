-- E-COMMERCE ORDER MANAGEMENT DATABASE SYSTEM
-- WEEK 1 - USER AND CUSTOMER DATABASE MODULE
-- Each SQL query is a separate block.
-- Extracted from the uploaded Week 1 document.

CREATE USER 'ecommerce_user'@'localhost' IDENTIFIED BY 'Ecommerce@123';

CREATE DATABASE ecommerce_db;

SHOW DATABASES;

USE ecommerce_db;

SELECT DATABASE();

CREATE TABLE users ( user_id INT PRIMARY KEY AUTO_INCREMENT, username VARCHAR(50) NOT NULL UNIQUE, email VARCHAR(100) NOT NULL UNIQUE, password_hash VARCHAR(255) NOT NULL, role VARCHAR(20) NOT NULL DEFAULT 'CUSTOMER', status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE', created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP );

DESC users;

SHOW TABLES;

INSERT INTO users (username, email, password_hash, role, status) VALUES ('admin', 'admin@ecommerce.com', 'HASHED_PASSWORD_ADMIN', 'ADMIN', 'ACTIVE');

INSERT INTO users (username, email, password_hash, role, status) VALUES ('arun', 'arun@gmail.com', 'HASHED_PASSWORD_001', 'CUSTOMER', 'ACTIVE'), ('bala', 'bala@gmail.com', 'HASHED_PASSWORD_002', 'CUSTOMER', 'ACTIVE'), ('divya', 'divya@gmail.com', 'HASHED_PASSWORD_003', 'CUSTOMER', 'ACTIVE'), ('karthik', 'karthik@gmail.com', 'HASHED_PASSWORD_004', 'CUSTOMER', 'ACTIVE'), ('meena', 'meena@gmail.com', 'HASHED_PASSWORD_005', 'CUSTOMER', 'ACTIVE');

SELECT * FROM users;

SELECT username, email FROM users;

SELECT * FROM users WHERE role = 'CUSTOMER';

SELECT * FROM users WHERE role = 'ADMIN';

SELECT * FROM users WHERE status = 'ACTIVE';

SELECT * FROM users WHERE status = 'INACTIVE';

SELECT * FROM users WHERE username = 'arun';

SELECT * FROM users WHERE email = 'arun@gmail.com';

SELECT * FROM users ORDER BY username ASC;

SELECT COUNT(*) AS total_users FROM users;

UPDATE users SET username = 'arun_kumar' WHERE user_id = 2;

UPDATE users SET email = 'arunkumar@gmail.com' WHERE user_id = 2;

UPDATE users SET status = 'INACTIVE' WHERE user_id = 3;

UPDATE users SET status = 'ACTIVE' WHERE user_id = 3;

UPDATE users SET role = 'SELLER' WHERE user_id = 5;

UPDATE users SET username = 'new_admin', email = 'newadmin@ecommerce.com' WHERE user_id = 1;

UPDATE users SET status = 'ACTIVE' WHERE status = 'INACTIVE';

UPDATE users SET role = 'CUSTOMER' WHERE role = 'SELLER' AND user_id = 5;

UPDATE users SET status = 'ACTIVE' WHERE email LIKE '%@gmail.com';

UPDATE users SET status = 'INACTIVE' WHERE user_id IN (3, 4);

SELECT * FROM users WHERE user_id = 2;

Update  users SET email = 'newemail@gmail.com' WHERE user_id = 2;

CREATE TABLE customer ( customer_id INT PRIMARY KEY AUTO_INCREMENT, user_id INT NOT NULL UNIQUE, customer_name VARCHAR(100) NOT NULL, phone VARCHAR(15) UNIQUE, address VARCHAR(200) NOT NULL, city VARCHAR(50) NOT NULL, state VARCHAR(50), pincode VARCHAR(10), registration_date DATE NOT NULL, status VARCHAR(20) DEFAULT 'ACTIVE', FOREIGN KEY (user_id) REFERENCES users(user_id) );

DESC customer;

SHOW CREATE TABLE customer;

INSERT INTO customer (user_id, customer_name, phone, address, city, state, pincode, registration_date, status) VALUES (2, 'Arun Kumar', '9876543210', '12 Main Road', 'Chennai', 'Tamil Nadu', '600001', '2026-01-10', 'ACTIVE'), (3, 'Bala Kumar', '9876543211', '45 Anna Street', 'Erode', 'Tamil Nadu', '638001', '2026-01-12', 'ACTIVE'), (4, 'Divya Raj', '9876543212', '23 Gandhi Road', 'Coimbatore', 'Tamil Nadu', '641001', '2026-01-15', 'ACTIVE'), (5, 'Karthik S', '9876543213', '67 Park Road', 'Salem', 'Tamil Nadu', '636001', '2026-01-18', 'ACTIVE'), (6, 'Meena Devi', '9876543214', '89 Lake Street', 'Madurai', 'Tamil Nadu', '625001', '2026-01-20', 'ACTIVE');

SELECT * FROM customer;

SELECT customer_name, city FROM customer;

SELECT * FROM customer WHERE city = 'Chennai';

SELECT * FROM customer WHERE state = 'Tamil Nadu';

SELECT * FROM customer WHERE status = 'ACTIVE';

SELECT * FROM customer WHERE customer_name LIKE 'A%';

SELECT * FROM customer WHERE customer_name LIKE '%Kumar%';

SELECT * FROM customer WHERE city IN ('Chennai', 'Erode');

SELECT * FROM customer WHERE registration_date > '2026-01-15';

SELECT * FROM customer ORDER BY customer_name ASC;

SELECT * FROM customer ORDER BY registration_date DESC;

UPDATE customer SET phone = '9999999999' WHERE customer_id = 1;

UPDATE customer SET address = '100 New Main Road' WHERE customer_id = 1;

UPDATE customer SET city = 'Bangalore' WHERE customer_id = 2;

UPDATE customer SET state = 'Karnataka' WHERE customer_id = 2;

UPDATE customer SET pincode = '560001' WHERE customer_id = 2;

UPDATE customer SET customer_name = 'Divya R' WHERE customer_id = 3;

UPDATE customer SET phone = '9888888888', address = '200 New Street', city = 'Chennai' WHERE customer_id = 4;

UPDATE customer SET status = 'INACTIVE' WHERE customer_id = 5;

UPDATE customer SET status = 'ACTIVE' WHERE customer_id = 5;

UPDATE customer SET status = 'ACTIVE' WHERE city = 'Chennai';

UPDATE customer SET status = 'ACTIVE' WHERE city IN ('Chennai', 'Erode');

UPDATE customer SET status = 'INACTIVE' WHERE city = 'Salem' AND customer_id > 3;

UPDATE customer SET status = 'ACTIVE' WHERE customer_name LIKE 'A%';

UPDATE customer SET status = 'INACTIVE' WHERE registration_date < '2026-01-15';

UPDATE customer SET state = 'Tamil Nadu' WHERE city IN ('Chennai', 'Erode', 'Salem');

DELETE FROM customer WHERE customer_id = 5;

SELECT * FROM customer WHERE customer_id = 5;

DELETE FROM customer WHERE status = 'INACTIVE';

SELECT * FROM customer WHERE status = 'INACTIVE';

SELECT u.user_id, u.username, u.email, c.customer_id, c.customer_name, c.phone, c.city FROM users u JOIN customer c ON u.user_id = c.user_id;

SELECT COUNT(*) AS total_customers FROM customer;

SELECT city, COUNT(*) AS customer_count FROM customer GROUP BY city;

SELECT COUNT(*) AS active_customers FROM customer WHERE status = 'ACTIVE';

SELECT DISTINCT city FROM customer;

SELECT DISTINCT state FROM customer;

INSERT INTO users (username, email, password_hash, role) VALUES ('arun_kumar', 'another@gmail.com', 'HASHED_PASSWORD', 'CUSTOMER');

INSERT INTO users (username, email, password_hash, role) VALUES ('anotheruser', 'arun@gmail.com', 'HASHED_PASSWORD', 'CUSTOMER');

INSERT INTO customer (user_id, customer_name, phone, address, city, state, pincode, registration_date) VALUES (999, 'Test Customer', '9000000000', 'Test Address', 'Chennai', 'Tamil Nadu', '600010', '2026-03-01');

UPDATE customer SET city = 'Chennai' WHERE customer_id = 5;

UPDATE customer SET city = 'Chennai';

DELETE FROM customer;

CREATE TABLE users (...);

INSERT INTO users (...);

CREATE TABLE customer (...);

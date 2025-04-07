CREATE DATABASE Dmart_DataBase;
USE Dmart_DataBase;


CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    mobile VARCHAR(15) NOT NULL,
    password VARCHAR(100) NOT NULL,
    address TEXT NOT NULL,
    state_id INT NOT NULL,
    city_id INT NOT NULL,
    pincode VARCHAR(10) NOT NULL,
    usertype ENUM('Customer', 'Admin') NOT NULL,
    FOREIGN KEY (state_id) REFERENCES states(id),
    FOREIGN KEY (city_id) REFERENCES cities(id)
);


-- States Table
CREATE TABLE states (
    id INT PRIMARY KEY AUTO_INCREMENT,
    state_name VARCHAR(100) NOT NULL
);
INSERT INTO states (state_name) VALUES
('Andhra Pradesh'),     -- ID: 1
('Telangana'),          -- ID: 2
('Karnataka'),          -- ID: 3
('Maharashtra'),        -- ID: 4
('Tamil Nadu'),         -- ID: 5
('Uttar Pradesh');      -- ID: 6


-- Cities Table
CREATE TABLE cities (
    id INT PRIMARY KEY AUTO_INCREMENT,
    city_name VARCHAR(100) NOT NULL,
    state_id INT NOT NULL,
    FOREIGN KEY (state_id) REFERENCES states(id)
);
-- Andhra Pradesh (ID = 1)
INSERT INTO cities (city_name, state_id) VALUES
('Vijayawada', 1),
('Visakhapatnam', 1),
('Guntur', 1),
('Nellore', 1),
('Kurnool', 1);

-- Telangana (ID = 2)
INSERT INTO cities (city_name, state_id) VALUES
('Hyderabad', 2),
('Warangal', 2),
('Nizamabad', 2),
('Khammam', 2),
('Karimnagar', 2);

-- Karnataka (ID = 3)
INSERT INTO cities (city_name, state_id) VALUES
('Bangalore', 3),
('Mysore', 3),
('Mangalore', 3),
('Hubli', 3),
('Belgaum', 3);

-- Maharashtra (ID = 4)
INSERT INTO cities (city_name, state_id) VALUES
('Mumbai', 4),
('Pune', 4),
('Nagpur', 4),
('Nashik', 4),
('Aurangabad', 4);

-- Tamil Nadu (ID = 5)
INSERT INTO cities (city_name, state_id) VALUES
('Chennai', 5),
('Coimbatore', 5),
('Madurai', 5),
('Salem', 5),
('Tirunelveli', 5);

-- Uttar Pradesh (ID = 6)
INSERT INTO cities (city_name, state_id) VALUES
('Lucknow', 6),
('Kanpur', 6),
('Varanasi', 6),
('Agra', 6),
('Prayagraj', 6);


CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    mrp DOUBLE,
    dmart_price DOUBLE,
    discount DOUBLE,
    image_url VARCHAR(255),
    unit VARCHAR(50)
);
INSERT INTO products (name, mrp, dmart_price, discount, image_url, unit) VALUES
('Dodla Pure Cow Ghee (Neyyi) : 1 Litre', 760, 560, 200, 'https://5.imimg.com/data5/ME/DV/KL/SELLER-28324032/1-ltr-dodla-cow-ghee-jar-500x500.jpg', '1 L (₹ 0.56 / 1 ml)'),
('Parachute Coconut Oil : 1 Litre', 495, 375, 120, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX0NB7Z4u-jS1L9YzK1bwi12-0Vl0-UaRCnA&s', '1 L (₹ 0.38 / 1 ml)'),
('Dabur Honey : 1.3 kgs', 635, 390, 245, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQlCYpWJ3Gl1xQNcdOBwnv0CxuQ9War4AZ-g&s', '1.3 kg (₹ 300.00 / 1 kg)'),
('Sampurn Organic Toor Dal', 765, 480, 145, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbdhqu7eY4-3hOEp1Pvx08XVtZBeValoloVQ&s', '1.5 kg (₹ 382.5 / 1 kg)');



SELECT * FROM users;
Drop table users;

SELECT * FROM states;
Drop table states;

SELECT * FROM cities;
Drop table cities;

SELECT * FROM products;
Drop table products;


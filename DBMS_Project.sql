create database n35;
use n35;
CREATE TABLE mall (
    mall_id INT PRIMARY KEY AUTO_INCREMENT,
    mall_name VARCHAR(255) NOT NULL,
    mall_contact_no VARCHAR(20),
    mall_opening_time TIME,
    mall_closing_time TIME,
    mall_location VARCHAR(255),
    UNIQUE(mall_name, mall_location)
);
INSERT INTO mall (mall_id, mall_name, mall_contact_no, 
mall_opening_time, mall_closing_time, mall_location)
VALUES 
(06127, 'PVD Mall', '123-456-7890', '09:00:00', '21:00:00', 
'Gulmohar road, Near NMIMS collage, vile parle west, mumbai');
SELECT * FROM mall;
-- Given table is not in 1NF 
CREATE TABLE footwears (
    brand_name VARCHAR(50),
    brand_id INT,
    brand_type VARCHAR(50),
    shop_info VARCHAR(100) -- Composite attribute containing shop_no and shop_floor
    );
-- To convert the given table in 1NF we add one more table called shop_info
    CREATE TABLE shop_info (
    shop_no int,
    shop_floor int,
    PRIMARY KEY (shop_no, shop_floor)
);
INSERT INTO shop_info(shop_no, shop_floor)VALUES
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(201, 2),
(202, 2),
(203, 2),
(204, 2),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(205, 2);
ALTER TABLE footwears
DROP COLUMN shop_info;
ALTER TABLE footwears
ADD COLUMN shop_no INT,
ADD COLUMN shop_floor INT;
ALTER TABLE footwears
ADD FOREIGN KEY (shop_no, shop_floor) REFERENCES shop_info(shop_no, shop_floor);
INSERT INTO footwears (brand_name, brand_id, brand_type, shop_no, shop_floor) VALUES
('Nike', 1001, 'Sports', 101, 1),
('Adidas', 1002, 'Sports', 102, 1),
('Reebok', 1003, 'Sports', 103, 1),
('Puma',1004, 'Sports', 104, 1),
('Vans', 1005, 'Casual', 105, 1),
('Converse', 1006, 'Casual', 106, 1),
('Gucci', 1007, 'Luxury', 201, 2),
('Louis Vuitton', 1008, 'Luxury', 202, 2),
('Prada', 1009, 'Luxury', 203, 2),
('Balenciaga', 1010, 'Luxury', 204, 2),
('Fila', 1011, 'Casual', 107, 1),
('New Balance', 1012, 'Sports', 108, 1),
('Under Armour', 1013, 'Sports', 109, 1),
('Skechers', 1014, 'Casual', 110, 1),
('Timberland', 1015, 'Outdoor', 205, 2);
SELECT * FROM footwears;
CREATE TABLE grocery (
    shop_no INT,
    shop_name VARCHAR(50),
    shop_floor INT,
    shop_id INT
);
-- Conveting the above table in 2NF 
CREATE TABLE shop_details (
    shop_id INT PRIMARY KEY,
    shop_no INT,
    shop_name VARCHAR(50),
    shop_floor INT
);
ALTER TABLE grocery
ADD FOREIGN KEY (shop_id) REFERENCES shop_details(shop_id);
INSERT INTO shop_details (shop_no, shop_name, shop_floor, shop_id) VALUES
(602, 'FreshFoods', 1, 2007),
(603, 'QuickMart', 1, 2008),
(604, 'MegaMart', 1, 2009),
(605, 'MarketFresh', 1, 2020),
(606, 'CityGrocers', 1, 2021),
(701, 'FarmersMarket', 2, 2022),
(702, 'OrganicGrove', 2, 2023),
(703, 'Nature''sBasket', 2, 2024),
(704, 'HealthPlus', 2, 2025),
(705, 'WholeFoods', 2, 2026),
(706, 'GreenGrocers', 2, 2027),
(801, 'FamilyMart', 3, 2028),
(802, 'BudgetMart', 3, 2029),
(803, 'NeighborhoodMart', 3, 2030);
SELECT * FROM shop_details;
INSERT INTO grocery (shop_id) VALUES
(2007),
(2008),
(2009),
(2020),
(2021),
(2022),
(2023),
(2024),
(2025),
(2026),
(2027),
(2028),
(2029),
(2030);
CREATE TABLE clothing (
    brand_id INT,
    brand_name VARCHAR(50),
    brand_type VARCHAR(50),
    shop_no INT,
    shop_floor INT
);
INSERT INTO clothing (brand_id, brand_name, brand_type, shop_no, shop_floor) VALUES
(31, 'Zara', 'Fashion', 301, 2),
(32, 'H&M', 'Fashion', 302, 2),
(33, 'Forever 21', 'Fashion', 303, 2),
(34, 'Uniqlo', 'Fashion', 304, 2),
(35, 'Gap', 'Fashion', 305, 2),
(36, 'American Eagle', 'Fashion', 106, 2),
(37, 'Mango', 'Fashion', 107, 2),
(38, 'Topshop', 'Fashion', 108, 2),
(39, 'Urban Outfitters', 'Fashion', 309, 2),
(40, 'Biba', 'Traditional', 310, 3),
(41, 'W', 'Traditional', 311, 3),
(42, 'Krause', 'Casual', 312, 3),
(43, 'Zudio', 'Casual', 313, 3),
(44, 'Benetton', 'Casual', 314, 3),
(45, 'Azorte', 'Casual', 315, 3);
SELECT * FROM clothing;
CREATE TABLE electronics (
    shop_no INT,
    shop_floor VARCHAR(2),
    brand_name VARCHAR(50),
    brand_id INT
);
INSERT INTO electronics (shop_no, shop_floor, brand_name, brand_id) VALUES
(401, '1', 'Sony', 3001),
(402, '1', 'Samsung', 3002),
(403, 'G', 'LG', 3003),
(404, 'G', 'Apple', 3004),
(405, '1', 'Dell', 3005),
(406, '1', 'HP', 3006),
(407, 'G', 'Lenovo', 3007),
(408, 'G', 'Microsoft', 3008),
(409, '1', 'Canon', 3009),
(410, '1', 'Nikon', 3010),
(411, 'G', 'Panasonic', 3011),
(412, 'G', 'Philips', 3012),
(413, '1', 'Bose', 3013),
(414, '1', 'JBL', 3014),
(415, 'G', 'Logitech', 3015);
SELECT * FROM electronics;
CREATE TABLE essentials (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(50),
    brand_type VARCHAR(50),
    shop_no INT,
    shop_floor INT CHECK (shop_floor IN (3, 4))
);
INSERT INTO essentials (brand_id, brand_name, brand_type, shop_no, shop_floor)
VALUES
    (3061, 'Bath & Body Works', 'Cosmetics', 501, 3),
    (3062, 'The Body Shop', 'Cosmetics', 502, 4),
    (3063, 'Forest essentials', 'Ayurvedic', 503, 3),
    (3064, 'Plum', 'Cosmetics', 504, 4),
    (3065, 'Victoria secret', 'Luxury', 505, 3),
    (3066, 'M caffeine', 'Cosmetics', 506, 4),
    (3067, 'Derma', 'Dermatics', 507, 3),
    (3068, 'ABC', 'Luxury', 508, 4),
    (3069, 'XYZ', 'Dermatics', 509, 3),
    (3070, 'PQR', 'Ayurvedic', 510, 4),
    (3071, 'UVW', 'Cosmetics', 511, 3),
    (3072, '123', 'Cosmetics', 512, 4),
    (3073, '456', 'Luxury', 513, 3),
    (3074, '789', 'Dermatics', 514, 4),
    (3075, '012', 'Luxury', 515, 3);
SELECT * FROM essentials;
CREATE TABLE food_court (
    rest_name VARCHAR(100),
    rest_type VARCHAR(50),
    rest_cuisine VARCHAR(50),
    shop_no INT,
    shop_id INT
);
INSERT INTO food_court (rest_name, rest_type, rest_cuisine, shop_no, shop_id) VALUES
('Restaurant 1', 'Fast Food', 'Burgers', 601, 1076),
('Restaurant 2', 'Cafe', 'Coffee', 602, 1077),
('Restaurant 3', 'Fine Dining', 'Italian', 603, 1078),
('Restaurant 4', 'Casual Dining', 'Mexican', 604, 1079),
('Restaurant 5', 'Fast Food', 'Pizza',605, 1080),
('Restaurant 6', 'Street Food', 'Thai', 606, 1081),
('Restaurant 7', 'Casual Dining', 'Chinese', 607, 1082),
('Restaurant 8', 'Cafe', 'Sandwiches', 608, 1083),
('Restaurant 9', 'Fast Food', 'Fried Chicken', 609, 1084),
('Restaurant 10', 'Casual Dining', 'Indian', 610, 1085),
('Restaurant 11', 'Fast Food', 'Tacos', 611, 1086),
('Restaurant 12', 'Fine Dining', 'French', 612, 1087),
('Restaurant 13', 'Casual Dining', 'Mediterranean', 613, 1088),
('Restaurant 14', 'Fast Food', 'Sushi', 614, 1089),
('Restaurant 15', 'Street Food', 'Vietnamese', 615, 1090);
SELECT * FROM food_court;
CREATE TABLE game_zone (
    store_name VARCHAR(255),
    store_id INT,
    store_limit INT,
    game_type VARCHAR(50),
    card_price DECIMAL(10, 2)
);
INSERT INTO game_zone (store_name, store_id, store_limit, game_type, card_price) VALUES
('Store A', 2091, 18, 'Board Games', 699.99),
('Store B', 2092, 16, 'Card Games', 500.50),
('Store C', 2093, 21, 'Video Games', 299.99),
('Store D', 2094, 12, 'Board Games', 1200.75),
('Store E', 2095, 18, 'Card Games', 349.99),
('Store F', 2096, 14, 'Video Games', 499.99),
('Store G', 2097, 16, 'Board Games', 899.49),
('Store H', 2098, 20, 'Card Games', 599.99),
('Store I', 2099, 17, 'Video Games', 199.99),
('Store J', 2100, 15, 'Board Games', 799.99),
('Store K', 2101, 19, 'Card Games', 450.50),
('Store L', 2102, 20, 'Video Games', 3499.99),
('Store M', 2103, 18, 'Board Games', 999.99),
('Store N', 2104, 16, 'Card Games', 799.99),
('Store O', 2105, 22, 'Video Games', 499.99);
SELECT * FROM game_zone;
CREATE TABLE parking (
    park_floor VARCHAR(4),
    park_zone VARCHAR(10),
    park_pillar_no INT
);
INSERT INTO parking ( park_floor , park_zone , park_pillar_no ) VALUES
('LG', 'Zone 1', 1),
('LG', 'Zone 1', 2),
('LG', 'Zone 1', 3),
('LG', 'Zone 1', 4),
('LG', 'Zone 1', 5),
('LG', 'Zone 2', 6),
('LG', 'Zone 2', 7),
('LG', 'Zone 2', 8),
('LG', 'Zone 2', 9),
('LG', 'Zone 2', 10),
('G', 'Zone 3', 11),
('G', 'Zone 3', 12),
('G', 'Zone 3', 14),
('G', 'Zone 3', 15),
('G', 'Zone 4', 16),
('G', 'Zone 4', 17),
('G', 'Zone 4', 18),
('G', 'Zone 4', 19),
('G', 'Zone 4', 20);
SELECT * FROM parking;
CREATE TABLE theater (
    screen_no INT,
    screen_floor INT,
    screen_type VARCHAR(50),   
    ticket_price VARCHAR(50)
);
ALTER TABLE theater 
ADD primary key(screen_no);
INSERT INTO theater (screen_no, screen_floor, screen_type, ticket_price)
VALUES
    (1, 1, '2D', '250-500'),
    (2, 1, '3D', '300-600'),
    (3, 2, '2D', '250-500'),
    (4, 2, 'IMAX', '200-450'),
    (5, 3, '3D', '300-600'),
    (6, 3, '2D', '250-500'),
    (7, 1, 'IMAX', '200-450'),
    (8, 2, '3D', '300-600'),
    (9, 2, '2D', '250-500'),
    (10, 3, '2D', '250-500'),
    (11, 1, '3D', '300-600'),
    (12, 2, 'IMAX', '200-450'),
    (13, 3, '2D', '250-500'),
    (14, 1, '2D', '250-500'),
    (15, 3, '3D', '300-600');
SELECT * FROM theater;
CREATE TABLE staff (
    staff_name VARCHAR(50),
    staff_id INT,
    staff_salary INT,
    staff_type VARCHAR(50),
   staff_shift INT
    );
INSERT INTO staff  (staff_name , staff_id, staff_salary, staff_type , staff_shift ) VALUES
('Nina', 100, 1200,'cleaning' , 1),
('Nikki', 101, 1200,'cleaning' , 1),
('Neha', 102, 1200,'cleaning' , 2),
('sneha', 103, 1200,'security' , 2),
('sanya', 104, 1200,'security' , 2),
('titu', 105, 1300,'cleaning' , 1),
('Nike', 106, 1300,'cleaning' , 1),
('Nikunj', 107, 1300,'cleaning' , 2),
('Natwar', 108, 1300,'security' , 2),
('Naman', 109, 1300,'security' , 1),
('Naina', 110, 1300,'security' , 1),
('tina', 111, 1500,'security' , 2),
('ishani', 112, 1500,'servingstaff' , 2),
('bhairav', 113, 1500,'servingstaff' , 1),
('sara', 114, 1500,'servingstaff' , 2),
('kirti', 115, 1500,'servingstaff' , 1);
SELECT * FROM staff;
CREATE TABLE food_area (
    theater_screen_no INT,
    food_name VARCHAR(100),
    food_type VARCHAR(50),
    food_counter_no INT,
    combos_types VARCHAR(100),
    food_price DECIMAL(10, 2),
    FOREIGN KEY (theater_screen_no) REFERENCES theater(screen_no)
);
INSERT INTO food_area (theater_screen_no, food_name, food_type, food_counter_no, combos_types, food_price)
VALUES
    (1, 'Popcorn', 'Snack', 1, 'Regular, Large', 195.50),
    (1, 'Soda', 'Beverage', 1, 'Small, Medium, Large', 203.00),
    (2, 'Hot Dog', 'Snack', 2, 'Regular, Combo', 237.00),
    (2, 'Nachos', 'Snack', 2, 'Regular, Large', 218.50),
    (3, 'Pizza Slice', 'Snack', 3, 'Cheese, Pepperoni', 126.00),
    (3, 'Ice Cream', 'Dessert', 3, 'Vanilla, Chocolate', 324.50),
    (4, 'Burger', 'Snack', 1, 'Regular, Combo', 109.00),
    (4, 'Fries', 'Snack', 1, 'Regular, Large', 234.00),
    (5, 'Candy', 'Snack', 2, 'Assorted', 112.50),
    (5, 'Slushie', 'Beverage', 2, 'Regular, Large', 214.50),
    (6, 'Pretzel', 'Snack', 3, 'Regular, Combo', 326.50),
    (6, 'Smoothie', 'Beverage', 3, 'Fruit, Veggie', 365.00),
    (7, 'Chicken Tenders', 'Snack', 1, 'Regular, Combo', 128.50),
    (7, 'Onion Rings', 'Snack', 1, 'Regular, Large', 325.00),
    (8, 'Wings', 'Snack', 2, 'Buffalo, BBQ', 310.00),
    (8, 'Milkshake', 'Beverage', 2, 'Vanilla, Strawberry', 236.00),
    (9, 'Churros', 'Snack', 3, 'Regular, Large', 346.00),
    (9, 'Frozen Yogurt', 'Dessert', 3, 'Cup, Cone', 434.00),
    (10, 'Tacos', 'Snack', 1, 'Beef, Chicken', 347.00),
    (10, 'Burrito', 'Snack', 1, 'Regular, Large', 128.00),
    (11, 'Pretzel Bites', 'Snack', 2, 'Regular, Large', 345.50),
    (11, 'Lemonade', 'Beverage', 2, 'Regular, Large', 324.00),
    (12, 'Sushi Roll', 'Snack', 3, 'California, Spicy Tuna', 312.00),
    (12, 'Green Tea Ice Cream', 'Dessert', 3, 'Scoop, Cup', 126.50),
    (13, 'Cotton Candy', 'Snack', 1, 'Regular, Large', 233.50),
    (13, 'Soda Float', 'Beverage', 1, 'Root Beer, Cola', 125.00),
    (14, 'Popcorn Chicken', 'Snack', 2, 'Regular, Large', 236.00),
    (14, 'Bubble Tea', 'Beverage', 2, 'Regular, Large', 325.50),
    (15, 'Loaded Fries', 'Snack', 3, 'Regular, Large', 127.50),
    (15, 'Fruit Cup', 'Snack', 3, 'Assorted', 344.00);
SELECT * FROM food_area;    

-- 1) Check what will be the food price if it is incremented by 10 rs 
-- for each route (Give new column as new_food_price). 
SELECT food_price, food_price+10 as new_food_price 
FROM food_area;

-- 2) Display distinct staff types
SELECT DISTINCT staff_type
FROM staff;

-- 3) Update card price of store B from 500.50 to 600.00
UPDATE game_zone
SET card_price = 600.00
WHERE store_name = 'Store B';
SELECT card_price
FROM game_zone
WHERE store_name = 'Store B';

-- 4) Write a query to insert a new record into staff with details as below:
-- staff_name-lalita, staff_id-116, staff_salary-1200, staff_type-security, staff_shift-2
INSERT INTO staff VALUES('Lalita', 116, 1200, 'security', 2);
DESC staff;

-- 5) Delete the above row which is inserted
DELETE FROM staff
WHERE staff_name='lalita' AND staff_id=116 AND staff_salary=1200
AND staff_type='security'AND staff_shift-2;

-- 6) Display all details of places whose name begins with ‘N’.
SELECT  * FROM staff WHERE staff_name LIKE 'N%';

-- 7) Display those food price whose price is in range of 200 and 300.
SELECT * FROM food_area WHERE food_price BETWEEN 200 AND 300;

-- 8) Find out footear shop whose brand name starts with ‘L’ and ends with ‘N’.
SELECT * FROM footwears WHERE brand_name LIKE 'L%N';

-- 9) Find out food are which are with screen 1, 2 and 3
SELECT * FROM food_area WHERE theater_screen_no in (1, 2, 3);

-- 10) Display details of those parking whose pilar number is less than 5 
SELECT *FROM parking WHERE park_pillar_no<5;

-- 11) Display all the game zone details sorted using card price
SELECT * FROM game_zone ORDER BY card_price DESC;

-- 12) Display all the rows from the footwears and only matching rows from the shop_info
SELECT * FROM footwears h left outer join shop_info d on h.shop_no = d.shop_no;

-- 13) Select average of food price of food area
 SELECT AVG(food_price) AS Average_food_price FROM food_area;
 
 -- 14) Select sum of all card prices
 SELECT SUM(card_price) AS Total_card_price FROM game_zone; 
 
 -- 15) Select minimum salary of staff
 SELECT MIN(staff_salary) AS Minimum_salary FROM staff;
 
 -- 16) Select maximum salary of staff
 SELECT MAX(staff_salary) AS Maximum_salary FROM staff;
 
 -- 17) Display the total food price of food area according to each theater screen number
 SELECT theater_screen_no, SUM(food_price) AS total_price FROM food_area GROUP BY 
theater_screen_no; 

-- 18) Select the total price of food area of screen 7
SELECT SUM(food_price) AS total_f_price FROM food_area WHERE theater_screen_no = 7;

-- 19) Display the no. of staff of each shift
SELECT staff_shift, COUNT(*) FROM staff GROUP BY staff_shift;

-- 20) Dislpay the essentials brand name which are not on the 3rd floor
SELECT brand_name FROM essentials WHERE shop_floor!= 3;

USE ll_capstone_db;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE order_status;
TRUNCATE TABLE order_details;
TRUNCATE TABLE bookings;

TRUNCATE TABLE orders;
TRUNCATE TABLE customers;
TRUNCATE TABLE staff;

TRUNCATE TABLE menu_items;
TRUNCATE TABLE menu;

SET FOREIGN_KEY_CHECKS = 1;

-- ==============================
-- MENU (3 rows)
-- ==============================
INSERT INTO menu (menu_name, description) VALUES
('Breakfast', 'Morning favorites and coffee'),
('Lunch', 'Sandwiches, salads, and midday specials'),
('Dinner', 'Full entrees and chef specials');

-- ==============================
-- MENU_ITEMS (15 rows)
-- ==============================
INSERT INTO menu_items (menu_id, item_name, category, cuisine, price, description) VALUES
(1, 'Buttermilk Pancakes', 'Entrée', 'American', 8.50, 'Stack of pancakes with maple syrup'),
(1, 'Eggs Benedict', 'Entrée', 'American', 10.75, 'Poached eggs and hollandaise on English muffin'),
(1, 'Avocado Toast', 'Entrée', 'Modern', 9.00, 'Sourdough with smashed avocado and chili flakes'),
(1, 'House Coffee', 'Drink', 'American', 2.75, 'Freshly brewed coffee'),
(1, 'Fresh Orange Juice', 'Drink', 'American', 3.50, 'Cold-pressed orange juice'),

(2, 'Grilled Chicken Sandwich', 'Main', 'American', 12.50, 'Grilled chicken breast with slaw'),
(2, 'Caesar Salad', 'Salad', 'Italian', 10.00, 'Romaine, parm, croutons'),
(2, 'Club Sandwich', 'Main', 'American', 11.95, 'Turkey, bacon, lettuce, tomato'),
(2, 'Tomato Basil Soup', 'Starter', 'Italian', 6.50, 'Creamy tomato with basil oil'),
(2, 'Iced Tea', 'Drink', 'American', 2.50, 'Brewed black iced tea'),

(3, 'Ribeye Steak', 'Main', 'American', 26.00, '12oz ribeye with chimichurri'),
(3, 'Spaghetti Carbonara', 'Main', 'Italian', 18.50, 'Guanciale, egg, pecorino'),
(3, 'Miso-glazed Salmon', 'Main', 'Japanese', 20.00, 'Salmon with miso glaze'),
(3, 'Garlic Mashed Potatoes', 'Side', 'American', 5.50, 'Creamy mashed potatoes'),
(3, 'Tiramisu', 'Dessert', 'Italian', 7.25, 'Coffee-soaked ladyfingers with mascarpone');

-- ==============================
-- CUSTOMERS (10 sample; final will be 50)
-- ==============================
INSERT INTO customers (first_name, last_name, customer_phone) VALUES
('Liam', 'Anderson', '512-555-0101'),
('Olivia', 'Bennett', '512-555-0102'),
('Noah', 'Carter', '512-555-0103'),
('Emma', 'Diaz', '512-555-0104'),
('Oliver', 'Edwards', '512-555-0105'),
('Ava', 'Foster', '512-555-0106'),
('Elijah', 'Garcia', '512-555-0107'),
('Sophia', 'Hughes', '512-555-0108'),
('Lucas', 'Iverson', '512-555-0109'),
('Mia', 'Jackson', '512-555-0110');

-- ==============================
-- STAFF (10 sample; final will be 40)
-- Note: Active employees now use '9999-12-31' as the active marker.
-- ==============================
INSERT INTO staff (first_name, last_name, phone, position, hired_on_date, termination_date) VALUES
('John', 'Smith', '512-555-0201', 'Manager', '2019-06-01', '9999-12-31'), -- Active
('Maria', 'Lopez', '512-555-0202', 'Server', '2020-09-15', '9999-12-31'), -- Active
('Ethan', 'Nguyen', '512-555-0203', 'Chef', '2018-11-10', '9999-12-31'), -- Active
('Grace', 'Taylor', '512-555-0204', 'Server', '2021-03-12', '9999-12-31'), -- Active
('Carlos', 'Ramos', '512-555-0205', 'Host', '2019-12-01', '2023-11-30'), -- Terminated
('Ashley', 'Miller', '512-555-0206', 'Busser', '2022-06-01', '9999-12-31'), -- Active
('Derek', 'Wang', '512-555-0207', 'Bartender', '2020-02-01', '2024-02-28'), -- Terminated
('Sofia', 'Patel', '512-555-0208', 'Server', '2024-07-10', '9999-12-31'), -- Active
('Miguel', 'Ortiz', '512-555-0209', 'Sous Chef', '2017-08-20', '9999-12-31'), -- Active
('Hannah', 'Reed', '512-555-0210', 'Dishwasher', '2023-01-05', '2024-07-01'); -- Terminated

-- ==============================
-- BOOKINGS (36 rows) — 6 NULL arrival_time (no-shows)
-- Bookings are roughly around orders; some arrivals NULL
-- ==============================
INSERT INTO bookings (customer_id, booking_time, arrival_time, num_guests) VALUES
(1, '2025-10-06 08:30:00', '2025-10-06 08:35:00', 2),
(2, '2025-10-06 12:00:00', '2025-10-06 12:05:00', 4),
(3, '2025-10-06 18:00:00', '2025-10-06 18:02:00', 3),
(4, '2025-10-07 19:00:00', '2025-10-07 19:02:00', 2),
(5, '2025-10-07 20:30:00', '2025-10-07 20:35:00', 5),
(6, '2025-09-30 11:45:00', '2025-09-30 11:50:00', 2),
(7, '2025-09-30 13:15:00', '2025-09-30 13:20:00', 3),
(8, '2025-09-29 18:30:00', '2025-09-29 18:31:00', 2),
(9, '2025-09-28 19:00:00', '2025-09-28 19:00:00', 6),
(10, '2025-09-27 12:00:00', '2025-09-27 12:02:00', 1),

-- additional bookings to reach 36
(1, '2025-09-26 18:00:00', '2025-09-26 18:05:00', 2),
(2, '2025-09-25 19:30:00', '2025-09-25 19:34:00', 2),
(3, '2025-09-24 13:00:00', '2025-09-24 13:05:00', 2),
(4, '2025-09-23 20:00:00', '2025-09-23 20:10:00', 3),
(5, '2025-09-22 18:30:00', '2025-09-22 18:35:00', 4),
(6, '2025-09-21 12:15:00', '2025-09-21 12:20:00', 2),
(7, '2025-09-20 18:45:00', '2025-09-20 18:50:00', 2),
(8, '2025-09-19 19:00:00', '2025-09-19 19:02:00', 5),
(9, '2025-09-18 12:30:00', '2025-09-18 12:30:00', 2),
(10, '2025-09-17 20:00:00', '2025-09-17 20:05:00', 3),

(1, '2025-09-16 18:00:00', '2025-09-16 18:03:00', 2),
(2, '2025-09-15 13:00:00', '2025-09-15 13:03:00', 1),
(3, '2025-09-14 19:30:00', '2025-09-14 19:35:00', 4),
(4, '2025-09-13 18:15:00', '2025-09-13 18:20:00', 2),
(5, '2025-09-12 20:00:00', '2025-09-12 20:10:00', 6),
(6, '2025-09-11 12:45:00', '2025-09-11 12:46:00', 2),

-- 6 no-shows (arrival_time = NULL)
(7, '2025-09-10 19:00:00', NULL, 4),
(8, '2025-09-09 18:30:00', NULL, 2),
(9, '2025-09-08 20:00:00', NULL, 3),
(10, '2025-09-07 12:00:00', NULL, 2),
(1, '2025-09-06 19:30:00', NULL, 5),
(2, '2025-09-05 18:00:00', NULL, 2);

-- ==============================
-- ORDERS (30 rows) — approx 3× customers (10 -> 30)
-- order_date roughly near booking_time when booking exists
-- ==============================
INSERT INTO orders (customer_id, order_date, table_num, payment_status) VALUES
(1, '2025-10-06 08:40:00', 5, 1),
(2, '2025-10-06 12:10:00', 12, 1),
(3, '2025-10-06 18:05:00', 8, 1),
(4, '2025-10-07 19:10:00', 3, 0),
(5, '2025-10-07 20:40:00', 9, 1),
(6, '2025-09-30 11:55:00', 2, 1),
(7, '2025-09-30 13:25:00', 6, 1),
(8, '2025-09-29 18:35:00', 4, 0),
(9, '2025-09-28 19:05:00', 10, 1),
(10, '2025-09-27 12:05:00', 7, 1),

(1, '2025-09-26 18:10:00', 11, 1),
(2, '2025-09-25 19:40:00', 8, 0),
(3, '2025-09-24 13:10:00', 5, 1),
(4, '2025-09-23 20:15:00', 9, 1),
(5, '2025-09-22 18:40:00', 2, 1),
(6, '2025-09-21 12:25:00', 3, 0),
(7, '2025-09-20 18:55:00', 1, 1),
(8, '2025-09-19 19:05:00', 6, 1),
(9, '2025-09-18 12:35:00', 4, 1),
(10, '2025-09-17 20:10:00', 10, 0),

(1, '2025-09-16 18:10:00', 5, 1),
(2, '2025-09-15 13:10:00', 12, 1),
(3, '2025-09-14 19:40:00', 8, 1),
(4, '2025-09-13 18:20:00', 2, 1),
(5, '2025-09-12 20:12:00', 9, 0),
(6, '2025-09-11 12:48:00', 3, 1),
(7, '2025-09-10 19:10:00', 7, 1),
(8, '2025-09-09 18:35:00', 4, 1),
(9, '2025-09-08 20:10:00', 11, 0),
(10, '2025-09-07 12:05:00', 6, 1);

-- ==============================
-- ORDER_DETAILS (68 rows) — Orders now have 1-5 line items
-- order_detail_id must be explicit
-- ==============================
INSERT INTO order_details (order_detail_id, order_id, menu_item_id, price_at_order, quantity, notes) VALUES
-- order 1 (3 items)
(1, 1, 4, 2.75, 1, NULL),
(2, 1, 1, 8.50, 1, NULL),
(3, 1, 2, 10.75, 1, 'No hollandaise'),

-- order 2 (5 items)
(4, 2, 6, 12.50, 1, NULL),
(5, 2, 7, 10.00, 1, NULL),
(6, 2, 10, 2.50, 2, 'Less ice'),
(7, 2, 8, 11.95, 1, NULL),
(8, 2, 5, 3.50, 1, NULL),

-- order 3 (2 items)
(9, 3, 11, 26.00, 1, 'Med rare'),
(10, 3, 15, 7.25, 1, 'Share'),

-- order 4 (4 items)
(11, 4, 12, 18.50, 2, NULL),
(12, 4, 14, 5.50, 1, NULL),
(13, 4, 15, 7.25, 1, NULL),
(14, 4, 13, 20.00, 1, 'No glaze'),

-- order 5 (3 items)
(15, 5, 11, 26.00, 1, NULL),
(16, 5, 3, 9.00, 1, NULL),
(17, 5, 4, 2.75, 2, NULL),

-- order 6 (1 item)
(18, 6, 1, 8.50, 1, NULL),

-- order 7 (5 items)
(19, 7, 6, 12.50, 2, NULL),
(20, 7, 7, 10.00, 1, NULL),
(21, 7, 9, 6.50, 1, 'No cream'),
(22, 7, 8, 11.95, 1, NULL),
(23, 7, 10, 2.50, 1, NULL),

-- order 8 (2 items)
(24, 8, 1, 8.50, 1, NULL),
(25, 8, 4, 2.75, 2, NULL),

-- order 9 (4 items)
(26, 9, 2, 10.75, 2, NULL),
(27, 9, 8, 11.95, 1, NULL),
(28, 9, 10, 2.50, 1, NULL),
(29, 9, 14, 5.50, 1, NULL),

-- order 10 (3 items)
(30,10, 7, 10.00, 1, NULL),
(31,10, 6, 12.50, 1, NULL),
(32,10, 4, 2.75, 1, NULL),

-- order 11 (2 items)
(33,11, 3, 9.00, 1, NULL),
(34,11, 6, 12.50, 1, NULL),

-- order 12 (4 items)
(35,12, 2, 10.75, 1, NULL),
(36,12, 7, 10.00, 1, NULL),
(37,12, 5, 3.50, 1, NULL),
(38,12, 9, 6.50, 1, NULL),

-- order 13 (5 items)
(39,13,11, 26.00, 1, NULL),
(40,13,14, 5.50, 1, NULL),
(41,13,15, 7.25, 1, NULL),
(42,13, 4, 2.75, 2, NULL),
(43,13, 5, 3.50, 1, NULL),

-- order 14 (3 items)
(44,14, 6, 12.50, 1, NULL),
(45,14, 7, 10.00, 1, NULL),
(46,14,10, 2.50, 1, NULL),

-- order 15 (2 items)
(47,15,11, 26.00, 1, NULL),
(48,15,12, 18.50, 1, NULL),

-- order 16 (1 item)
(49,16, 1, 8.50, 1, NULL),

-- order 17 (3 items)
(50,17, 6, 12.50, 1, NULL),
(51,17, 9, 6.50, 2, NULL),
(52,17, 3, 9.00, 1, NULL),

-- order 18 (2 items)
(53,18,11, 26.00, 1, NULL),
(54,18,15, 7.25, 1, NULL),

-- order 19 (4 items)
(55,19, 2, 10.75, 1, NULL),
(56,19, 7, 10.00, 1, NULL),
(57,19,10, 2.50, 2, NULL),
(58,19, 5, 3.50, 1, NULL),

-- order 20 (1 item)
(59,20, 1, 8.50, 1, NULL),

-- order 21 (3 items)
(60,21,11,26.00,1, NULL),
(61,21,14,5.50,1, NULL),
(62,21,15,7.25,1, NULL),

-- order 22 (2 items)
(63,22, 6,12.50,1, NULL),
(64,22, 7,10.00,1, NULL),

-- order 23 (3 items)
(65,23, 2,10.75,1, NULL),
(66,23, 3,9.00,1, NULL),
(67,23, 4,2.75,1, NULL),

-- order 24 (4 items)
(68,24,11,26.00,1, NULL),
(69,24,12,18.50,1, NULL),
(70,24,14,5.50,1, NULL),
(71,24,13,20.00,1, NULL),

-- order 25 (1 item)
(72,25, 1,8.50,1, NULL),

-- order 26 (3 items)
(73,26, 6,12.50,1, NULL),
(74,26, 7,10.00,1, NULL),
(75,26, 9,6.50,1, NULL),

-- order 27 (2 items)
(76,27,11,26.00,1, NULL),
(77,27,15,7.25,2, NULL),

-- order 28 (4 items)
(78,28, 3,9.00,1, NULL),
(79,28, 5,3.50,1, NULL),
(80,28,10,2.50,1, NULL),
(81,28, 4,2.75,1, NULL),

-- order 29 (5 items)
(82,29, 2,10.75,2, NULL),
(83,29,14,5.50,1, NULL),
(84,29,15,7.25,1, NULL),
(85,29, 3,9.00,1, NULL),
(86,29, 4,2.75,1, NULL),

-- order 30 (3 items)
(87,30,11,26.00,1, NULL),
(88,30,12,18.50,1, NULL),
(89,30, 4,2.75,1, NULL);

-- ==============================
-- ORDER_STATUS (30 rows) — one per order_id 1..30
-- Recent statuses (placed/preparing/ready) near order_date; others served/cancelled
-- ==============================
INSERT INTO order_status (order_id, employee_id, time_updated, current_status) VALUES
(1, 2, '2025-10-06 08:41:00', 'placed'),
(2, 2, '2025-10-06 12:11:00', 'preparing'),
(3, 3, '2025-10-06 18:06:00', 'ready'),
(4, 5, '2025-10-07 19:12:00', 'placed'),
(5, 1, '2025-10-07 20:42:00', 'served'),
(6, 6, '2025-09-30 11:57:00', 'served'),
(7, 7, '2025-09-30 13:27:00', 'served'),
(8, 3, '2025-09-29 18:36:00', 'preparing'),
(9, 1, '2025-09-28 19:06:00', 'served'),
(10,2, '2025-09-27 12:07:00', 'served'),
(11,1, '2025-09-26 18:12:00', 'served'),
(12,3, '2025-09-25 19:41:00', 'cancelled'),
(13,1, '2025-09-24 13:12:00', 'served'),
(14,2, '2025-09-23 20:17:00', 'served'),
(15,1, '2025-09-22 18:42:00', 'ready'),
(16,6, '2025-09-21 12:27:00', 'served'),
(17,7, '2025-09-20 18:57:00', 'served'),
(18,3, '2025-09-19 19:06:00', 'served'),
(19,1, '2025-09-18 12:37:00', 'served'),
(20,2, '2025-09-17 20:12:00', 'cancelled'),
(21,1, '2025-09-16 18:12:00', 'served'),
(22,2, '2025-09-15 13:12:00', 'served'),
(23,3, '2025-09-14 19:42:00', 'served'),
(24,1, '2025-09-13 18:22:00', 'served'),
(25,6, '2025-09-12 20:15:00', 'placed'),
(26,7, '2025-09-11 12:50:00', 'served'),
(27,3, '2025-09-10 19:12:00', 'ready'),
(28,1, '2025-09-09 18:36:00', 'served'),
(29,2, '2025-09-08 20:12:00', 'placed'),
(30,1, '2025-09-07 12:06:00', 'served');
-- Task 1: create a virtual table called OrdersView that focuses on OrderID, Quantity and Cost columns for orders with a quantity greater than 2. 
USE ll_capstone_db;
CREATE VIEW orders_view AS
SELECT order_id, quantity, price_at_order
FROM order_details
WHERE quantity > 2;

--------------------------------------------------------------
-- Task 2: all customers with orders that cost more than $150
--------------------------------------------------------------
-- View referenced in high_bill_customers:
CREATE VIEW order_totals AS
SELECT 
order_id,
SUM(price_at_order * quantity) as pretip_total,
SUM(quantity) as num_items
FROM order_details
GROUP BY order_id
ORDER BY pretip_total DESC;
-------------------------------
CREATE VIEW high_bill_customers AS
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS full_name, o.order_id, ot.pretip_total, ot.num_items
FROM customers c 
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_totals ot ON o.order_id = ot.order_id
WHERE ot.pretip_total > 150
ORDER BY ot.pretip_total DESC;

------------------------------------------------------------------------------
-- Task 3 : find all menu items for which more than 2 orders have been placed.
------------------------------------------------------------------------------
CREATE VIEW in_multiple_orders AS
SELECT menu_item_id, COUNT(order_id) as num_orders
FROM order_details
GROUP BY menu_item_id
HAVING
    COUNT(order_id) >2;

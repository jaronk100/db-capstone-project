DROP PROCEDURE get_max_quantity;

DELIMITER //
CREATE PROCEDURE get_max_quantity()
BEGIN
	SELECT menu_item_id, MAX(quantity) as Quantity
	FROM order_details
    GROUP BY menu_item_id
    ORDER BY Quantity DESC
    LIMIT 1;
END//
DELIMITER ;

-- ------------------------------------------------------
-- A Procedure to call up a customer's last order
-- ------------------------------------------------------
PREPARE get_order_detail FROM
'SELECT o.customer_id, o.order_date, o.order_id, SUM(od.quantity) AS total_items, SUM(quantity * price_at_order)
FROM orders AS o
INNER JOIN order_details AS od ON o.order_id = od.order_id
WHERE o.customer_id = ?
GROUP BY o.order_id
ORDER BY o.order_date 
LIMIT 1';

SET @id = 1;
EXECUTE get_order_detail USING @id;

DEALLOCATE PREPARE get_order_detail;

DELIMITER //
CREATE PROCEDURE cancel_order(IN order_id_input INT)
BEGIN
	DELETE FROM orders
	WHERE orders.order_id = order_id_input;
END//
DELIMITER ;

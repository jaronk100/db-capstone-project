-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////
-- Task 1 (modified): Data was populated previously using file Populate tables.sql
-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////


-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////
-- Task 2 (modified): I only included table numbers in my orders table, not bookings.
	-- In my experience, booking does not usually include selecting a specific table.
    -- As I don't want to recreate my schema, repopulate data, and push changes again, I've modified the task.
    -- I created a procedure to check if there are any large parties (> 6) booked for a particular day
-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////

DROP PROCEDURE large_bookings_report;
DELIMITER //
CREATE PROCEDURE large_bookings_report(IN date DATE)
	BEGIN
		DECLARE booking_count INT;
        DECLARE output_message VARCHAR(255);
        SELECT COUNT(bookings.booking_id) INTO booking_count
        FROM bookings
        WHERE DATE(bookings.booking_time) = date
        AND num_guests > 6;
        
        SET output_message = CONCAT("There are ", booking_count, " bookings with more that 6 guests on ", date, ".");
        SELECT output_message as "Report:";
	END//
DELIMITER ;

CALL large_bookings_report("2025-10-06");

-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////
-- Task 3 (modified): I only included table numbers in my orders table, not bookings.
	-- Instead of checking for a booked table, I'll check if a customer already has a booking near the proposed time.
-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////
DROP PROCEDURE IF EXISTS add_valid_booking;
DELIMITER //
CREATE PROCEDURE add_valid_booking(IN customerID_input INT, IN date_input DATETIME, IN num_guests_input INT)
	BEGIN
		DECLARE conflict_count INT;
        START TRANSACTION;
        
        SELECT COUNT(booking_id) into conflict_count
        FROM bookings
        WHERE customer_id = customerID_input
        AND ABS(TIMESTAMPDIFF(SECOND, date_input, booking_time)) < 10800; -- ABS() deals with neg or pos (before or after)
        
        IF conflict_count > 0 THEN
        SELECT CONCAT("Customer with id ", customerID_input, " already has a booking within 3 hours of proposed time.") AS "Report:";
        ROLLBACK;
        ELSE 
        INSERT INTO bookings(customer_id, booking_time, num_guests)
        VALUES(customerID_input, date_input, num_guests_input);
        COMMIT;
        SELECT CONCAT("A booking has been made for customer with id ", customerID_input, " at ", TIME(date_input), " on ", DATE(date_input)) AS "Report:";
        END IF;
	END//
DELIMITER ;

CALL add_valid_booking(3, "2025-10-09 18:00:00", 9);
SELECT COUNT(booking_id) FROM bookings;